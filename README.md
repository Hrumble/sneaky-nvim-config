# My very own nvim config woohoo!

I always wanted to get into nvim because it looked fun, but never really found the time or interest.
Recently however, I have, and had to learn all about it.

This is more of a "Learning nvim configuration" thing than "Learning nvim" itself.

This **readme** file is mainly for me, as I would just like to not lose my config, as well as not get lost the next time I explore it.
So, if you're here for a nvim tutorial or an indepth guide, I can assure you this is very much the wrong place to be, you will not understand anything, and I will be wrong.
rather check out [typecraft_dev](https://www.youtube.com/@typecraft_dev) which has a very useful playlist on getting started with nvim.

## Installation

### Linux
On linux, it's pretty straightforward, simply clone the repository and move it to your user config:
```sh
git clone https://github.com/Hrumble/sneaky-nvim-config ~/.config/nvim
```
### Windows
On windows, it's a bit more complicated:

Firstly, download `clang` either via [LLVM](https://releases.llvm.org/) (but that would require you installing the standard C libraries), or use [MSYS2](https://www.msys2.org/), and install it.
Once installed launch mingw64 and type in:
```sh
pacman -Syu
```

Restart the terminal, then:
```sh
pacman -S mingw-w64-x86_64-toolchain mingw-w64-x86_64-clang

```
Inside your *MSYS2 Installation directory* you should find a `mingw64/bin/` folder, add that to path, then you're good to go.

All that's left is cloning the repo and adding it to your nvim config directory, which is usually at `%LOCALAPPDATA%/nvim/`.

*on pwsh*
```
git clone https://github.com/Hrumble/sneaky-nvim-config $ENV:LOCALAPPDATA/nvim/
```

*on cmd*
```
git clone https://github.com/Hrumble/sneaky-nvim-config %LOCALAPPDATA%/nvim/
```

## Lazy package manager

First off, the entire config is built on [Lazy](https://github.com/folke/lazy.nvim) which is a package manager for vim.
the config of lazy itself is located in `/lua/sneaky/lazy.lua` and comprises of shameful copy and paste from the official github page.

the line that actually sets up each individual *package* is the following

```lua
require("lazy").setup("sneaky.plugins")
```
And it basically tells Lazy to load every `.lua` file inside `~/.config/nvim/lua/sneaky/plugins/`, so far so good.

## Actually adding a package

Great so if you ever want to install a package later, just create a new `.lua` file inside `~/.config/nvim/lua/sneaky/plugins/`, name it however you want, neither I nor lazy will care, and add the package in that file

Every package follows the same syntax, for instance my gruvbox theme inside `colorscheme.lua` looks like:
```lua
return {
	'morhetz/gruvbox', 
	name="gruvbox", 
	priority = 1000, 
	config = function() 
		-- sets gruvbox as the color theme
		vim.cmd.colorscheme("gruvbox")
	end
}
```

Check out the other packages and see they all follow the same basic syntax:
```lua
return {
    'github/repo',
    'ihavenocluewhatthisnameisusedfor',
    priority = 1000, --The loading priority of this package
    config = function()
        -- Whatever you write here will execute when this package gets loaded
    end
}
```


