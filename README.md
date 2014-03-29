Vagrant-Laravel
===============

An automated Ubuntu VM (LAMP+Laravel 4) provision using Vagrant
<h1>Details</h1>
This script will provision a bridged Ubuntu Server 12.04 (32 bit) VM in VirtualBox using Vagrant with the following features:
<ul>
<li>Vim</li>
<li>FTP Server (VSFTPD)</li>
<li>APACHE 2 Web Server</li>
<li>PHP 5</li>
<li>MySQL Server 5.5</li>
<li>cURL</li>
<li>PHP mcrypt</li>
<li>GIT</li>
<li>Composer</li>
<li>Laravel 4</li>
</ul>

<h1>Install</h1>

<ol>
    <li>Install VirtualBox</li>
    <li>Install Vagrant</li>
    <li>Open your terminal/command prompt and navigate to this folder contining this readme file</li>
    <li>Type: <pre>vagrant box add laravel http://files.vagrantup.com/precise32.box</pre></li>
    <li>After the VM has downloaded, type: <pre>vagrant up</pre></li>
    <li>Select the device you want to use to connect to the internet</li>
    <li>Once your VM is up and running and finishes provisioning, type: <pre>vagrant ssh</pre></li>
    <li>type: <pre>ifconfig</pre></li>
    <li>Enter the IP address of your VM into your host's browser.</li>
    <li>You should be looking at the Laravel 4 "You have arrived" page</li>
</ol>

<pstyle="color: #ff2323;"><b>Warning: You may see several errors during the provisioning, yet everything seems to be working fine. If you find something not working, please create an issue so I can get it fixed!</b></p>

<h2>Information</h2>
<p>To SSH into your VM, use the IP address you found with "ifconfig" and port 22 (ex - 192.168.1.144:22). The username and password are: vagrant / vagrant</p>

<p>This also includes an FTP server which can be accessed using your VM's IP address, port 21 (no SSL or TLS) and the username and password is: vagrant / vagrant</p>


<p>If you run into any problems, create an issue here and I will do my best to get it taken care of...</p>
