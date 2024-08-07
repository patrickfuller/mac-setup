MacBook Configuration
=====================

Notes from installing on a fresh MacBook.

Desktop
-------

Mac System Preferences:

 * Trackpad -> increase tracking speed
 * Trackpad -> disable force click and enable silent click
 * Dock -> magnification
 * Dock -> automatically hide and show the Dock
 * Dock -> Disable show recent applications
 * Displays -> Night Shift -> enable

Multiple desktops:
 * Make four desktops by swiping up with three fingers, clicking the "add" button in the top right, then swiping back down. Use three-finger left-right swipe to switch between desktops.

Package manager
---------------

Homebrew for most items. Includes applications through `brew cask`.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Terminal
--------

Start with a better terminal to make the other installs more pleasant.

```
# Mac-based terminal emulator + font
brew install iterm2 font-source-code-pro

# oh-my-zsh for easy zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Open iterm2, and set some options to enable terminal overlay:

 * iTerm2 -> Settings
 * General -> Closing -> Quit when all windows are closed
 * General -> Window -> Uncheck Native full screen windows
 * Profiles -> Text -> Font -> 16pt Source Code Pro
 * Profiles -> Text -> Cursor -> Vertical bar
 * Profiles -> Colors -> Color Presets -> Tango Dark
 * Profiles -> Window -> Transparency -> 1/3 transparent
 * Profiles -> Window -> Style, Screen, Space -> Fullscreen, Main Screen, All Spaces
 * Profiles -> Terminal -> Scrollback Buffer -> Unlimited scrollback
 * Keys -> Hotkey -> alt+enter
    - Important: This is top-menu Keys - *not* Profiles -> Keys

Close out of all terminals, open iterm2. alt+enter should show/hide full-screen terminal overlay on all desktops.

Add basic tools and perks.

```
brew install vim zsh git wget diff-so-fancy zsh-syntax-highlighting
```

Dotfiles
--------

Copy `.zshrc`, `.vimrc`, and `.gitconfig` to home directory. This is a starting-point config that should be edited as desired.

Change user and email in `.gitconfig`. Also consider setting up a `.git-credentials` if you have an HTTP key.

Python
------

```
brew install miniconda
```

Touch ID
--------

Next, make Touch ID more useful. Enable more fingers and allow Touch ID wherever
text passwords are used.

System Preferences -> Touch ID to add both index fingers and thumb.

Follow [this SO post](https://apple.stackexchange.com/a/306324/43814) to allow
Touch ID to enable permission elevation.

```
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
```

Applications
------------

Use `brew` whenever possible. Using it inconsistently negates its benefits.

```
brew install visual-studio-code microsoft-office spotify google-chrome github
```

Log in to each program and set up as needed.

Python Development Config
-------------------------

Install linters, ipython terminal, atom packages.

```
conda install flake8 pep8-naming pycodestyle pydocstyle ipython twine
pip install flake8-docstrings
```

In VSCode, go to Extensions and install linters, language support, and anything else you find relevant.

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

Dock
----

Start by removing everything from the dock. Add:

 * Chrome
 * MS Word, Excel, Powerpoint
 * iTerm
 * VSCode, Github

Optionally, add Spotify, iMessage, FaceTime, iPhoto.

Windows Virtual Machine
-----------------------

I use Parallels for one-off windows-only software.

```
brew cask install parallels
```

Open and run through install. Log in to Parallels account.

Next, download whatever Windows-only software you need to run. My example is
[ClickPLC](https://support.automationdirect.com/products/clickplcs.html). I'm
including notes below that can be adapted to other software.

 * The ClickPLC software needs direct LAN access. Done with `Devices -> Network -> Bridged -> Wi-Fi`.
 * Once running, I like having it as a docked application. Lock the program to your dock and use `View -> Enter Coherence` to make it feel like a native app.
 * The default name and logo are ugly.
   - Downloaded [this image](https://cdn.automationdirect.com/images/products/large/l_c011dred.jpg).
   - Opened in GIMP, added alpha channel, and white to transparent with magic wand.
   - [This is poorly documented](https://discussions.apple.com/thread/8562625), but non-square images come out terrible on newer Macs. Close crop a square and export when done.
   - Open the current icon by right clicking in dock, `Options -> Show in Finder`. Right click icon, `Get Info`.
   - [The other trick](https://superuser.com/questions/605830/mac-get-info-always-showing-png-icon-instead-of-the-icon) is you need to copy-paste the image contents rather than the files. Open the exported image, select all, copy. Open the Info tab on the icon, left click the icon, then `Edit -> Paste`.
   - I also changed the name from `CLICK Programming Software Ver 2.30` to `ClickPLC`. I have no idea why people do these things.
