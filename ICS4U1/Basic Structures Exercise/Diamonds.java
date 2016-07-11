//**************************************************************************
//Author: Mohit Patel
//Date: September 11, 2015
//Purpose: To allow the user to create various shapes in various forms.
//Input: Console input of size(integer) and type(char).
//Output: A design using "*" based on the size and type.
//**************************************************************************
import java.awt.*;
import hsa.Console;

public class Diamonds
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console (40, 100, "Diamonds");
	char again = 'y';
	int size = 0;
	int diamondLine = 1;
	int diamondWidth = 1;
	int spaces = 1;
	char type = 'f';

	while (again == 'y' || again == 'Y')
	{
	    c.println ("Please enter a size for the diamond to be created.");
	    size = c.readInt ();

	    while ((size < 1) || (size > 25) || (size % 2 == 0))
	    {
		c.println ("Your size is invalid. Please enter an odd size between 1 and 25.");
		size = c.readInt ();
	    }

	    c.println ("Do you want the diamond to be filled or hollow? Press 'f' for filled, or 'h' for hollow.");
	    type = c.getChar ();

	    while (!(type == 'f' || type == 'h'))
	    {
		c.println ("Your trait is invalid. Please press 'f' for filled, or 'h' for hollow.");
		type = c.getChar ();
	    }

	    c.println ("Your diamond is size " + size + ".");
	    c.print (' ');

	    for (diamondLine = 1 ; diamondLine <= size ; diamondLine++)
		c.print ("*");

	    c.println (" ");

	    if (type == 'f')
	    {
		for (diamondLine = size + 2 ; diamondLine > 0 ; diamondLine = diamondLine - 2)
		{
		    while (spaces <= ((size + 2 - diamondLine) / 2))
		    {
			c.print (" ");
			spaces++;
		    }
		    spaces = 1;

		    while (diamondWidth <= diamondLine)
		    {
			c.print ("*");
			diamondWidth++;
		    }

		    c.println (" ");
		    diamondWidth = 1;
		}
	    }
	    else
	    {
		for (diamondLine = size + 2 ; diamondLine > 1 ; diamondLine = diamondLine - 2)
		{
		    while (spaces <= ((size + 2 - diamondLine) / 2))
		    {
			c.print (" ");
			spaces++;
		    }

		    c.print ("*");
		    spaces = 1;

		    while (spaces <= diamondLine - 2)
		    {
			c.print (" ");
			spaces++;
		    }

		    c.print ("*");
		    spaces = 1;
		    c.println (" ");
		    diamondWidth = 1;
		}

		while (spaces <= ((size + 1 - diamondLine) / 2))
		{
		    c.print (" ");
		    spaces++;
		}

		c.println (" *");
		c.println (" ");
	    }
	    c.println ("Would you like to create another shape?");
	    c.println ("Press 'y' to continue, or any other character to finish.");
	    again = c.getChar ();
	    c.println ("");
	}
	c.close ();
    }
}
