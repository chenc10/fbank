sPath="../benign/*"
echo "start time: ",
date
for sSubDir in $sPath 
do
	echo $sSubDir
	sSubPath=$sSubDir"/*.cfg"
	for CFGFile in $sSubPath
	do
		nNum=`cat $CFGFile | wc -l`
		if [ $nNum -le 29 ]
		then 
			echo $CFGFile" too small, delete!"
			rm -f $CFGFile	
			rm -f ${CFGFile%.cfg}"_Tree.dat"
		fi
	done
	echo "finish time:",
	date
done

