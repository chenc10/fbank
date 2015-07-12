import os
import subprocess
InputPath = "../.InitData/malware/"
OutputPath = "../malware/"
Dirs=os.listdir(InputPath)
for dir in Dirs:
	GdlPath = InputPath + dir + "/GDL/"
	if len(os.listdir(GdlPath)) < 6:
		continue
	os.mkdir(OutputPath + dir)
	for subdir in os.listdir(GdlPath):
		Command = "python ./Formatting.py -f " + GdlPath + subdir + " -o " + OutputPath + dir +"/"
		#print Command.split(" ")
		subprocess.call(Command.split(" "))
	print dir,"has been finished\n\n\n"
			
