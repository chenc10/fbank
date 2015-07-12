from optparse import OptionParser

ALLNodeList=dict()
class Node:
	"'node for the graph'"
	def __init__(self,Addr):
		self.Addr = Addr
		self.FList = []
		self.CList = []

def get_sourcename(Line):
	Str1 = Line.split('sourcename: "')[1]
	Str2 = Str1.split('" targetname')[0]
	return int(Str2, 10)

def get_targetname(Line):
	Str1 = Line.split('targetname: "')[1]
	Str2 = Str1.split('"')[0]
	return int(Str2, 10)

if __name__ == "__main__":
	Parser = OptionParser()
	Parser.add_option("-f", dest="FileName")
	Parser.add_option("-o", dest="OutputPath")
	(options,args) = Parser.parse_args()
	FileName = options.FileName	
	OutputPath = options.OutputPath

	fread = open(FileName,'r')
	Database = fread.readlines()
	fread.close()
	i = -1 
	while i < len(Database) - 1:
		i = i + 1
		if Database[i][:5] == "title":
			FuncName = Database[i][8:14]
			print FileName,FuncName
		if Database[i][:6] <> "edge: ":
			continue
		SourceName = get_sourcename(Database[i])
		TargetName = get_targetname(Database[i])
		SourceNode = ALLNodeList.setdefault( SourceName, Node(SourceName))
		TargetNode = ALLNodeList.setdefault( TargetName, Node(TargetName))
		SourceNode.CList.append(TargetNode)
		TargetNode.FList.append(SourceNode)

		i = i + 1
	#print ALLNodeList

	if len(ALLNodeList.items()) > 9:
		BaseAddr = int(FuncName, 16)
		FileName = FileName.split("/")[-1]
		OutputFileName = OutputPath + FileName.split('.gdl')[0] + '.dat'
		FileObject = open(OutputFileName, 'w')
		#print "Output:",OutputFileName

		for ele1, ele2 in ALLNodeList.items():
			ele1 = ele1 + BaseAddr
			ele1 = ele1 * 16
			FileObject.write("%7X\n\t"%ele1)
			for f in ele2.FList:
				ad = f.Addr
				ad = ad + BaseAddr
				ad = ad * 16
				FileObject.write("%7X "%ad)
			FileObject.write("\n\t")
			for c in ele2.CList:
				ad = c.Addr
				ad = ad + BaseAddr
				ad = ad * 16
				FileObject.write("%7X "%ad)
			FileObject.write("\n")
		FileObject.close()
	
