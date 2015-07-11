sPath="../benign/*"
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
	sSubPath=$sSubDir"/*.cfg"
	for CFGFile in $sSubPath
	do
		python 7Whole*.py -r $CFGFile
		echo $sSubDir," ",$CFGFile," OK"	
	done
	echo "finish time:",
	date
done

