Laravel-Vagrant
===============

An automated Ubuntu VM (LAMP+Laravel 4) provision using Vagrant


<h1>Install</h1>

<ol>
    <li>Install VirtualBox</li>
    <li>Install Vagrant</li>
    <li>Open your terminal/command prompt and navigate to this folder contining this readme file</li>
    <li>Type "vagrant box add laravel http://files.vagrantup.com/precise32.box"</li>
    <li>After the VM has downloaded, type "vagrant up"</li>
    <li>Select the device you want to use to connect to the internet</li>
    <li>Once your VM is up and running and finishes provisioning, type "vagrant ssh"</li>
    <li>type "ifconfig"</li>
    <li>Enter the IP address of your VM into your host's browser.</li>
    <li>You should be looking at the Laravel 4 "You have arrived" page</li>
</ol>

<h2>Features</h2>
<p>To SSH into your VM, use the IP address you found with "ifconfig" and port 22 (ex - 192.168.1.144:22). The username and password are: vagrant / vagrant</p>

<p>This also includes an FTP server which can be accessed using your VM's IP address, port 21 (no SSL or TLS) and the username and password is: vagrant / vagrant</p>


<p>If you run into any problems, create an issue here and I will do my best to get it taken care of...</p>
