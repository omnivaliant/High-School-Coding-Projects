//*******************************************************************************************************
//Author: Mohit Patel
//Date: September 14, 2015
//Purpose: To create the consecutive series for a range of numbers.
//Input: Two positive integers, in any order, representing the range of values
//Output: The various consecutive numbers which add up to each number in the range, for all the numbers.
//*******************************************************************************************************
import java.awt.*;
import hsa.Console;

public class Consecutive
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console ("Consecutive Series");
	int min = 1;
	int max = 2;
	float first = 0;
	float last = 1;
	int termNum = 1;
	int numberOfSeries = 0;
	int rangeDigit = 1;
	char again = 'y';

	while (again == 'y' || again == 'Y')
	{
	    c.println ("Please enter the first number for the range.");
	    min = c.readInt ();

	    while (min < 0)
	    {
		c.println ("Your first number is too small. Please enter a value of at least 0.");
		min = c.readInt ();
	    }

	    c.println ("Please enter the second number for the range.");
	    max = c.readInt ();

	    while (max < 0)
	    {
		c.println ("Your second number is too small. Please enter a value of at least 0.");
		max = c.readInt ();
	    }

	    if (max < min)
	    {
		int temp = max;
		max = min;
		min = temp;
	    }
	    
	    c.println (" ");

	    for (rangeDigit = min ; rangeDigit <= max ; rangeDigit++)
	    {
		numberOfSeries = 0;
		c.print (rangeDigit + ": ");

		for (termNum = rangeDigit ; termNum >= 1 ; termNum--)
		{
		    first = (float) rangeDigit / termNum - (float) termNum / 2 + (float) 1 / 2;
		    last = (2 * (float) rangeDigit / termNum - first);

		    if (((int) first) == first && (first < last) && (first > 0))
		    {
			c.print ((int) first + "-" + (int) last + " ");
			numberOfSeries = numberOfSeries + 1;
		    }
		}
		c.println ("(" + numberOfSeries + ")");
	    }
	    c.println (" ");
	    c.println ("Would you like to create another consecutive series?");
	    c.println ("Press 'y' to continue, or any other character to finish.");
	    again = c.getChar ();
	    c.println (" ");
	}
	c.close ();
    }
}
