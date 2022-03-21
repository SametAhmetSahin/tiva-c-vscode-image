echo $1

echo "This script will create a new project with the name $1"

# Makes sure student/Projects exists by creating it

mkdir -p $HOME/Projects/

# Extracts the clean .tar.gz into projects
tar -C $HOME/Projects/ -xvf $HOME/tiva-c_clean.tar.gz

# Removes the .git folder so the tiva-c folder stops being a git repository
rm -rf $HOME/Projects/tiva-c/.git 

# Stellaris Move
# mv $HOME/projects/stellaris/stellaristemplate/boards/ek-lm4f120xl/project0 $HOME/projects/stellaris/stellaristemplate/boards/ek-lm4f120xl/$1


# moves project0 to projectname
mv $HOME/Projects/tiva-c/boards/ek-tm4c123gxl/project0 $HOME/Projects/tiva-c/boards/ek-tm4c123gxl/$1
# moves project0's linker file to be projectname's linker
mv $HOME/Projects/tiva-c/boards/ek-tm4c123gxl/$1/project0.ld $HOME/Projects/tiva-c/boards/ek-tm4c123gxl/$1/$1.ld
# moves project0's c source file to be projectname's c source file
mv $HOME/Projects/tiva-c/boards/ek-tm4c123gxl/$1/project0.c $HOME/Projects/tiva-c/boards/ek-tm4c123gxl/$1/$1.c
# Replaces every occurence (because of the /g flag at the end it is global) of the string "project0" with the project name in the Makefile 
sed -i 's/project0/'$1'/g' $HOME/Projects/tiva-c/boards/ek-tm4c123gxl/$1/Makefile

echo "Extracted and renamed project $1"

echo "Opening $1 in Visual Studio Code..."
# Opens the folder in Visual Studio Code
code --reuse-window $HOME/Projects/tiva-c/boards/ek-tm4c123gxl/$1