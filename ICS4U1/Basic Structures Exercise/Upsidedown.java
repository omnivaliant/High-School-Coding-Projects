//**************************************************************************************************
//Author: Mohit Patel
//Date: September 13, 2015
//Purpose: To allow the user to find upside-down numbers in a range.
//Input: Two positive integers, representing the inclusive minimum and maximum numbers in the range.
//Output: All the numbers which look the same upside-down as they do forwards.
//**************************************************************************************************

import java.awt.*;
import hsa.Console;

public class Upsidedown
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console ("Upside Down");
	char again = 'y';
	int min = 0;
	int max = 0;
	int count = 0;
	int currentNumber = 0;
	int currentDigit = 0;
	int backwardsNumber = 0;
	int backwardsCount = 0;

	while (again == 'y' || again == 'Y')
	{
	    c.println ("Please enter a minimum value for the range of upside-down numbers.");
	    min = c.readInt ();

	    while (min < 0)
	    {
		c.println ("Your minimum number is negative. Please enter a positive size.");
		min = c.readInt ();
	    }

	    c.println ("Please enter a maximum value for the range of upside-down numbers.");
	    max = c.readInt ();

	    while (max < min)
	    {
		c.println ("Your maximum number is less than " + min + ". Please enter a greater maximum size.");
		max = c.readInt ();
	    }

	    c.println ();
	    c.println ("The following numbers look the same backwards as they do forwards: ");

	    for (count = min ; count <= max ; count++)
	    {
		currentNumber = count;

		while (currentNumber > 0)
		{
		    currentDigit = currentNumber % 10;
		    if (currentDigit == 6)
			backwardsNumber = backwardsNumber * 10 + 9;
		    else if (currentDigit == 9)
			backwardsNumber = backwardsNumber * 10 + 6;
		    else if ((currentDigit == 0) || (currentDigit == 1) || (currentDigit == 8))
			backwardsNumber = backwardsNumber * 10 + currentDigit;
		    currentNumber = currentNumber / 10;
		}

		if (backwardsNumber == count)
		{
		    c.println (backwardsNumber);
		    backwardsCount = backwardsCount + 1;
		}

		backwardsNumber = 0;
	    }
	    c.println ();
	    c.println ("There are " + backwardsCount + " backward numbers in the interval.");
	    c.println ("Would you like to calculate another interval?");
	    c.println ("Press 'y' to continue, or any other character to finish.");
	    again = c.getChar ();
	    backwardsCount = 0;
	    c.println ("");
	}
	c.close ();
    }
}
