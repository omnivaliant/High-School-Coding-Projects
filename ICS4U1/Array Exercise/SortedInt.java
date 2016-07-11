//********************************************************************************
//Author: Mohit Patel
//Date: October 8, 2015
//Purpose: To create a SortedIntGroup class, with various properties and methods.
//********************************************************************************
import java.awt.*;
import hsa.Console;

public class SortedInt
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console (30, 70, "SortedIntGroup Class");
	char again = 'y';
	while (again == 'y'||again=='Y')
	{
	    c.clear ();
	    int firstSize = 0;
	    int secondSize = 0;
	    int count = 0;
	    c.print("Please enter the size of your first array: ");
	    firstSize = c.readInt();
	    while (firstSize < 0)
	    {
		c.print("Your size is invalid. Please enter a positive integer.");
		firstSize = c.readInt();
	    }
	    c.println();
	    int[] firstArray = new int [firstSize];
	    for (count = 0; count < firstSize; count++)
	    {
		c.print("Please enter a value for position " + (count+1) + " of the array.");
		firstArray[count] = c.readInt();
		if (count>0)
		{
		    while (firstArray[count-1] > firstArray[count])
		    {
			c.print("Your value is not greater than " + firstArray[count-1] + ". Please enter a greater integer: ");
			firstArray[count] = c.readInt();
		    }
		}
	    }
	    c.println();
	    c.print("Now, enter the size of your second array: ");
	    secondSize = c.readInt();
	    while (secondSize < 0)
	    {
		c.print("Your size is invalid. Please enter a positive integer.");
		secondSize = c.readInt();
	    }
	    int[] secondArray = new int [secondSize];
	    for (count = 0; count < secondSize; count++)
	    {
		c.print("Please enter a value for position " + (count+1) + " of the array.");
		secondArray[count] = c.readInt();
		if (count>0)
		{
		    while (secondArray[count-1] > secondArray[count])
		    {
			c.print("Your value is not greater than " + secondArray[count-1] + ". Please enter a greater integer: ");
			secondArray[count] = c.readInt();
		    }
		}
	    }
	    SortedIntGroup firstIntGroup = new SortedIntGroup (firstArray);
	    SortedIntGroup secondIntGroup = new SortedIntGroup (secondArray);
	    c.println ("First Int Group: " + firstIntGroup);
	    c.println ("Second Int Group: " + secondIntGroup);
	    SortedIntGroup mergedIntGroup = new SortedIntGroup (10);
	    mergedIntGroup = firstIntGroup.merge (secondIntGroup);
	    c.println ("Merged Int Group: " + mergedIntGroup);
	    mergedIntGroup.dropDups();
	    c.println ("If you drop the duplicates in the merged group, you get " + mergedIntGroup + ".");
	    Run longestRun = new Run ();
	    longestRun = mergedIntGroup.longestRun ();
	    c.println ("The start of the longest run in the merged group is " + longestRun.start + ".");
	    c.println ("The length of the longest run in the merged group is " + longestRun.length + ".");
	    c.println ("Would you like to test another SortedIntGroup class?" +
		    " Press 'y' to continue, or any other key to exit.");

	    again = c.getChar ();

	}
	c.close ();


    }
}


//********************************************************************************
//Author: Mohit Patel
//Date: October 8, 2015
//Purpose: To create a SortedIntGroup class, with various fields and methods.
//Fields:
//       int[] intArray: An integer array representing the sorted  integers.
//       size: An integer representing the size of the SortedIntGroup.
//Methods:
//       constructor: To initialize the SortedIntGroup with:
//                    1) Size as a parameter, and the intArray as all consecutive integers
//                       until the size.
//                    2) An integer array as the parameter; if the array is not sorted,
//                       set it to an empty array with size 0, otherwise copy all elements
//                       into the intArray and make the size equal to its length.
//                    3) No parameter; set the size to 0 with no elements in the intArray.
//       toString: Converts the elements of the array and then the size in brackets into a string.
//       sorted: Returns if the SortedIntGroup is indeed sorted.
//       dropDups: Removes duplicate values from the intArray, and adjusts the size after.
//       merge: Merges the current SortedIntGroup with a given SortedIntGroup.
//       longestRun: Returns the longest consecutive Run (a class) of the elements.
//********************************************************************************

class SortedIntGroup
{

    protected int[] intArray;
    protected int size;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 8, 2015
    //Purpose: A constructor that creates a SortedIntGroup with a size parameter.
    //Input: An integer size.
    //Output: Initializes the size with the parameter, and the elements in the list
    //        with all consecutive integers from 1 to the size.
    //********************************************************************************

    public SortedIntGroup (int inputSize)
    {

	if (inputSize < 0)
	    new SortedIntGroup ();

	else
	{
	    this.size = inputSize;
	    this.intArray = new int [inputSize];
	    int offset = 0;

	    for (offset = 0 ; offset < inputSize ; offset++)
		this.intArray [offset] = offset + 1;
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 8, 2015
    //Purpose: A constructor that creates a SortedIntGroup based on an integer array.
    //Input: An integer array.
    //Output: Initialises the size with the parameter, and the elements in the list
    //        with all elements in the integer array, assuming that the array is sorted.
    //        Else, initialises the size as 0 with no elements.
    //********************************************************************************

    public SortedIntGroup (int[] inputArray)
    {
	int offset = 0;
	this.intArray = inputArray;
	this.size = inputArray.length;

	if (this.sorted () == false)
	{
	    int[] emptyArray = new int [0];
	    this.intArray = emptyArray;
	    this.size = 0;
	}

	else

	    for (offset = 0 ; offset < inputArray.length ; offset++)
	    {
		this.intArray [offset] = inputArray [offset];
	    }

	this.size = inputArray.length;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 8, 2015
    //Purpose: A constructor that creates an empty SortedIntGroup with no parameters.
    //Input: None.
    //Output: A SortedIntGroup with a size of 0 and no elements.
    //********************************************************************************

    public SortedIntGroup ()
    {
	this (0);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 8, 2015
    //Purpose: To convert the SortedIntGroup into a string format.
    //Input: None.
    //Output: The SortedIntGroup as a string with all elements in consecutive order,
    //        followed by the size after in brackets.
    //********************************************************************************

    public String toString ()
    {
	int elementCount = 0;
	String printGroup = "";

	for (elementCount = 0 ; elementCount < this.size ; elementCount++)
	    printGroup = printGroup + this.intArray [elementCount] + " ";

	printGroup = printGroup + "(" + this.size + ")";
	return printGroup;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 8, 2015
    //Purpose: To determine if the SortedIntGroup is sorted in ascending order or not.
    //Input: None.
    //Output: A boolean value representing if the SortedIntGroup is sorted or not.
    //********************************************************************************

    private boolean sorted ()
    {
	boolean isSorted = true;
	int count = 1;

	for (count = 1 ; count < this.size ; count++)
	{

	    if (this.intArray [count] < this.intArray [count - 1])
	    {
		isSorted = false;
	    }
	}
	return isSorted;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 8, 2015
    //Purpose: To remove all duplicates in the SortedIntGroup.
    //Input: None.
    //Output: Eliminates all repeating elements, and adjusts the size after.
    //********************************************************************************

    public void dropDups ()
    {
	int[] droppedDups;
	int numDups = 0;
	int offsetCount = 0;
	int newPosition = 0;

	for (offsetCount = 0 ; offsetCount < (this.size - 1) ; offsetCount++)
	{

	    if (this.intArray [offsetCount] == this.intArray [offsetCount + 1])
	    {
		numDups = numDups + 1;
	    }
	}
	droppedDups = new int [this.size - numDups];

	for (offsetCount = 0 ; offsetCount < (this.size - 1) ; offsetCount++)
	{

	    if (this.intArray [offsetCount] != this.intArray [offsetCount + 1])
	    {
		droppedDups [newPosition] = this.intArray [offsetCount];
		newPosition = newPosition + 1;
	    }
	}
	droppedDups [newPosition] = this.intArray [offsetCount];
	this.intArray = droppedDups;
	this.size = droppedDups.length;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 8, 2015
    //Purpose: To merge the current SortedIntGroup with a given SortedIntGroup.
    //Input: A SortedIntGroup to be merged.
    //Output: A SortedIntGroup that has all sorted elements from both intGroups.
    //********************************************************************************

    public SortedIntGroup merge (SortedIntGroup inputGroup)
    {
	SortedIntGroup mergeGroup = new SortedIntGroup ();
	int[] mergeArray = new int [this.size + inputGroup.size];
	int maxIndex = 0;
	int currentIndex = 0;
	int inputIndex = 0;

	if (this.size < inputGroup.size)
	{

	    for (maxIndex = 0 ; maxIndex < mergeArray.length ; maxIndex++)
	    {

		if ((inputIndex < inputGroup.size) && (currentIndex < this.size))
		{

		    if (inputGroup.intArray [inputIndex] < this.intArray [currentIndex])
		    {
			mergeArray [maxIndex] = inputGroup.intArray [inputIndex];
			inputIndex = inputIndex + 1;
		    }

		    else
		    {
			mergeArray [maxIndex] = this.intArray [currentIndex];
			currentIndex = currentIndex + 1;
		    }
		}

		else if (inputIndex == inputGroup.size)
		{
		    mergeArray [maxIndex] = this.intArray [currentIndex];
		    currentIndex = currentIndex + 1;
		}

		else
		{
		    mergeArray [maxIndex] = inputGroup.intArray [inputIndex];
		    inputIndex = inputIndex + 1;
		}
	    }
	}

	else if (this.size > inputGroup.size)
	{

	    for (maxIndex = 0 ; maxIndex < mergeArray.length ; maxIndex++)
	    {

		if ((currentIndex < this.size) && (inputIndex < inputGroup.size))
		{

		    if (this.intArray [currentIndex] < inputGroup.intArray [inputIndex])
		    {
			mergeArray [maxIndex] = this.intArray [currentIndex];
			currentIndex = currentIndex + 1;
		    }

		    else
		    {
			mergeArray [maxIndex] = inputGroup.intArray [inputIndex];
			inputIndex = inputIndex + 1;
		    }
		}

		else if (currentIndex == this.size)
		{
		    mergeArray [maxIndex] = inputGroup.intArray [inputIndex];
		    inputIndex = inputIndex + 1;
		}

		else
		{
		    mergeArray [maxIndex] = this.intArray [currentIndex];
		    currentIndex = currentIndex + 1;
		}
	    }
	}

	else
	{

	    for (maxIndex = 0 ; maxIndex < mergeArray.length ; maxIndex++)
	    {

		if ((currentIndex < this.size) && (inputIndex < inputGroup.size))

		    if (this.intArray [currentIndex] < inputGroup.intArray [inputIndex])
		    {
			mergeArray [maxIndex] = this.intArray [currentIndex];
			currentIndex = currentIndex + 1;
		    }
		    else

			{
			    mergeArray [maxIndex] = inputGroup.intArray [inputIndex];
			    inputIndex = inputIndex + 1;
			}

		else if (currentIndex == this.size)
		{
		    mergeArray [maxIndex] = inputGroup.intArray [inputIndex];
		    inputIndex = inputIndex + 1;
		}

		else
		{
		    mergeArray [maxIndex] = this.intArray [currentIndex];
		    currentIndex = currentIndex + 1;
		}
	    }
	}

	mergeGroup.intArray = mergeArray;
	mergeGroup.size = mergeArray.length;
	return mergeGroup;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 8, 2015
    //Purpose: To determine the longest Run in the sortedIntGroup
    //Input: None.
    //Output: A containter class Run, with the integer start of the run as well as the
    //        length of the run as data fields.
    //********************************************************************************

    public Run longestRun ()
    {
	Run currentRun = new Run ();
	int currentIndex = 0;
	int startingIndex = 0;
	int runLength = 0;
	int prevRun = 0;
	boolean isConsecutive = false;

	for (currentIndex = 0 ; currentIndex < (this.size - 1) ; currentIndex++)
	{

	    if ((isConsecutive == false) && (this.intArray [currentIndex + 1] == this.intArray [currentIndex] + 1))
	    {
		isConsecutive = true;
		startingIndex = currentIndex;
		runLength = 2;
		if (currentIndex == this.size - 2)
		{
		    isConsecutive = false;

		    if (runLength > prevRun)
		    {
			currentRun.start = startingIndex;
			currentRun.length = runLength;
			prevRun = runLength;
		    }
		    runLength = 0;
		}
	    }

	    else if ((isConsecutive == true) && (this.intArray [currentIndex + 1] == this.intArray [currentIndex] + 1))
	    {
		runLength = runLength + 1;

		if (currentIndex == this.size - 2)
		{
		    isConsecutive = false;

		    if (runLength > prevRun)
		    {
			currentRun.start = startingIndex;
			currentRun.length = runLength;
			prevRun = runLength;
		    }
		    runLength = 0;
		}
	    }

	    else if (isConsecutive == true)
	    {
		isConsecutive = false;

		if (runLength > prevRun)
		{
		    currentRun.start = startingIndex;
		    currentRun.length = runLength;
		    prevRun = runLength;
		}
		runLength = 0;
	    }
	}
	return currentRun;

    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: October 9, 2015
//Purpose: To create a Run "container" class, with a start and a length.
//Fields:
//       start: The starting integer of the longest run.
//       length: The length of the longest run.
//Methods: None; it is a "container" class
//********************************************************************************

class Run
{
    public int start;
    public int length;
}
