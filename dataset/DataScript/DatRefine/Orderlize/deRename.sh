sPath="../../Old*/benign/*"
for sSubDir in $sPath
do
	echo $sSubDir
	sPath2=$sSubDir"/*dat"
	for sFile in $sPath2
	do
	#	mv $sFile ${sFile#*_}
		echo $sFile" to "${sFile%/*}"/"${sFile#*_}
		mv $sFile ${sFile%/*}"/"${sFile#*_}
	done
done
