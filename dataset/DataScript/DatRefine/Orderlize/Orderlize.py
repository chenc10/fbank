import os 
import shutil
Path = "../../malware/"
DestPath = "../../malware/"
Dirs = os.listdir(Path)
Result = []
for dir in Dirs:
	NumOfDat = 0
	record = os.listdir(Path+dir)
	for ele in record:
		if ele[-3:] == 'dat':
			NumOfDat = NumOfDat + 1
	Result.append((dir,NumOfDat))
fResult  = sorted(Result, key = lambda s: s[1])
seqnum = 0
Record = dict()
for ele in fResult:
	seqnum = seqnum + 1
	Record[ele[0]] =  seqnum		
for dir in Dirs:
	shutil.move(Path+dir, DestPath+"%03d" %Record[dir]) 
	print dir, Record[dir]
#print Record 
