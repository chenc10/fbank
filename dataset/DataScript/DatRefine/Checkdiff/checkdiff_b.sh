sPath="../../benign/*/"
sPath2="../../malware/*/"
for sSubDir in $sPath
do
	ls $sSubDir > 7
	echo $sSubDir
	for sSubDir2 in $sPath2
	do
		echo $sSubDir2
		echo $sSubDir > f1 
		echo $sSubDir2 > f2 
		if  diff f1 f2 > /dev/null
		then
			continue
		fi
		ls $sSubDir2 > 8
		if diff 7 8 >/dev/null
		then
			echo $sSubDir" and "$sSubDir2
			rm -rf $sSubDir2
		fi
	done
	echo $sSubDir" finished"
done
