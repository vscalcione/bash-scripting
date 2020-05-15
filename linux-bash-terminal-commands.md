## Linux Bash Terminal Commands
| Command | Description |
| --- | --- |
| ```$ pwd``` | Print working directory |
| ```$ cd /{destination_folder}``` | Change directory |
| ```$ cd ``` | Go to root's directory |
| ```$ cd ..``` | Go back one directory |
| ```$ ls``` | List of all folders and files
| ```$ touch foo.txt``` | Create a file named foo.txt |
| ```$ nano foo.txt``` | Edit a file named foo.txt |
| ```$ cat foo.txt``` | Print a file named foo.txt |
| ```$ tac foo.txt``` | Print a file named foo.txt in reverse mode |
| ```$ {command} --help``` | Show help for the typed command |
| ```$ cat foo.txt | more``` | Print a visible text on video and with pressing 'enter' the user can see more text of this file |
| ```$ cat -n foo.txt``` | Print a file named foo.txt with number lines |
| ```$ cat foo.txt > bar.txt``` | Print an overwrited file (overwrite the content of the 2nd file with the content of the 1st file) |
| ```$ cat > foobar.txt``` | The user can type the content that will be showed into this file with the command $ cat fileName.txt |
| ```$ cat foo.txt >> bar.txt``` | Print into bar.txt 2 times the content of foo.txt |
| ```$ cat foo.txt | sort > bar.txt``` | Print into bar.txt the foo.txt's sorted content |
| ```$ mkdir foo-folder``` | Make a directory named foo-folder |
| ```$ rmdir foo-folder``` | Remove an empty directory named foo-folder |
| ```$ rmdir -rf foo-folder``` | Remove recursively a directory named foo-folder and all files that contains | 
| ```$ cp foo.txt /folder``` | Copy a file named foo.txt into destinationFolder |
| ```$ mv -rf foo.txt bar.txt /folder``` | Move in recursively mode foo.txt and bar.txt into a folder |
| ```$ cat foo.txt | less``` | Print a file with less operator (siimilar to more) |
| ```$ touch -c foobar.txt``` | Create a file with the operator -c (no-create) |
| ```$ clear``` | Clear screen |
| ```$ touch {A..Z}{1..100}.txt``` | Create txt files named with Alphabetic Order (A to Z) |
| ```$ rm *``` | Remove all files and folders |
| ```$ sudo su``` | Obtain admin rights |
| ```$ sudo apt-get install {packageName}``` | Install a package with admin rights |
| ```$ sudo apt-get update && sudo apt-get upgrade``` | Update and upgrade your system with admin rights |
| ```$ sudo apt-get remove {packageName}``` | Remove a package with admin rights |
| ```$ top``` | Get a system monitor on terminal |
| ```$ kill``` | Kill a process |
| ```$ kill -9 {PID}``` | Kill a process with this PID |
| ```$ killall -9 {PID}``` | Kill all processes of PID |
| ```$ sudo apt --fix-broken install``` | Fixing broken install of a package |
| ```$ echo {message}``` | Print a message |
| ```$ echo {message} > foo.txt``` | Print the message into foo.txt |
| ```$ cat /proc/interrupts``` | Print all interrupts of CPU's operations |
| ```$ cat /proc/ioports && cat /proc/dma``` | Print a CPU's components list use for data transmission |
| ```$ lspci``` | List of all PCI's devices mounted on this machine |
| ```$ lspci -t``` | List of all PCI's devieces mounted on this machine with tree's view |
| ```$ ls -l /dev/sd{a..z}``` |List of all storage devices mounted on this machine |
| ```$ lsmod``` | List of all devices and drives mounted on this machine |
| ```$ lsmod | grep pcs*``` | Get a filtered list of all devices that named "pcs*" | 
| ```$ sudo rm mod deviceName``` | Delete a device and its drivers from this machine |
| ```$ sudo dpkg -i {packageName}.deb``` | Install deb file |


