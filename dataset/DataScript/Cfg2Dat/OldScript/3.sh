#sPath="../benign/*"
sPath="../malware/*"
echo "start time: "
date
for sSubDir in $sPath 
do
	sSubPath=$sSubDir"/*.cfg"
	echo "  "$sSubDir
	for CFGFile in $sSubPath
	do
		./m $CFGFile
		if [ $? -eq 0 ]
		then
			echo $CFGFile
			rm -f  $CFGFile
			rm -f ${CFGFile%.cfg}"_Tree.dat"
		fi
	done
	echo "finish time:"
	date
done

