# Mac OSX Manual Environment Set Up

## Step 1 - Uninstall the Learn IDE

For detailed instructions on how to properly uninstall the IDE, please follow [this Help Center article](http://help.learn.co/the-learn-ide/ide-settings/deleting-the-ide).

## Step 2 - Download Xcode Command Line Tools

Open up your Terminal. This is where we are going to be doing most of our installation steps! You can open up your terminal by going to Applications > Utilities > Terminal, or by using the quick launch (cmd + space) and just start typing “Terminal”.

In terminal, type `xcode-select --install` to install the Xcode command line tools.
If you get a message that the command line tools are already installed, that is fine.

## Step 3 - Install Homebrew

Install the Homebrew package manager. You can do this by entering the following command into your terminal:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Note, this is all one line in the terminal even if it is broken up into two lines here in your browser.

## Step 4 - Get git and set it up

1. Make sure you have [git](https://git-scm.com/downloads). It generally comes pre-installed with most operating systems, but you can check by running `git version` in your shell session. If this gives you an error or does not come back with version number, you'll need to install git. You can get it by typing `brew install git` into your terminal.
1. Run `ssh-keygen` to create a new SSH key. If you do not already have an SSH key setup, you’ll be asked to select a location and a passphrase. Just leave everything blank and press enter for default location and no passphrase. If you’re asked if you want to overwrite, then you already have an SSH key and you do not want to overwrite it.
1. `cat ~/.ssh/id_rsa.pub` will display your SSH key to your terminal. You want to then copy this and add this SSH key to your github by following [these instructions posted on GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/).

You are also going to want to let the git that is running on your machine to know you you are. You can set this up by running: `git config --global user.email "you@example.com"` and `git config --global user.name "Your Name"`.

## Step 5 - Support Libraries

Next we’re going to add a few support libraries with the following lines: `brew install gmp` and `brew install gnupg`. Note: If you get the following error: `Warning: gnupg-1.4.19 already installed`, it’s just not linked up. So simply run: `brew link gnupg`.

## Step 6 - Install Ruby Version Manager

[RVM](http://rvm.io/) is a great tool that lets you run different versions of Ruby on your computer. This is really useful because if you know one project you're working on works with Ruby version 2.3.3 and another needs 2.5.1, you can easily switch between the two versions when you switch between projects. You can install it and set it up with the following commands:

1. Run `curl -sSL https://get.rvm.io | bash`
1. ONCE THIS STEP COMPLETES, CLOSE AND RE-OPEN YOUR TERMINAL. If you skip this step, RVM will not work.
1. Run `rvm install 2.5.1`
1. Run `rvm use 2.5.1 --default`
1. Check that everything worked by running `ruby -v` and `rvm list`. This should output the version of Ruby you’re using (2.5.1) and the list of versions available with your RVM install.

## Step 7 - Install some Ruby gems

Ruby gems are pre-written, stand-alone, chunks of code that have been made easily accessible to you.

1. First, let's update our system gems with: `gem update --system`
1. Install the Learn gems. Do this with: `gem install learn-co .`
1. Install the gem bundler. This gem takes care of installing all the other gems you need for projects: `gem install bundler`

## Step 8 - Set up the Learn gem

Now we need to setup the Learn gem. Type the following into your terminal: `learn whoami`

This will prompt you to set up the Learn gem.

Note: When the gem asks you to go to `learn.co/your-github-username`, you must fill your username into the URL AND be logged in to be able to retrieve your token.

## Step 9 - Get a Text Editor

[Use this link](https://www.sublimetext.com/3) to install Sublime Text for OS X. Drag Sublime into your Applications folder and verify it is there.

Open up Sublime and open its "Package Control". You can reach this dropdown prompt through Preference -> Package Control, or with Command+Shift+P. Type "Install Package" then click on that selection from the dropdown.

The next dropdown is a list of extensions you can add to Sublime. Clicking on a selection installs the package. Repeat this process until all the following packages are installed:

1. GitGutter
1. Babel
1. SublimeERB
1. SyncedSideBar
1. BracketHighlighter
1. Sass
1. ReactJS
1. RailsGoToSpec
1. JavaScriptNext - ES6 Syntax
1. Theme - SoDaReloaded

Next, go to Preferences -> Settings. A new text editor window will pop up with 2 sides. The left side is locked options that are Sublime defaults. The right side is what you will edit. Replace the entire right side with this exact content:

```js
{
  "color_scheme": "Packages/JavaScriptNext - ES6 Syntax/Monokai Phoenix.tmTheme",
  "draw_white_space": "all",
  "ensure_newline_at_eof_on_save": true,
  "folder_exclude_patterns":
  [
    ".git",
    ".vagrant",
    "coverage",
    "log",
    "vendor"
  ],
  "font_size": 15,
  "hide_minimap": true,
  "highlight_modified_tabs": true,
  "ignored_packages": ["Vintage"],
  "show_definitions": false,
  "show_full_path": true,
  "soda_classic_tabs": true,
  "tab_size": 2,
  "theme": "SoDaReloaded Dark.sublime-theme",
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true,
  "word_wrap": true
}
```

## Step 10 - Install some more gems!

1. Phantom JS is a JavasScript library and this Ruby gem easily installs it for you: `gem install phantomjs`
1. Nokogiri is a gem that let’s us scrape websites and you’ll definitely want to be able to use it. Let’s install it with: `gem install nokogiri`. If you encounter any errors while install this gem, check out the Nokogiri support docs for Mac OSX installs.

## Step 11 - Get some databases

You’ll be using a couple of different databases as you move through the web development track. The default database that rails uses is SQLite. We also frequently see that students want to deploy their apps to the free hosting service [Heroku](https://signup.heroku.com/). To do this though, you’ll need to be using Postgres instead. It’s best if we just install both of them now so you can use either one.

1. SQLite: `brew install sqlite`
1. Postgres: Install the Postgres app at: [Postgres.app](http://postgresapp.com/)

## Step 12 - Install Rails

The powerful Ruby web framework. We can install that with: `gem install rails`

## Step 13 - Bash Config

Your `.bashrc` and `.bash_profile` load up every time you open a terminal window. Power's bash config files are designed to add some shell shortcuts, make sure that RVM loads up properly, and provide a more informative shell prompt.

If when you’re trying to back up the files you get the error ‘No such file or directory’, don’t worry. This just means you didn’t have one of these files to start with, so there is nothing to backup.

1. Back up your .bashrc file with `mv ~/.bashrc{,.bak}`
1. Back up your .bash_profile file with mv `~/.bash_profile{,.bak}`
1. Run `curl "https://raw.githubusercontent.com/powerhome/phrg-local-development-env-setup/master/bashrc" -o "$HOME/.bashrc"`
1. Run `curl "https://raw.githubusercontent.com/powerhome/phrg-local-development-env-setup/master/bash_profile" -o "$HOME/.bash_profile"`

Once the above commands have been run, start a new terminal session.

## Step 14 - Node

Now let’s get your node version manager installed. Node is a package manager for JavaScript.

1. Run `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash` on terminal.
1. Run `source ~/.bash_profile`. This will refresh your shell after making these changes. This way you won't have to quit terminal and open it again.
1. Finally, run `nvm install 6.11.2` to install Node.js (`nvm` stands for Node Version Manager).

## Step 15 - Java

Install Java Next, we’ll want to install the latest version of the Java Development Kit. To get that, head on over to the [download page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) and select the Java SE Development Kit for Mac OSX and install it.

## Step 16 - Faster cursor navigation

(Optional) Turn up your key repeat. Open `System Preferences` by clicking the apple icon in the top left corner of your screen and selecting `System Preferences`. Then Click `Keyboard` and make sure both `Key Repeat` and `Delay Until Repeat` are turned up all the way. This will allow you to move your cursor through text much faster. This is very useful working in a command line interface.
