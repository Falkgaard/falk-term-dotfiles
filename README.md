# falk-term-dotfiles
Collection of personal terminal-related dotfiles for:
* [KiTTy terminal](https://sw.kovidgoyal.net/kitty/)
* [fish shell](https://fishshell.com/)
* [Starship prompt](https://starship.rs/)
* etc...

# Usage:

* Install the terminal, shell, and prompt listed above
* Clone the repo
* Put the files in your `~/.config/` or equivalent (or symlink to them). Might have to change some paths if this is not the case, e.g. background image in kitty.conf

As for the font, you might have to change that in the kitty.conf (or download the font I'm using from [nerd fonts](https://github.com/ryanoasis/nerd-fonts))

# TODO:

* Clean up files...

* Add screenshots/gif demo?

* Add more dotfiles?

* ...

# Disclaimer:
There are a lot of garbage in these that are either hard-coded for my personal needs, WIP, legacy left-overs, half-assed, or in need of porting and/or proper integration (e.g. old bash/zsh stuff that I haven't adapted to fish yet).

Also, my system consists of Linux (Manjaro running sxhkd+bspwm+picom+nvim+etc...), so I'm not quite sure how portable certain things will be to systems running Mac, Windows Terminal, etc. (Also, if there's any interest, I might start adding more dotfiles here later on.)

So use these dotfiles at your own risk (but feel free to modify them as you see fit).

But if you do extend, say, the Starship configuration in a style-compliant way to support the things that I haven't bothered with adding theming for, please let me know and I might add them for future interested parties. 👍

And please report any bugs you find. Thanks!
