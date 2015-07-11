sPath="../../benign/*"
for sSubDir in $sPath
do
	nNumOfDat=`ls $sSubDir | wc -l`
	echo $sSubDir, $nNumOfDat
	if [ $nNumOfDat -ge 2000 ]
	then
		echo $sSubDir
#		rm -rfv $sSubDir
	fi
done
