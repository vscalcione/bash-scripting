## Linux Bash Terminal Commands

```bash
$ pwd                                           # Print working directory
$ cd /{destionationFolder}                      # Change directory
$ cd                                            # Go to root's directory
$ cd ..                                         # Go back one directory
$ ls -l                                         # List of all folders and files
$ touch foo.txt                                 # Create a file named foo.txt
$ nano foo.txt                                  # Edit a file named foo.txt
$ cat foo.txt                                   # Print a file named foo.txt
$ tac foo.txt                                   # Print a file named foo.txt in reverse mode
$ {command} --help                              # Show helpo for the typed command
$ cat foo.txt | more                            # Print a visible text on video and with pressing 'enter' can
                                                # see more text
$ cat -n foo.txt                                # Print a file named foo.txt with number lines
$ cat foo.txt > bar.txt                         # Print on bar.txt the content of foo.txt
$ cat > foobar.txt                              # Print into foobar.txt the content that the user type
$ cat foo.txt >> bar.txt                        # Print into bar.txt 2 times the content of foo.txt
$ cat foo.txt | sort > bar.txt                  # Print into bar.txt the foo.txt's sorted content
$ mkrid foo-folder                              # Make a directory name foo-folder
$ rmdir foo-folder                              # Remove a directory named foo-folder
$ rmdir -rf foo-folder                          # Remove recursively a directory named foo-folder and 
                                                # all files that contains
$ cp foo.txt /folder                            # Copy a file named foo.txt into destination-folder
$ mv -rf foo.txt bar.txt /folder                # Move in recursively mode foo.txt and bar.txt 
                                                # into a folder
$ cat foo.txt | less                            # Print a file with less operator (similar to more)
$ touch -c foobar.txt                           # Create a file with the operator -c (no-create)
$ clear                                         # Clear screen
$ touch {A..Z}{1..100}.txt                      # Create text files named with Alphabetic Order (A to Z)
$ rm *                                          # Remove all files and folders
$ sudo su                                       # Obtain admin rights
$ sudo apt install {packageName}                # Install a package with admin rights
$ sudo apt remove {packageName}                 # Remove a package with admin rights
$ sudo apt update && sudo apt upgrade           # Update and upgrade system
$ top                                           # Get a system monitor on terminal
$ kill                                          # Kill a process
$ kill -9 {PID}                                 # Kill a process with this PID
$ killall -9 {PID}                              # Kill all process of PID
$ sudo apt --fix-broken install                 # Fixing broken install of a package
$ echo {message}                                # Print message
$ echo {message} > foo.txt                      # Print the message int foo.txt 
$ cat /proc/interrupts                          # Print all interrupts of CPU's operations
$ cat /proc/ioports && cat /proc/dma            # Print a CPU's components liste use for 
                                                #  data transmission
$ lpci                                          # List of all PCI's devices mounted on this machine
$ lpci -t                                       # List of all PCI's devices mounted on this machine 
                                                #  with tree's view
$ ls -l /dev/sd{a..z}                           # List of all storage devices mounted
$ lsmod                                         # List of all devices and drivers mounted on the machine
$ lsmod | grep pcs*                             # Get a filtered list of all devices that named 'pcs*'
$ sudo rm mod {deviceName}                      # Delete a device and its drivers from the machine
$ sudo dpkg -i {packageName.deb}                # Install a debian package
$ sudo shutdown -h now                          # Shutdown your machine
$ ps | awk {print $1}                           # Print PID of all execution process
$ df -h                                         # Print free space on devices
$ du -hs                                        # Print occupated space of a directory
```


