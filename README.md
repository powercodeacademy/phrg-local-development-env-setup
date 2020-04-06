# Mac OSX Manual Environment Set Up

## Step 1 - Uninstall the Learn IDE

For detailed instructions on how to properly uninstall the IDE, please follow [this Help Center article](http://help.learn.co/the-learn-ide/ide-settings/deleting-the-ide).

## Step 2 - Download iTerm2 & Xcode

In computing, a `shell` is a user interface for access to an operating system's services. In general, operating system shells use either a command-line interface (CLI) or graphical user interface (GUI), depending on a computer's role and particular operation. We are accustomed to the Mac GUI because that is all we have known.

The built in CLI shell for Macs is called Terminal. Throughout this course, learn.co lessons will refer to your shell as "terminal" because that is what is baked in. However, we are going to install a better shell system called iTerm2.

[Click the 'Download' button in this link](https://www.iterm2.com/) to install iTerm2. Double click on zip file it installs, then open the application. Right click on the iTerm icon in your Dock and select Options -> Keep in Dock. Make sure iTerm2 is in your Applications folder on your computer.

In your shell session, type `xcode-select --install` to install the Xcode command line tools.
If you get a message that the command line tools are already installed, that is fine.

## Step 3 - Install Homebrew

Install the Homebrew package manager. You can do this by entering the following command into your shell:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Note, this is all one line in the shell even if it is broken up into two lines here in your browser.

## Step 4 - Get git and set it up

1. Make sure you have [git](https://git-scm.com/downloads). It generally comes pre-installed with most operating systems, but you can check by running `git version` in your shell session. If this gives you an error or does not come back with version number, you'll need to install git. You can get it by typing `brew install git` into your shell.
1. Run `ssh-keygen` to create a new SSH key. If you do not already have an SSH key setup, you’ll be asked to select a location and a passphrase. Just leave everything blank and press enter for default location and no passphrase. If you’re asked if you want to overwrite, then you already have an SSH key and you do not want to overwrite it.
1. `cat ~/.ssh/id_rsa.pub` will display your SSH key to your shell. You want to then copy this and add this SSH key to your github by following [these instructions posted on GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/).

You are also going to want to let the git that is running on your machine to know you you are. You can set this up by running: `git config --global user.email "you@example.com"` and `git config --global user.name "Your Name"`.

## Step 5 - Support Libraries

Next we’re going to add a few support libraries with the following lines: `brew install gmp` and `brew install gnupg`. Note: If you get the following error: `Warning: gnupg-1.4.19 already installed`, it’s just not linked up. So simply run: `brew link gnupg`.

## Step 6 - Install asdf-vm

[asdf-vm](https://asdf-vm.com/#/core-manage-asdf-vm) is a great tool that lets you run different versions of multiple libraries on your computer. This is useful because if you know one project you're working on works with Ruby version 2.5.1 and another needs 2.6.0, you can easily switch between them. You can install it and set it up with the following commands:

1. Run `brew install asdf`
1. Run `echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile`
1. Run `echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile`

## Step 7 - Install Ruby

1. Run `asdf plugin add ruby`
1. Run `asdf install ruby 2.5.0`
1. Check that everything worked by running `ruby -v`. This should output the version of Ruby you’re using (2.5.0). To list the versions of Ruby you have available, run `asdf list ruby`.

## Step 8 - Install NodeJS

1. Run `asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git`
1. Run `bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring`
1. Run `asdf install nodejs 10.17.0`
1. Check that everything worked by running `node -v`. This should output the version of NodeJS you’re using (10.17.0). To list the versions of NodeJS you have available, run `asdf list nodejs`.

## Step 9 - Install Yarn

1. Run `asdf plugin add yarn`
1. Run `asdf install yarn 1.13.0`
1. Check that everything worked by running `yarn -v`. This should output the version of Yarn you’re using (1.13.0). To list the versions of Yarn you have available, run `asdf list yarn`.

## Step 10 - Install some Ruby gems

Ruby gems are pre-written, stand-alone, chunks of code that have been made easily accessible to you.

1. First, let's update our system gems with: `gem update --system`
1. Install the Learn gems. Do this with: `gem install learn-co`
1. Install the gem bundler. This gem takes care of installing all the other gems you need for projects: `gem install bundler`

## Step 11 - Set up the Learn gem

Now we need to setup the Learn gem. Type the following into your shell session: `learn whoami`

This will prompt you to set up the Learn gem.

Note: When the gem asks you to go to `learn.co/your-github-username`, you must fill your username into the URL AND be logged in to be able to retrieve your token.

## Step 12 - Get a Text Editor

[Use this link](https://code.visualstudio.com/) to install the VSCode's stable build for MacOS.

Once opened, click on the last icon on the left hand bar that is made up of 4 squares. From here you can download Extensions. Download `Live Share` and `VSCode Ruby`.

## Step 13 - Install some more gems!

1. Phantom JS is a JavasScript library and this Ruby gem easily installs it for you: `gem install phantomjs`
1. Nokogiri is a gem that let’s us scrape websites and you’ll definitely want to be able to use it. Let’s install it with: `gem install nokogiri`. If you encounter any errors while install this gem, check out the Nokogiri support docs for Mac OSX installs.

## Step 14 - Get some databases

You’ll be using a couple of different databases as you move through the web development track. The default database that rails uses is SQLite. We also frequently see that students want to deploy their apps to the free hosting service [Heroku](https://signup.heroku.com/). To do this though, you’ll need to be using Postgres instead. It’s best if we just install both of them now so you can use either one.

1. SQLite: `brew install sqlite`
1. Postgres: Install the Postgres app at: [Postgres.app](http://postgresapp.com/)

## Step 15 - Install Rails

The powerful Ruby web framework. We can install that with: `gem install rails`

## Step 16 - Bash Config

Your `.bashrc` and `.bash_profile` load up every time you open a shell window. Power's bash config files are designed to add some shell shortcuts, make sure that asdf-vm plugins load up properly, and provide a more informative shell prompt.

If when you’re trying to back up the files you get the error ‘No such file or directory’, don’t worry. This just means you didn’t have one of these files to start with, so there is nothing to backup.

1. Back up your .bashrc file with `mv ~/.bashrc{,.bak}`
1. Back up your .bash_profile file with `mv ~/.bash_profile{,.bak}`
1. Run `curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "$HOME/.git-completion.bash"`
1. Run `curl "https://raw.githubusercontent.com/powerhome/phrg-local-development-env-setup/master/bashrc" -o "$HOME/.bashrc"`
1. Run `curl "https://raw.githubusercontent.com/powerhome/phrg-local-development-env-setup/master/bash_profile" -o "$HOME/.bash_profile"`

Once the above commands have been run, start a new shell session.

## Step 17 - Java

Install Java Next, we’ll want to install the latest version of the Java Development Kit. To get that, head on over to the [download page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) and select the Java SE Development Kit for Mac OSX and install it.

## Step 18 - Faster cursor navigation

(Optional) Turn up your key repeat. Open `System Preferences` by clicking the apple icon in the top left corner of your screen and selecting `System Preferences`. Then Click `Keyboard` and make sure both `Key Repeat` and `Delay Until Repeat` are turned up all the way. This will allow you to move your cursor through text much faster. This is very useful working in a command line interface.
