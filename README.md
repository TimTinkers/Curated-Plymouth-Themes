# Curated Plymouth Themes

This is a collection of Tim's curated Plymouth themes. Currently, all of the themes have been sourced from [Aditya Shakya](https://github.com/adi1090x)'s [Plymouth Themes](https://github.com/adi1090x/plymouth-themes) repository. Please consider supporting his hard work.

<p align="center">
<a href="https://www.buymeacoffee.com/adi1090x"><img src="https://raw.githubusercontent.com/adi1090x/files/master/other/1.png" alt="Buy Me A Coffee"></a>
<a href="https://ko-fi.com/adi1090x"><img src="https://raw.githubusercontent.com/adi1090x/files/master/other/2.png" alt="Support me on ko-fi"></a>
<a href="https://www.paypal.me/adi1090x"><img src="https://raw.githubusercontent.com/adi1090x/files/master/other/3.png" alt="Support me on Paypal"></a>
<a href="https://www.patreon.com/adi1090x"><img src="https://raw.githubusercontent.com/adi1090x/files/master/other/4.png" alt="Support me on Patreon"></a>
</p>

## What is Plymouth?

[Plymouth](http://www.freedesktop.org/wiki/Software/Plymouth) is a project from Fedora and now listed among the [freedesktop.org's official resources](https://www.freedesktop.org/wiki/Software/#graphicsdriverswindowsystemsandsupportinglibraries) providing a flicker-free graphical boot process. It relies on [kernel mode setting](https://wiki.archlinux.org/index.php/Kernel_mode_setting) to set the native resolution of the display as early as possible, then provides an eye-candy splash screen leading all the way up to the login manager.

## Usage

Enter the following commands to specify a theme, for example `angular`:
```bash
sudo cp -r angular /usr/share/plymouth/themes/
sudo plymouth-set-default-theme -R angular
```
