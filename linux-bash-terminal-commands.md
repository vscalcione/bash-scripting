## Linux Bash Terminal Commands
| Command | Description |
| --- | --- |
| ```$ pwd``` | Print working directory |
| ```$ cd /{destination_folder}``` | Change directory |
| ```$ cd ``` | Go to root's directory |
| ```$ cd ..``` | Go back one directory |

```$ cd```                                              Go to root's directory<br>
```$ cd ..```                                           Go back one directory<br>
```$ ls```	                                            List of all folders and files<br>
```$ touch foo.txt```                                   Create a file named foo.txt<br>
```$ nano foo.txt```                                    Edit a file named foo.txt<br>
```$ cat foo.txt```					                            Print a file named foo.txt<br>
```$ tac foo.txt```					                            Print a file named foo.txt in reverse mode<br>
```$ {command} --help```			                          Show help for the typed command</b><br>
```$ cat foo.txt | more```			                        Print a visible text on video and with pressing 'enter' the
                                                        user can see more text of this file<br>
```$ cat -n foo.txt```				                          Print a file named foo.txt with number lines<br>
```$ cat foo.txt > bar.txt```			                      Print an overwrited file (overwrite the content of the 2nd file                                                               with the content of the 1st file)<br>
```$ cat > foobar.txt```				                        The user can type the content that will be showed into this file                                                             with the command $ cat fileName.txt<br>
```$ cat foo.txt >> bar.txt```		                      Print into bar.txt 2 times the content of foo.txt<br>
```$ cat foo.txt | sort > bar.txt```	                  Print into bar.txt the foo.txt's sorted content<br>
```$ mkdir foo-folder```			                          Make a directory named foo-folder<br>
```$ rmdir foo-folder```			                          Remove an empty directory named foo-folder<br>
```$ rmdir -rf foo-folder```					                  Remove recursively a directory named foo-folder and all files that                                                           contains<br>
```$ cp foo.txt /folder```	                            Copy a file named foo.txt into destinationFolder<br>
```$ mv -rf foo.txt bar.txt /folder```		              Move in recursively mode foo.txt and bar.txt into a folder<br>
```$ cat foo.txt | less```				                      Print a file with less operator (siimilar to more)<br>
```$ touch -c foobar.txt```				                      Create a file with the operator -c  (no-create)<br>
```$ clear```							                              Clear screen<br>
```$ touch {A..Z}{1..100}.txt```			                  Create txt files named with Alphabetic Order (A to Z)<br>
```$ rm *``` 							                              Remove all files and folders<br>
```$ sudo su```							                            Obtain admin rights<br>
```$ sudo apt-get install {packageName}```		          Install a package with admin rights<br>
```$ sudo apt-get update && sudo apt-get upgrade```	    Update and upgrade your system with admin rights<br>
```$ sudo apt-get remove {packageName}```				        Remove a package with admin rights<br>
```$ top```								                              Get a system monitor on terminal<br>
```$ kill```					                                  Kill a process<br>
```$ kill -9 {PID}```					                          Kill a process with this PID<br>
```$ killall -9 {PID}```						                    Kill all processes of PID<br>
```$ sudo apt --fix-broken install```				            Fixing broken install of a package<br>
```$ echo {message}```				                          Print a message<br>
```$ echo {message} > foo.txt```					              Print the message into foo.txt<br>
```$ cat /proc/interrupts```							              Print all interrupts of CPU's operations<br>
```$ cat /proc/ioports && cat /proc/dma```		          Print a CPU's components list use for data transmission<br>
```$ lspci```						                                List of all PCI's devices mounted on this machine<br>
```$ lspci -t```							                          List of all PCI's devieces mounted on this machine with tree's                                                               view<br>
```$ ls -l /dev/sd{a..z}```				   	                  List of all storage devices mounted on this machine<br>
```$ lsmod```								                            List of all devices and drives mounted on this machine<br>
```$ lsmod | grep pcs*```							                  Get a filtered list of all devices that named "pcs*"<br>
```$ sudo rm mod deviceName```						              Delete a device and its drivers from this machine<br>
```$ sudo dpkg -i {packageName}.deb``` 					        Install deb file<br>


