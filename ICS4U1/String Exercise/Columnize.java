//********************************************************************************
//Author: Mohit Patel
//Date: October 23, 2015
//Purpose: To format an input file into a column format, which is written to an output file.
//********************************************************************************
import java.awt.*;
import java.util.*;
import hsa.*;

public class Columnize
{
    static Console c;
    public static void main (String[] args)
    {
	c = new Console (30, 80, "Column Formatting");

	char again = 'y';
	while (again == 'y' || again == 'Y')
	{
	    c.clear ();
	    String inputFileName = "";
	    String outputFileName = "";
	    String line = "";
	    String nextWord = "";
	    String allWords = "";
	    String allJustifiedWords = "";
	    String[] justifiedLines;
	    String[] finalOutput;
	    int columnCount = 4;
	    int width = 35;
	    int currentRow = 1;
	    int count = 0;
	    char justification = 'f';
	    c.print ("Please enter your input file: ");
	    inputFileName = c.readLine ();
	    if (inputFileName.length() < 4)
		inputFileName = inputFileName + ".txt";
	    else if (inputFileName.substring(inputFileName.length()-4).equals(".txt") == false)
		inputFileName = inputFileName + ".txt";
	    TextInputFile input = new TextInputFile (inputFileName);
	    c.print ("Please enter an output file to be created: ");
	    outputFileName = c.readLine ();
	    if (outputFileName.length() < 4)
		outputFileName = outputFileName + ".txt";
	    else if (outputFileName.substring(outputFileName.length()-4).equals(".txt") == false)
		outputFileName = outputFileName + ".txt";
	    TextOutputFile output = new TextOutputFile (outputFileName);
	    c.println ();
	    c.print ("Please enter the width of your text columns (20-50): ");
	    width = c.readInt ();
	    while (width < 20 || width > 50)
	    {
		c.print ("Your width is invalid. Please enter a number between 20 and 50: ");
		width = c.readInt ();
	    }
	    c.println ();
	    c.print ("Now, enter the justification of your text (r,l,c,f): ");
	    justification = c.readChar ();
	    while (justification != 'r' && justification != 'l' && justification != 'c' && justification != 'f')
	    {
		c.print ("Your justification is invalid. Please enter one of these letters (r,l,c,f): ");
		justification = c.readChar ();
	    }
	    c.println ();
	    c.print ("Finally, enter the amount of columns: ");
	    columnCount = c.readInt ();
	    while (columnCount < 1 || columnCount > 4)
	    {
		c.print ("Your amount of columns is invalid. Please enter an integer between 1 and 4: ");
		columnCount = c.readInt ();
	    }
	    c.println ();
	    c.println ("Your text will be formatted onto an output console, and also written to your given file.");
	    c.println ();

	    StringTokenizer inputEdit;

	    while (!input.eof ())
	    {
		inputEdit = new StringTokenizer (input.readLine ());
		while (inputEdit.hasMoreTokens ())
		    allWords = allWords + inputEdit.nextToken () + " ";
	    }
	    input.close ();


	    StringTokenizer totalWords = new StringTokenizer (allWords);
	    nextWord = totalWords.nextToken ();
	    line = "";
	    while (totalWords.hasMoreTokens ())
	    {
		while (line.length () + nextWord.length () + 1 < width && totalWords.hasMoreTokens ())
		{
		    line = line + nextWord + " ";
		    nextWord = totalWords.nextToken ();
		}
		if (totalWords.hasMoreTokens () == false)
		{
		    line = line + nextWord;
		    line = justify (line, justification, width);
		    if (line.length () > width)
			allJustifiedWords = allJustifiedWords + justify (line.substring (0, width), justification, width)
			    + justify (line.substring (width), justification, width);
		    else
			allJustifiedWords = allJustifiedWords + line;
		}
		else
		{
		    line = justify (line, justification, width);
		    allJustifiedWords = allJustifiedWords + line;
		    line = "";
		    count = count + 1;
		}
	    }
	    justifiedLines = new String [allJustifiedWords.length () / width + 1];
	    currentRow = 0;
	    while (allJustifiedWords.length () > width)
	    {
		justifiedLines [currentRow] = allJustifiedWords.substring (0, width);
		allJustifiedWords = allJustifiedWords.substring (width);
		currentRow = currentRow + 1;
	    }
	    
	    if (allJustifiedWords.length () > 0)
	    {
		justifiedLines [currentRow] = allJustifiedWords;
		currentRow = currentRow + 1;
	    }
	    currentRow = currentRow - 1;
	    count = 0;

	    if (columnCount == 1)
	    {
		finalOutput = new String [currentRow + 1];
		while (count <= currentRow)
		{
		    finalOutput [count] = justifiedLines [count];
		    System.out.println (finalOutput [count]);
		    output.println (finalOutput [count]);
		    count = count + 1;
		}
	    }
	    else if (columnCount == 2)
	    {
		finalOutput = new String [currentRow / 2 + 2];
		while (count + (currentRow / 2) < currentRow)
		{
		    finalOutput [count] = justifiedLines [count] + "     " + justifiedLines [count + (currentRow / 2) + 1];
		    System.out.println (finalOutput [count]);
		    output.println (finalOutput [count]);
		    count = count + 1;
		}

		if ((currentRow + 1) % 2 > 0)
		{
		    finalOutput [count] = justifiedLines [currentRow / 2];
		    output.println (finalOutput [count]);
		    System.out.println (finalOutput [count]);
		}

	    }
	    else if (columnCount == 3)
	    {
		finalOutput = new String [currentRow / 3 + 1];
		while (count < currentRow / 3 + 1)
		{
		    finalOutput [count] = justifiedLines [count] + "     "
			+ justifiedLines [count + (currentRow / 3) + 1] + "     "
			+ justifiedLines [count + (2 * currentRow / 3) + 1];
		    System.out.println (finalOutput [count]);
		    output.println (finalOutput [count]);
		    count = count + 1;
		}
		if (currentRow - (count * 3) == 1)
		{
		    finalOutput [count] = justifiedLines [currentRow / 3];
		    System.out.println (finalOutput [count]);
		    output.println (finalOutput [count]);
		}
		else if (currentRow - (count * 3) == 2)
		{
		    finalOutput [count] = justifiedLines [currentRow / 3] + "     "
			+ justifiedLines [2 * currentRow / 3];
		    System.out.println (finalOutput [count]);
		    output.println (finalOutput [count]);
		}
	    }
	    else if (columnCount == 4)
	    {
		finalOutput = new String [currentRow / 4 + 1];
		while (count < currentRow / 4)
		{
		    finalOutput [count] = justifiedLines [count] + "     "
			+ justifiedLines [count + (currentRow / 4)+1] + "     "
			+ justifiedLines [count + (2 * currentRow / 4)+1] + "     "
			+ justifiedLines [count + (3 * currentRow / 4)+1];
		    System.out.println (finalOutput [count]);
		    output.println (finalOutput [count]);
		    count = count + 1;
		}
		if ((currentRow + 1) - (count * 4) == 1)
		{
		    finalOutput [count] = justifiedLines [currentRow / 4];
		    System.out.println (finalOutput [count]);
		}
		else if ((currentRow + 1) - (count * 4) == 2)
		{
		    finalOutput [count] = justifiedLines [currentRow / 4] + "     "
			+ justifiedLines [2 * currentRow / 4];
		    System.out.println (finalOutput [count + 1]);
		    output.println (finalOutput [count + 1]);
		}
		else if ((currentRow + 1) - (count * 4) == 3)
		{
		    finalOutput [count] = justifiedLines [currentRow / 4] + "     "
			+ justifiedLines [2 * currentRow / 4] + "     "
			+ justifiedLines [3 * currentRow / 4];
		    System.out.println (finalOutput [count]);
		    output.println (finalOutput [count]);
		}
		
	    }
	    output.close ();
	    c.println ("Would you like to format another document? Press 'y' to continue, or any other key to exit.");
	    again = c.getChar ();
	}
	c.close ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 24, 2015
    //Purpose: A method which will justify a line according to the parameters.
    //Input: The original line, the type of justification, and the necessary width.
    //Output: A justified new line that has a size accoridng to the width.
    //********************************************************************************

    public static String justify (String line, char justification, int width)
    {
	line = line.trim ();
	if (justification == 'r')
	{
	    while (line.length () < width)
		line = " " + line;
	}
	else if (justification == 'c')
	{
	    while (line.length () + 2 <= width)
		line = " " + line + " ";
		
	    while (line.length () < width)
		line = line + " ";
	}
	else if (justification == 'f')
	{
	    int spaceLocation = line.indexOf (" ");
	    
	    if (spaceLocation != -1)
	    {
		while (line.length () < width)
		{
		    line = line.substring (0, spaceLocation + 1) + " " + line.substring (spaceLocation + 1);
		    line = line.trim ();
		    spaceLocation = line.indexOf (" ", spaceLocation + 2);
		    if (spaceLocation == -1)
			spaceLocation = line.indexOf (" ");
		}
	    }

	    else
	    {
		while (line.length () < width)
		    line = line + " ";
	    }
	}
	
	else
	{
	    while (line.length () < width)
		line = line + " ";
	}
	return line;
    }
}
