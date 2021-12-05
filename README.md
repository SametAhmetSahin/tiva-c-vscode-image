# tiva-c-vscode-image

Creating a modern system image for the System Programming class of the Computer Engineering programme of the Kocaeli University. 

After following the previous Linuxer's system image creation guide (until the GNU MCU Eclipse) and creating a base Debian XFCE installation, I decided to look into using VSCode and I apparently could, if I used VSCode as the text editor and the GUI for the commands that will make and flash the projects in the background. The guide I mentioned is: https://github.com/KOU-Embedded-System-Lab/os-base-image/tree/master/debian

I found a GitHub repository where the Tiva C board toolchain (distributed with Texas Code Composer Studio) were uploaded and cloned it. According to the usage instructions I could just go into a project, run 'make' to build the project and flash the .bin file located in the 'gcc' folder, using 'lm4flash'. And it worked.
But your average student would not know about Linux and it could provide a huge difficulty curve for a fresh student to use a terminal, and I have discovered a VSCode addon called 'VsCode Action Buttons' by 'Seun LanLege', and saw how easy it was to create custom buttons to run custom commands. The user's settings.json is modified to include the custom commands and the syntax is something like:
'{
                "name": "Make and Flash ",
                "color": "white",
                "command": "make && sudo lm4flash gcc/${fileBasenameNoExtension}.bin",
            },' 