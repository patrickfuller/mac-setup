MacBook Configuration
=====================

Notes from installing on a fresh MacBook.

Desktop
-------

Mac System Preferences:

 * Trackpad -> increase tracking speed
 * Dock -> magnification
 * Dock -> automatically hide and show the Dock
 * Displays -> Night Shift -> enable

Multiple desktops and window snapping:
 * Make four desktops by swiping up with three fingers, clicking the "add" button in the top right, then swiping back down. Use three-finger left-right swipe to switch between desktops.
 * Install BetterSnapTool through the App Store. In settings, enable snap left, right, and full. Hotkey to ctrl+alt+left/right/up.

Package managers
----------------

Homebrew for most items. Includes applications through `brew cask`.

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Conda for user-level python environments.

```
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
```

Dotfiles
--------

Copy `.zshrc`, `.vimrc`, and `.gitconfig` to home directory. This is a starting-point config that should be edited as desired.

Change user and email in `.gitconfig`. Also consider setting up a `.git-credentials` if you have an HTTP key.

Terminal
--------

Start with some basic tools and perks.

```
brew install vim zsh git wget zsh-syntax-highlighting diff-so-fancy
```

Get iTerm2 and some add-ons.

```
# Mac-based terminal emulator
brew cask install iterm2

# Better font for terminal
brew tap caskroom/fonts
brew cask install font-source-code-pro

# oh-my-zsh for easy zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Open iterm2, and set some options to enable terminal overlay:

 * iTerm2 -> Preferences
 * General -> Quit when all windows are closed
 * Appearance -> Auto-hide menu bar in non-native fullscreen
 * Profiles -> Text -> Font -> 14pt Source Code Pro
 * Profiles -> Text -> Cursor -> Vertical bar
 * Profiles -> Colors -> Set blue to (50, 100, 255)
 * Profiles -> Window -> Transparency -> 1/3 transparent
 * Profiles -> Window -> Style, Screen, Space -> Fullscreen, Main Screen, All Spaces
 * Profiles -> Terminal -> Scrollback Buffer -> Unlimited scrollback
 * Keys -> Hotkey -> alt+enter

Close out of all terminals, open iterm2. alt+enter should show/hide full-screen terminal overlay on all desktops.

Applications
------------

Use `brew cask` whenever possible. Using it inconsistently negates its benefits.

```
brew cask install atom dropbox nordvpn microsoft-office spotify google-chrome github blender
```

Log in to each program and set up as needed.

Python Development Config
-------------------------

Install linters and ipython terminal.

```
conda install flake8 flake8-pep257 flake8-naming ipython
```

In atom, install `linter-flake8`.

SSH Config
----------

Open `~/.ssh/config` and enter each computer you want to connect.

```
ssh-keygen -t rsa
# Hit enter through options
brew install ssh-copy-id
ssh-copy-id server-name
ssh server-name
```

You should disable password authentication on all servers ([stackoverflow](https://stackoverflow.com/questions/20898384/ssh-disable-password-authentication)) after getting your keys set up. Tunneling between servers also helps, as you can copy around lines out of `~/.ssh/authorized_keys`.

