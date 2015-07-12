#sPath="../benign/*"
sPath="./malware/*"
echo "start time: "
date
nSeqNum=0
for sSubDir in $sPath 
do
	nSeqNum=$(($nSeqNum+1))
	if [ $nSeqNum -ge 1000 ]
	then
		break
	fi
	sSubPath=$sSubDir"/*.cfg"
	for CFGFile in $sSubPath
	do
		./m $CFGFile
		if [ $? -eq 0 ]
		then
			rm -f  $CFGFile
			rm -f ${CFGFile%.cfg}"_Tree.dat"
		fi
	done
	echo "finish time:"
	date
done

