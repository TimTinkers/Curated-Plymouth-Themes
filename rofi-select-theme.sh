#!/usr/bin/env bash

## This script displays a Rofi menu for selecting a Plymouth theme.
## @author Tim Clancy
## @date 8.22.2020

## Use our Rofi password helper to ask for the sudo password.
export SUDO_ASKPASS=/usr/local/bin/rofi-ask-password.sh

## Configuration defaults.
FONT="DejaVu Sans Mono 12"

## Find the list of available Plymouth themes.
USER_NAME=$(ls /home -1 | shuf -n1)
THEMES=$(ls -F -1 /home/$USER_NAME/.tiel-standard/Tiel-Standard-Configuration/Curated-Plymouth-Themes/ | grep / | rev | cut -c2- | rev)

## Format the list of themes for display.
## Make sure the current theme is always at the top of the list.
CURRENT_THEME=$(plymouth-set-default-theme)
IFS=$'\n'
PREFIX=$'THEME NAME\n'
THEME_LIST=""
while IFS= read -r line; do
	if [ "$line" = "$CURRENT_THEME" ]; then
		line+=$'\n'
		PREFIX+=$line
	else
		line+=$'\n'
		THEME_LIST+=$line
	fi
done <<< "$THEMES"
THEMES=$(echo "$PREFIX$THEME_LIST" | sed '$d')

## Get the currently-active theme if one exists and highlight it.
if [[ ! -z $CURRENT_THEME ]]; then
	HIGHLINE=1
fi

## Dynamically change the size of the Rofi menu, with a cap on displayed themes.
## Rofi seems to require some text padding dependent on our font size.
R_WIDTH=$(($(echo "$THEMES" | head -n 1 | awk '{print length($0); }')+32))
LINE_COUNT=12

## Grab the user's chosen theme entry.
CHENTRY=$(echo -e "$THEMES" | uniq -u | rofi -dmenu -p "Plymouth Theme" -lines "$LINE_COUNT" -a "$HIGHLINE" -font "$FONT" -width -"$R_WIDTH")
CHTHEME=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $1}')

## Support updating the theme.
if [ "$CHTHEME" != "" ]; then
	sudo -A cp -r ~/.tiel-standard/Tiel-Standard-Configuration/Curated-Plymouth-Themes/$CHTHEME /usr/share/plymouth/themes/
	sudo -A plymouth-set-default-theme -R $CHTHEME
fi
