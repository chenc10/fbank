import string
import os
import shutil
rPath = "../../OldData/malware/"
destPath = "../../malware/"
rDirs = os.listdir(rPath)
for rdir in rDirs:
	rdir = rdir + "/"
	Dirs = os.listdir(rPath+rdir)
	for dir in Dirs: 
		if not os.path.exists(destPath + rdir):
			os.mkdir(destPath + rdir)
		if dir[-3:] == 'dat':
			fread = open(rPath+rdir+dir, 'r')
			Contents = fread.readlines()
			fread.close()
			tmpvalue = 0
			for line in Contents:
				if line[0] <> '\t':
					tmp = line.split(' ')
					if tmpvalue < string.atoi(tmp[2]):
						tmpvalue = string.atoi(tmp[2])
			if tmpvalue > 999:
				#os.remove(rPath+rdir+dir)
				print rPath+rdir+dir," removed"
				continue
			print "copytree ", rPath+rdir+dir, " to ", destPath + rdir + "%03d" %tmpvalue + "_" + dir
			shutil.copy(rPath+rdir+dir,destPath + rdir + "%03d" %tmpvalue+"_"+dir)
	print rdir+" finish"
