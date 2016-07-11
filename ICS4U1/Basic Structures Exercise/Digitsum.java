//***********************************************************************
//Author: Mohit Patel
//Date: September 11, 2015
//Purpose: To find the digital sum of a given number.
//Input: A positive integer.
//Output: An integer representing the digit sum.
//***********************************************************************
import java.awt.*;
import hsa.Console;

public class Digitsum
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console ("Digit Sum");
	int number = 0;
	char again = 'y';

	while (again == 'y' || again == 'Y')
	{
	    c.println ("Please enter a number to find a digital sum for.");
	    number = c.readInt ();

	    while (number < 0)
	    {
		c.println ("Your number is less than 0. Please enter a positive integer.");
		number = c.readInt ();
	    }

	    while (number > 9)
		number = number / 10 + number % 10;

	    c.println ();
	    c.println ("The digital sum of your number is: " + number + ".");
	    c.println ("Would you like a digital sum of another number?");
	    c.println ("Press 'y' to continue, or any other character to finish.");
	    again = c.getChar ();
	    c.println ();
	}
	c.close ();
    }
}
