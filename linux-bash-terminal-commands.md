## Linux Bash Terminal Commands

```$ pwd```                                             <b>Print working directory</b><br>
```$ cd /{destination_folder}```                        <b>Change directory</b><br>
```$ cd```                                              <b>Go to root's directory</b><br>
```$ cd ..```                                           <b>Go back one directory</b><br>
```$ ls```	                                            <b>List of all folders and files</b><br>
```$ touch foo.txt```                                   <b>Create a file named foo.txt</b><br>
```$ nano foo.txt```                                    <b>Edit a file named foo.txt</b><br>
```$ cat foo.txt```					                            <b>Print a file named foo.txt</b><br>
```$ tac foo.txt```					                            <b>Print a file named foo.txt in reverse mode</b><br>
```$ {command} --help```			                          <b>Show help for the typed command</b><br>
```$ cat foo.txt | more```			                        <b>Print a visible text on video and with pressing 'enter' the
                                                        user can see more text of this file</b><br>
```$ cat -n foo.txt```				                          <b>Print a file named foo.txt with number lines</b><br>
```$ cat foo.txt > bar.txt```			                      <b>Print an overwrited file (overwrite the content of the 2nd file                                                           with the content of the 1st file)</b><br>
```$ cat > foobar.txt```				                        <b>The user can type the content that will be showed into this file                                                           with the command $ cat fileName.txt</b><br>
```$ cat foo.txt >> bar.txt```		                      <b>Print into bar.txt 2 times the content of foo.txt</b><br>
```$ cat foo.txt | sort > bar.txt```	                  <b>Print into bar.txt the foo.txt's sorted content</b><br>
```$ mkdir foo-folder```			                          <b>Make a directory named foo-folder</b><br>
```$ rmdir foo-folder```			                          <b>Remove an empty directory named foo-folder</b><br>
```$ rmdir -rf foo-folder```					                  <b>Remove recursively a directory named foo-folder and all files that                                                         contains</b><br>
```$ cp foo.txt /folder```	                            <b>Copy a file named foo.txt into destinationFolder</b><br>
```$ mv -rf foo.txt bar.txt /folder```		              <b>Move in recursively mode foo.txt and bar.txt into a folder</b><br>
```$ cat foo.txt | less```				                      <b>Print a file with less operator (siimilar to more)</b><br>
```$ touch -c foobar.txt```				                      <b>Create a file with the operator -c  (no-create)</b><br>
```$ clear```							                              <b>Clear screen</b><br>
```$ touch {A..Z}{1..100}.txt```			                  <b>Create txt files named with Alphabetic Order (A to Z)</b><br>
```$ rm *``` 							                              <b>Remove all files and folders</b><br>
```$ sudo su```							                            <b>Obtain admin rights</b><br>
```$ sudo apt-get install {packageName}```		          <b>Install a package with admin rights</b><br>
```$ sudo apt-get update && sudo apt-get upgrade```	    <b>Update and upgrade your system with admin rights</b><br>
```$ sudo apt-get remove {packageName}```				        <b>Remove a package with admin rights</b><br>
```$ top```								                              <b>Get a system monitor on terminal</b><br>
```$ kill```					                                  <b>Kill a process</b><br>
```$ kill -9 {PID}```					                          <b>Kill a process with this PID</b><br>
```$ killall -9 {PID}```						                    <b>Kill all processes of PID</b><br>
```$ sudo apt --fix-broken install```				            <b>Fixing broken install of a package</b><br>
```$ echo {message}```				                          <b>Print a message</b><br>
```$ echo {message} > foo.txt```					              <b>Print the message into foo.txt</b><br>
```$ cat /proc/interrupts```							              <b>Print all interrupts of CPU's operations</b>
```$ cat /proc/ioports && cat /proc/dma```		          <b>Print a sequence of all components that CPU use for data          
                                                        transmission</b><br>
```$ lspci```						                                <b>List of all PCI's devices mounted on this machine</b><br>
```$ lspci -t```							                          <b>List of all PCI's devieces mounted on this machine with tree's                                                             view</b><br>
```$ ls -l /dev/sd{a..z}```				   	                  <b>List of all storage devices mounted on this machine</b><br>
```$ lsmod```								                            <b>List of all devices and drives mounted on this machine</b><br>
```$ lsmod | grep pcs*```							                  <b>Get a filtered list of all devices that named "pcs*"</b><br>
```$ sudo rm mod deviceName```						              <b>Delete a device and its drivers from this machine</b><br>
```$ sudo dpkg -i {packageName}.deb``` 					        <b>Install deb file</b><br>


