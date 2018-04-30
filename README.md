# Mac OSX Manual Environment Set Up

## Step 1 - Uninstall the Learn IDE

For detailed instructions on how to properly uninstall the IDE, please follow [this Help Center article](http://help.learn.co/the-learn-ide/ide-settings/deleting-the-ide).

## Step 2 - Download Xcode Command Line Tools

Open up your Terminal. This is where we are going to be doing most of our installation steps! You can open up your terminal by going to Applications > Utilities > Terminal, or by using the quick launch (cmd + space) and just start typing “Terminal”.

In terminal, type `xcode-select --install` to install the Xcode command line tools.
If you get a message that the command line tools are already installed, that is fine.

Step 3 - Install Homebrew

Install the Homebrew package manager. You can do this by entering the following command into your terminal:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Note, this is all one line in the terminal even if it is broken up into two lines here in your browser.

Step 4 - Get git and set it up

1. Make sure you have [git](https://git-scm.com/downloads). It generally comes pre-installed with most operating systems, but you can check by running `git version` in your shell session. If this gives you an error or does not come back with version number, you'll need to install git. You can get it by typing `brew install git` into your terminal.
1. Run `ssh-keygen` to create a new SSH key. If you do not already have an SSH key setup, you’ll be asked to select a location and a passphrase. Just leave everything blank and press enter for default location and no passphrase. If you’re asked if you want to overwrite, then you already have an SSH key and you do not want to overwrite it.
1. `cat ~/.ssh/id_rsa.pub` will display your SSH key to your terminal. You want to then copy this and add this SSH key to your github by following [these instructions posted on GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/).

You are also going to want to let the git that is running on your machine to know you you are. You can set this up by running: `git config --global user.email "you@example.com"` and `git config --global user.name "Your Name"`.

Step 5 - Support Libraries

Next we’re going to add a few support libraries with the following lines: `brew install gmp` and `brew install gnupg`. Note: If you get the following error: `Warning: gnupg-1.4.19 already installed`, it’s just not linked up. So simply run: `brew link gnupg`.

Step 6 - Install Ruby Version Manager

[RVM](http://rvm.io/) is a great tool that lets you run different versions of Ruby on your computer. This is really useful because if you know one project you're working on works with Ruby version 2.3.3 and another needs 2.5.1, you can easily switch between the two versions when you switch between projects. You can install it and set it up with the following commands:

1. Run `curl -sSL https://get.rvm.io | bash`
1. ONCE THIS STEP COMPLETES, CLOSE AND RE-OPEN YOUR TERMINAL. If you skip this step, RVM will not work.
1. Run `rvm install 2.5.1`
1. Run `rvm use 2.5.1 --default`
1. Check that everything worked by running `ruby -v` and `rvm list`. This should output the version of ruby you’re using (2.5.1) and the list of versions available with your RVM install.

Step 7 - Install some ruby gems

Ruby gems are pre-written, stand-alone, chunks of code that have been made easily accessible to you.

1. First, let's update our system gems with: `gem update --system`
1. Install the Learn gems. Do this with: `gem install learn-co .`
1. Install the gem bundler. This gem takes care of installing all the other gems you need for projects: `gem install bundler`

Step 8 - Set up the Learn gem

Now we need to setup the Learn gem. Type the following into your terminal: `learn whoami`

This will prompt you to set up the Learn gem.

Note: When the gem asks you to go to `learn.co/your-github-username`, you must fill your username into the URL AND be logged in to be able to retrieve your token.

Step 9 - Get a Text Editor

WIP

Step 10 - Install some more gems!

1. Phantom JS is a JavasScript library and this ruby gem easily installs it for you: `gem install phantomjs`
1. Nokogiri is a gem that let’s us scrape websites and you’ll definitely want to be able to use it. Let’s install it with: `gem install nokogiri`. If you encounter any errors while install this gem, check out the Nokogiri support docs for Mac OSX installs.

Step 11 - Get some databases

You’ll be using a couple of different databases as you move through the web development track. The default database that rails uses is SQLite. We also frequently see that students want to deploy their apps to the free hosting service [Heroku](https://signup.heroku.com/). To do this though, you’ll need to be using Postgres instead. It’s best if we just install both of them now so you can use either one.

1. SQLite: `brew install sqlite`
1. Postgres: Install the Postgres app at: [Postgres.app](http://postgresapp.com/)

Step 12 - Install Rails

The powerful ruby web framework. We can install that with: `gem install rails`

Step 13 - Dotfiles

WIP

Step 14 - Node

Now let’s get your node version manager installed. Node is a package manager for JavaScript.

1. Run `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash` on terminal.
1. Then run `echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile`
1. As well as `echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ~/.bash_profile`
1. Run `source ~/.bash_profile`. This will refresh your shell after making these changes. This way you won't have to quit terminal and open it again.
1. Finally, run `nvm install 6.11.2` to install Node.js (`nvm` stands for Node Version Manager).

Step 15 - Java

Install Java Next, we’ll want to install the latest version of the Java Development Kit. To get that, head on over to the [download page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) and select the Java SE Development Kit for Mac OSX and install it.

Step 16 - (Optional) Turn up your key repeat. Open `System Preferences` by clicking the apple icon in the top left corner of your screen and selecting `System Preferences`. Then Click `Keyboard` and make sure both `Key Repeat` and `Delay Until Repeat` are turned up all the way. This will allow you to move your cursor through text much faster. This is very useful working in a command line interface.
