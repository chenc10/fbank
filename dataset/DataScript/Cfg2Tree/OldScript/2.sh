sPath="../malware/*"
echo "start time: ",
date
nSeqNum=0
for sSubDir in $sPath 
do
	nSeqNum=$(($nSeqNum+1))
	if [ $nSeqNum -le 999 ]
	then
		continue
	fi
	nNum=`ls $sSubDir | wc -l`
	if [ $nNum -ge 1000 ]
       	then
		continue
	fi
	echo $sSubDir
	continue
	sSubPath=$sSubDir"/*.cfg"
	for CFGFile in $sSubPath
	do
		python 8.py -r $CFGFile
		echo $sSubDir," ",$CFGFile," OK"	
	done
	echo "finish time:",
	date
done

