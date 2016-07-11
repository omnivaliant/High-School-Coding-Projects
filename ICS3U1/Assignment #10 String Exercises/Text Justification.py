#Author: Mohit Patel
#Date: January 12, 2015
#Purpose: To write a class which will create justified text.
#------------------------------------------------------------#
class JustifyText:
    def __init__(self,wordsList=[],docList=[],strInputFile="input.txt",strOutputFile="output.txt",strJustification="l",intWidth=60):
        self.wordsList = wordsList
        self.docList = docList
        self.strInputFile = strInputFile
        self.strOutputFile = strOutputFile
        self.strJustification = strJustification
        self.intWidth = intWidth
        self.readFile()
        self.createDoc()
    def readFile(self):
        inputFile = open(self.strInputFile,'r')
        for line in inputFile:
            tempList = line.strip().split()
            for strWord in tempList:
                if len(strWord) > 30:
                    strWord = strWord[:30]
                self.wordsList.append(strWord)
        inputFile.close()
        print(self.wordsList)
    def writefile(self):
        outputFile = open(self.strOutputFile,"w")
        
    def createDoc(self):
        if self.strJustification == "l":
            self.justifyLeft()
        elif self.strJustification == "r":
            self.justifyRight()
        elif self.strJustification == "c":
            self.justifyCentre()
        else:
            self.justifyFull()
        self.writeFile()
    def justifyLeft(self):
        line = ""
        for count in range(0,len(self.wordsList)):
            if line == "":
                line = line + self.wordsList[count] + " "
            elif len(line + self.wordsList[count]) + 1 <= self.intWidth:
                line = line + self.wordsList[count] + " "
            else:
                while len(line) < self.intWidth:
                    line = line + " "  
                self.docList.append(line)
                line = self.wordsList[count] + " "
        while len(line) < self.intWidth:
            line = line + " "
        self.docList.append(line)
        print(self.docList)
    def justifyRight(self):
        x = 6
    def justifyCentre(self):
        x = 9
    def justifyFull(self):
        x = 15
    def __str__(self):
        strOutput = ""
        for count in range(0,len(self.docList)):
            strOutput = strOutput + self.docList[count]
        print(strOutput)
            
        
    
#  A new command to open a text file for reading.
# "R" means open file for read; "W" means open file for write.
file = open("input.txt", "r")

# each file or stream you wish to read/write to requires its own reference.
output = open("outputFile.txt", "w")
output2 = open("outputFile2.txt","w")

#  initializing an empty list
lstWords = []

#  in a loop; read a line from the file.
for line in file:
    # build a temporary 'list' of words from the current line
    # from the file, codes striped out; split by whitespace
    tempWordList = line.strip().split()
    # build the official list of words by apending words from the
    # temporary 'list' of words from the current line
    # truncating words exceeding 30 characters before adding them
    # to the official list of words.
    for strWord in tempWordList:
        if len(strWord) > 30:
            strWord = strWord[:30]
        lstWords.append(strWord)
        output2.write(strWord+" ")
# Print our the official list of words to check
output.write(str(lstWords))

# Make sure you close any file that you open.  forgetting to close a file
# opened for write will produce an empty file.
file.close()
output.close()
output2.close()

a = JustifyText()

