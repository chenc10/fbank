sPath="../../benign/*"
for sSubDir in $sPath
do
	sPath2=$sSubDir"/*dat"
	for sSubDir2 in $sPath2
	do
		sDatName=${sSubDir2%_Tree.dat}".cfg"
		if [ -e $sDatName ]
		then 
			continue
		fi
		echo $sDatName	
		rm -rfv $sDatName
	done
done
