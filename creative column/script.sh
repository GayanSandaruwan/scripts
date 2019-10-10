
#1.1 Creating New Directories 

directory=~/CW2

if [ -d $directory ]
then
      echo "File already exisits"					
else
      mkdir $directory
fi

cd $directory
pwd

mkdir -p SD21 SD22 SD23 SD24 SD25 SD26
pwd

cd ~/
pwd

#1.2 Removing Existing Files and Directories
cd CW2/SD26
pwd
touch 1.txt 
touch 2.txt

cd ../

rm -i SD26/1.txt
rm -i SD26/2.txt
rm -r -i SD26

echo "Directory tree Structure"
find . | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"

#1.3 Use of ‘cd’ Command 
cd SD22
echo "Current working directory is : "
pwd ;
echo "Changing to the parent directory"
cd .. ;
echo " Current working directory is. : "
pwd

pwd ;
echo "Changing to the parent directory"
cd .. ;
echo "Current working directory is : "
pwd ;
cd .. ;
echo "Changing to the parent directory"
echo "Current working directory is : "
pwd


#1.4 System Manual and Large Files

cd $directory/SD25
man ls | more
man ls > ls-man 
cat ls-man

#1.5 Use of ‘ls’ Command
ls -a
echo "display the files and directories, do not ignore entries starting with ."
ls
echo "display the files and directories, ignore entries starting with ."
ls -a
echo "display the files and directories, do not ignore entries starting with . and use a long listing format"
ls -R
echo "display the files and directories, list subdirectories recursively"

#1.6 Use of ‘cat’ Command

cd $directory/SD24

echo "AAAAA
BBBBB
CCCCC
DDDDD" >test1

echo "aabbb
bbccc
ccddd
ddaaa" > test2

echo "Ddddd
Ccccc
Bbbbb
Aaaaa" >test3

cp ./{test1,test2,test3} ../SD23 

cd ../SD23
cat test1 test2 test3 	
cat test1 test2 test3 > testD 
echo "cat test1 – test2 >> testD , prints test1 to testD in appending mode, then write two more lines read from stdin to testD file"

#1.7 Use of ‘chmod’ Command
cd $directory/SD23

chmod 000 test2
ls -l test2
cat test2
chmod +rw test2
ls -l test2
cat test2

cd ~/CW2
chmod 000 SD23
ls -ld SD23
cat SD23/test2
chmod +rwx SD23
ls -ld SD23
cat SD23/test2

#1.8 Use of ‘grep’ Command

cd SD24
echo "Search for the patter cc and print containing lines"
grep cc test3	
echo " Search for the patter cc and print the inverse of search results ( lines which does not contain pattern cc)"
grep -v cc test3
echo "Search for the pattern cc and, prefix each line of output with the 1-based line  number  within
              its input file."	
grep -n cc test3
echo " Search for the pattern bb in all files, Suppress normal output; instead print the  name  of  each  input
              file  from  which  output would normally have been printed.  The
              scanning will stop on the first match."	
grep -l bb *
echo "Search for patter bb in all files, with ignoring case distinctions, so that characters that differ only in
              case match each other. Print matching lines against the containing file"
grep -i bb *
echo "Same as above"	
grep -i BB *

#1.9 Shell scripts

