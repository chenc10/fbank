sInputPath="/fbank/dataset/CfgDB/cfg_Benign"
sOutputPath="/fbank/dataset/TreeDB/
for sSubDir in $sPath 
do
	sMy=$sSubDir"/*.dat"
	if ls $sMy >/dev/null 2>&1; then
		continue
	fi
	echo "------Find: "$sSubDir
	sSubPath=$sSubDir"/*.cfg"
	for CFGFile in $sSubPath
	do
		python 7Whole*.py -r $CFGFile
		echo "  "$sSubDir" "$CFGFile" OK"	
	done
done

