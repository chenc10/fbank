echo "OK"
for sSubDir in ../.InitData/benign/*
do
	echo $sSubDir
	nNumOfFiles=`ls $sSubDir"/GDL" | wc -l`
	if [ $nNumOfFiles -le 10 ]
	then
		continue
	fi
	sNewDir=${sSubDir##*/}
	sNewDir="../.benign/"$sNewDir
	mkdir -p $sNewDir
	Path=$sSubDir"/GDL/*"
	for sGdlFile in $Path 
	do
		python ./Formatting.py -f $sGdlFile -o ../.benign	
	#	echo "Path",$sGdlFile
	done
	echo "OK"
done

#
#import os
#import subprocess
#InputPath = "../.InitData/benign/"
#OutputPath = "../benign/"
#Dirs=os.listdir(InputPath)
#for dir in Dirs:
#	GdlPath = InputPath + dir + "/GDL/"
#	if len(os.listdir(GdlPath)) < 6:
#		continue
#	os.mkdir(OutputPath + dir)
#	for subdir in os.listdir(GdlPath):
#		Command = "python ./Formatting.py -f " + GdlPath + subdir + " -o " + OutputPath + dir +"/"
#		#print Command.split(" ")
#		subprocess.call(Command.split(" "))
#	print dir,"has been finished\n\n\n"
#			
