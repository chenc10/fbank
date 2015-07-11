Path="../benign/*"
nSum=0
for sSubDir in $Path
do
	nNum=`ls $sSubDir | wc -l`
	nSum=$(($nNum+$nSum))
	echo $sSubDir" has "$nNum"  files" 
done
echo $nSum
	

