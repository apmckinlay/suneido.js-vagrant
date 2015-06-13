# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 7000, host: 7000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  java_dir = "jdk1.8.0_45"
  java_tar_file = "jdk-8u45-linux-x64.tar.gz"
  java_home = "/home/vagrant/#{java_dir}"
  jsuneido_home = "/vagrant/jsuneido"
  database_home ="/home/vagrant"

  config.vm.provision "set-up-profile", type: "shell", privileged: false, inline: <<-SHELL
    echo Creating some useful aliases and environment variables.
    echo Check .profile to see them.
    sed --in-place \
      -e '/export JAVA_HOME/d' \
      -e '/alias jsuneido=/d' \
      .profile
    echo 'export JAVA_HOME=#{java_home}' >>.profile
    echo 'alias jsuneido="cd #{database_home}; #{java_home}/bin/java -jar #{jsuneido_home}/jsuneido.jar"' >>.profile
  SHELL

  config.vm.provision "java-install",
    type: "shell",
    privileged: false,
    inline: <<-SHELL
      echo Downloading and installing Java
      wget -nv -N  http://download.oracle.com/otn-pub/java/jdk/8u45-b14/#{java_tar_file} --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"
      tar -zxf #{java_tar_file}
    SHELL

  config.vm.provision "ant-install",
    type: "shell",
    inline: <<-SHELL
      echo Installing Ant
      apt-get update
      apt-get -y install ant
    SHELL

  config.vm.provision "git-install",
    type: "shell",
    inline: <<-SHELL
      echo Installing git
      apt-get -y install git
    SHELL

  config.vm.provision "jSuneido-install",
    type: "shell",
    privileged: false,
    inline: <<-SHELL
      echo Cloning jSuneido
      cd /vagrant
      git clone https://github.com/apmckinlay/jsuneido.git
    SHELL

  config.vm.provision "jSuneido-build",
    type: "shell",
    privileged: false,
    inline: <<-SHELL
      echo Building jSuneido
      cd #{jsuneido_home}
      JAVA_HOME=#{java_home} ant compile
    SHELL

  config.vm.provision "suneido.js-install",
    type: "shell",
    privileged: false,
    inline: <<-SHELL
      echo Cloning suneido.js
      cd /vagrant
      git clone https://github.com/apmckinlay/suneido.js.git
    SHELL

end
