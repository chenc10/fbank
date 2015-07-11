sPath="../../malware/*"
for sSubDir in $sPath
do
	sPath2=$sSubDir"/*cfg"
	for sSubDir2 in $sPath2
	do
		nLines=`cat $sSubDir2 | wc -l`
		#echo $sSubDir2, $nLines
		if [ $nLines -ge 600 ]
		then
			echo $sSubDir2, $nLines	
			sDatName=${sSubDir2%.cfg}".dat"
			#echo $sSubDir2, $sDatName
			rm -rf $sSubDir2
			rm -rf $sDatName
		fi
	done
done
