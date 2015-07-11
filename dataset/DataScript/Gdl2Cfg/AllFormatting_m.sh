for sSubDir in /fbank/dataset/GdlDB/gdl_Malware/*
do
#	echo $sSubDir
	nNumOfFiles=`ls $sSubDir | wc -l`
	if [ $nNumOfFiles -le 5 ]
	then
		continue
	fi
	sName=${sSubDir##*/}
	sNewDir="/fbank/dataset/CfgDB/cfg_Malware/"$sName
	mkdir -p $sNewDir
	InputFiles=$sSubDir"/*"
	for sGdlFile in $InputFiles 
	do
		OutFile=${sGdlFile##*/}
		OutFile=${OutFile%.gdl}
		OutFile=$sNewDir"/"$OutFile".cfg"
	#	echo $sGdlFile, $OutFile
		./gdl2cfg $sGdlFile $OutFile 
#		python ./Formatting.py -f $sGdlFile -o ../.benign	
	#	echo "Path",$sGdlFile
	done
	echo $sSubDir" OK"
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
