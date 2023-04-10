# myTerminal's .emacs.d

[![License: CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)  
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Y8Y5E5GL7)

My personal Emacs configuration, finally as a separate repository

> **Note:** This project has been deprecated in favor of [super-emacs](https://github.com/myTerminal/super-emacs).

## History

I remember putting up my first Emacs configuration on GitHub during my earlier days with [Git](https://git-scm.com) in 2014 with an intention to sync my configs across computers (most of which were Windows PCs back then) while learning Git at the same time. It looked like [this](https://github.com/myTerminal/dotfiles/tree/b384107562817ef181111c8c27bccaaa47614975) when it started, which clearly shows my plans for creating multiple configs along with my 'Standard' one.

Funny enough, I learned that there already existed this practice of sharing one's Emacs configuration as a public repository on GitHub soon *after* I shared mine. Nevertheless, I realized it was the *community accepted* way to do it and I kept building it since then.

A few months into it, I ended up adding other configs not related to Emacs and soon realized that it's not only about Emacs anymore and renamed it to *dotfiles*, which is the name by which that [old repository](https://github.com/myTerminal/dotfiles) can still be found. There came a lot of other configuration for Bash, [i3wm](https://i3wm.org), Git itself, and even complete workstation setups for multiple operating platforms. I've been syncing it across almost all of my work computers as well. Even though the repository contained so much more than just Emacs configuration, the number of commits made specifically for Emacs made up more than half of all commits made to the repository every day.

Rather than making commit messages longer by adding phrases like "for Emacs" for every commit, I decided to split my Emacs configuration into a separate repository once again as [.emacs.d](https://github.com/myTerminal/.emacs.d), which is the project that you're looking at right now.

## Contents

Not all of my Emacs configuration moved out of [dotfiles](https://github.com/myTerminal/dotfiles.git). There's still a tiny script to load a 'compatible' configuration to use following a prompt at startup.

Obviously, the configuration contained in this repository has been designed to be able to be plugged right into my dotfiles through [this init.el](https://github.com/myTerminal/dotfiles/blob/master/.config/emacs/init.el), just like my other tiny Emacs starter-kits [super-emacs](https://github.com/myTerminal/super-emacs) and [ample-emacs](https://github.com/myTerminal/ample-emacs) have been designed to.

## External dependencies

###  [aspell](http://aspell.net) for spell-check

The configuration checks for the presence of this package and sets up `ispell` to work with it for spell-check. Refer to [the official site](http://aspell.net) for instructions on how to install it on your operating system.

## References
- [My dotfiles](https://github.com/myTerminal/dotfiles) - The 'replicable' heart of my computer(s) and a host for this Emacs configuration
- [super-emacs](https://github.com/myTerminal/super-emacs) - An out-of-the-box Emacs configuration with super-powers
- [ample-emacs](https://github.com/myTerminal/ample-emacs) - 'Just enough' Emacs configuration with minimal external packages
