//********************************************************************************
//Author: Mohit Patel
//Date: October 22, 2015
//Purpose: To create some methods relevant to strings.
//********************************************************************************
import java.awt.*;
import hsa.Console;

public class Strings
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console (30, 70, "String Processing");
	char again = 'y';
	while (again == 'y')
	{
	    c.clear ();
	    String originalString = "This is the state of Mississippi.";
	    String oldString = "is";
	    String newString = "twis";
	    String firstString = "hello";
	    String secondString = "lollh";
	    c.println ("Please enter a string to be modified.");
	    originalString = c.readLine ();
	    c.println ("Please enter the old string to be replaced.");
	    oldString = c.readLine ();
	    c.println ("Please enter the new string to replace the old string occurances.");
	    newString = c.readLine ();
	    originalString = replace (originalString, oldString, newString);
	    c.println ("Your string is now: " + originalString);
	    c.println ();
	    c.println ("Please enter the first string to check its permutations.");
	    firstString = c.readString ();
	    c.println ("Please enter the second string to check its permutations.");
	    secondString = c.readString ();
	    
	    if (permuted(firstString,secondString) == true)
		c.println("Your strings are permutations of each other!");
	    else
		c.println("Your strings are not permutations of each other!.");

	    c.println ();
	    c.println ("Would you like to test another set of strings? Press 'y' to continue, or any other key to exit.");
	    again = c.getChar ();

	}
	c.close ();
    }

    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 22, 2015
    //Purpose: A method which will replace all occurances of the old string in the given
    //         string with the new string.
    //Input: The original string, the old string to be replaced, and the new replacing string.
    //Output: The new string which has all occurances of the oldString replaced.
    //********************************************************************************

    public static String replace (String originalString, String oldString, String newString)
    {
	int count = originalString.indexOf (oldString);
	
	if (oldString.equals("") == false)
	{
	    while (count != -1)
	    {
		originalString = originalString.substring (0, count) + newString + originalString.substring (count + oldString.length ());
		count = originalString.indexOf (oldString, count + newString.length ());
	    }
	}
	return originalString;
    }

    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 22, 2015
    //Purpose: A method which will determine if two methods are permutations of each other.
    //Input: The two strings to check if they are permutations of each other.
    //Output: The boolean representing if the strings are permutations of each other.
    //********************************************************************************

    public static boolean permuted (String firstString, String secondString)
    {
	boolean isPermutation = true;
	if (firstString.length () != secondString.length ())
	    isPermutation = false;
	else
	{
	    while ((firstString.length () > 0) && (isPermutation == true))
	    {
		if (secondString.indexOf (firstString.charAt (0)) == -1)
		    isPermutation = false;
		else
		{
		    secondString = secondString.substring (0, secondString.indexOf (firstString.charAt (0))) + secondString.substring (secondString.indexOf (firstString.charAt (0)) + 1);
		    firstString = firstString.substring (1);
		}
	    }
	    if (secondString.length () > 0)
		isPermutation = false;
	}
	return isPermutation;
    }
}
