# Instructions

Followed this [post](https://medium.com/@gilad215/ssh-into-a-wsl2-host-remotely-and-reliabley-578a12c91a2)

1. Install openssh-server in WSL distro
  	* `sudo apt install openssh-server`
2. Edit `/etc/ssh/sshd_config` for out ssh server process (use ports other than 22 since windows is already using it)
	```
	Port 2222
	ListenAddress 0.0.0.0
	```
3. Add a file (name it anyhow you want, but do not include `.` or `~` in the filename) in `/etc/sudoers.d/` to remove the requirement of entering a password when starting the ssh service. We need to manually start the ssh service from windows because WSL does not provide a static IP address. Add the following line in the file:
 	* `%sudo ALL=NOPASSWD: /usr/sbin/service ssh *`

4. Start the service `service ssh start`

5. Run the `startSSHandForwardPorts.ps1` script with powershell. Add/remove ports from `$Ports` in the script as required, but 2222 (or whatever port you used for ssh) should be there.

6. You can test your connection now. You might need to add `PasswordAuthentication yes` to `/etc/ssh/sshd_config` first
so you can add (a la ssh-copy-id) a public key in your WSL distro.

7. Automation: Since WSL2 uses dynamic IPs, you need to run the script on every startup.
	 * `Win+R` and enter `shell:startup`
	 * Right click and create new shortcut
	 * In target, add the following: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "<path to startSSHandForwardPorts.ps1>"`
	 * Right click the new shortcut and under properties, change `Start in` to the folder which contains `startSSHandForwardPorts.ps1`
	 * Test the short cut -- run it.
