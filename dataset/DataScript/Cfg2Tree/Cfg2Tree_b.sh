for sSubDir in /fbank/dataset/CfgDB/cfg_Benign/*
do
	nNumOfFiles=`ls $sSubDir | wc -l`
	if [ $nNumOfFiles -e 0 ]
	then
		continue
	fi
	sName=${sSubDir##*/}
	sNewDir="/fbank/dataset/TreeDB/tree_Benign/"$sName
	mkdir -p $sNewDir
	InputFiles=$sSubDir"/*"
	for sGdlFile in $InputFiles 
	do
		OutFile=${sGdlFile##*/}
		OutFile=${OutFile%.cfg}
		OutFile=$sNewDir"/"$OutFile".tree"
	#	echo $sGdlFile, $OutFile
#		./cfg2tree $sGdlFile $OutFile 
		python ./Abstract.py -r $sGdlFile -w $OutFile	
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
