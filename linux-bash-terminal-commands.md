## Linux Bash Terminal Commands

<ul>
```$ pwd```                                             <b>Print working directory</b>
```$ cd /{destination_folder}```                        <b>Change directory</b>
```$ cd```                                              <b>Go to root's directory</b>
```$ cd ..```                                           <b>Go back one directory</b>
```$ ls```	                                            <b>List of all folders and files</b>
```$ touch foo.txt```                                   <b>Create a file named foo.txt</b>
```$ nano foo.txt```                                    <b>Edit a file named foo.txt</b>
```$ cat foo.txt```					                    <b>Print a file named foo.txt</b>
```$ tac foo.txt```					                    <b>Print a file named foo.txt in reverse mode</b>
```$ {command} --help```			                    <b>Show help for the typed command</b>
```$ cat foo.txt | more```			                    <b>Print a visible text on video and with pressing 'enter' the user can see more text of this file</b>
```$ cat -n foo.txt```				                    <b>Print a file named foo.txt with number lines</b>
```$ cat foo.txt > bar.txt```			                <b>Print an overwrited file (overwrite the content of the 2nd file with the content of the 1st file)</b>
```$ cat > foobar.txt```				                <b>The user can type the content that will be showed into this file with the command $ cat fileName.txt</b>
```$ cat foo.txt >> bar.txt```		                    <b>Print into bar.txt 2 times the content of foo.txt</b>
```$ cat foo.txt | sort > bar.txt```	                <b>Print into bar.txt the foo.txt's sorted content</b>
```$ mkdir foo-folder```			                    <b>Make a directory named foo-folder</b>
```$ rmdir foo-folder```			                    <b>Remove an empty directory named foo-folder</b>
```$ rmdir -rf foo-folder```					        <b>Remove recursively a directory named foo-folder and all files that contains</b>
```$ cp foo.txt /folder```	                            <b>Copy a file named foo.txt into destinationFolder</b>
```$ mv -rf foo.txt bar.txt /folder```		            <b>Move in recursively mode foo.txt and bar.txt into a folder</b>
```$ cat foo.txt | less```				                <b>Print a file with less operator (siimilar to more)</b>
```$ touch -c foobar.txt```				                <b>Create a file with the operator -c  (no-create)</b>
```$ clear```							                <b>Clear screen</b>
```$ touch {A..Z}{1..100}.txt```			            <b>Create txt files named with Alphabetic Order (A to Z)</b>
```$ rm *``` 							                <b>Remove all files and folders</b>
```$ sudo su```							                <b>Obtain admin rights</b>
```$ sudo apt-get install {packageName}```		        <b>Install a package with admin rights</b>
```$ sudo apt-get update && sudo apt-get upgrade```	    <b>Update and upgrade your system with admin rights</b>
```$ sudo apt-get remove {packageName}```				<b>Remove a package with admin rights</b>
```$ top```								                <b>Get a system monitor on terminal</b>
```$ kill```					                        <b>Kill a process</b>
```$ kill -9 {PID}```					                <b>Kill a process with this PID</b>
```$ killall -9 {PID}```						        <b>Kill all processes of PID</b>
```$ sudo apt --fix-broken install```				    <b>Fixing broken install of a package</b>
```$ echo {message}```				                    <b>Print a message</b>
```$ echo {message} > foo.txt```					    <b>Print the message into foo.txt</b>


```$ cat /proc/interrupts```							<b>Print all interrupts of CPU's operations</b>
```$ cat /proc/ioports && cat /proc/dma```		        <b>Print a sequence of all components that CPU use for data transmission</b>
```$ lspci```						                    <b>List of all PCI's devices mounted on this machine</b>
```$ lspci -t```							            <b>List of all PCI's devieces mounted on this machine with tree's view</b>
```$ ls -l /dev/sd{a..z}```				   	            <b>List of all storage devices mounted on this machine</b>
```$ lsmod```								            <b>List of all devices and drives mounted on this machine</b>
```$ lsmod | grep pcs*```							    <b>Get a filtered list of all devices that named "pcs*"</b>
```$ sudo rm mod deviceName```						    <b>Delete a device and its drivers from this machine</b>
```$ sudo dpkg -i {packageName}.deb``` 					<b>Install deb file</b>

