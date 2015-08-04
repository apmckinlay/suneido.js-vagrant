# Quick Start

1. Install [VirtualBox](http://www.virtualbox.org/)
2. Install [Vagrant](https://docs.vagrantup.com/v2/installation/)
3. Set up the Vagrant virtual machine

        git clone https://github.com/lcreid/suneido.js-vagrant.git
        cd suneido.js-vagrant
        vagrant up

4. Wait a half an hour or more, depending on your Internet connection speed. Ignore the "stdin: tty is not a tty" messages
5. Browse to `http://localhost:7000/play.html`. (You may have to wait a half a minute or so for the server to start running.)

# What Happened

What happened when you ran the commands in step 3?

1. You downloaded a "vagrantfile" from GitHub, which defines a virtual machine. This virtual machine runs an Ubuntu 14.04 server with no GUI. If you're not familiar with Linux, don't worry. Using this virtual machine requires little if any Linux experience
2. `vagrant up` starts the virtual machine, which:

    1. If you're never run `vagrant up` for a Vagrant virtual machine using Ubuntu 14.04, downloads a whole VM Ubuntu 14.04 virtual machine, which takes a while
    2. Starts the virtual machine
    3. Downloads the Java 8 SDK, git, and ant, which also takes a while
    4. Clones jSundeido from the GitHub repository
    5. Builds jSuneido
    6. Clones suneido.js from the GitHub repository
    7. Prepares start-up scripts to run the suneido.js server on boot and shut it down when the system is shut down
    8. Starts the suneido.js server


One of the key features of our Vagrant virtual machine is that the directory where you ran `vagrant up` the first time is mapped to `/vagrant` in the virtual machine.

The Vagrantfile was written to clone suneido.js to `/vagrant/sundeido.js`. If you look at the directory where you ran `vagrant up` you'll see a `suneido.js` directory, and inside it, the source for suneido.js.

This means that whether you're running Windows, Mac, or Linux on your workstation, you can work on the suneido.js code with all the tools you're used to using every day, while running from a consistent server environment.

# Using the Virtual Machine

The key Vagrant commands you need to know are:

* `vagrant halt` stops the virtual machine, but leaves everything on disk untouched.
* `vagrant up` restarts the virtual machine. It won't take so long this time, because all the downloading and building is already done. Essentially all it has to do is boot a virtual machine, and since the virtual machine is a light-weight Ubuntu server, it takes very little time
* `vagrant destroy` stops the virtual machine and deletes the whole virtual machine. This deletes the virtual machine file, so everything stored on the virtual machine itself disappears. The contents of the directory where you ran `vagrant up` are left untouched. You can recreate the virtual machine with another `vagrant up`, which will run a bit faster this time, because Vagrant doesn't need to download the base Ubuntu server again
* `vagrant ssh` starts an ssh shell session on the virtual machine
* `vagrant ssh -c "command"` runs `command` on the virtual machine

Read the [Vagrant documentation](https://docs.vagrantup.com/v2/) for more details

# Commands on the Virtual Machine

There are a few convenience commands set up on the virtual machine:

* `jsuneido` starts the Suneido server
* `jsuneido-stop` stops the Suneido server
* `jsuneido-load-stdlib` loads the Suneido standard library

Run these via vagrant ssh
