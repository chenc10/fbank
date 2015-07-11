sPath="malware/*/"
for sSubDir in $sPath
do
	ls $sSubDir > 1
	echo $sSubDir
	for sSubDir2 in $sPath
	do
		echo $sSubDir2
		echo $sSubDir > 3
		echo $sSubDir2 > 4
		if  diff 3 4 > /dev/null
		then
			continue
		fi
		ls $sSubDir2 > 2
		if diff 1 2 >/dev/null
		then
			echo $sSubDir" and "$sSubDir2
			rm -rf $sSubDir2
		fi
	done
	echo $sSubDir" finished"
done
