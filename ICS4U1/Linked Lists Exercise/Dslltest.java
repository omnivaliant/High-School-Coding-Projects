//********************************************************************************
//Author: Mohit Patel
//Date: December 23, 2015
//Purpose: To create a double sorted linked list class, that will handle names and numbers.
//********************************************************************************

import java.awt.*;
import hsa.Console;

public class Dslltest
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console ("Double Sorted Linked List class");
	char nextAction = '!';
	c.println ("Welcome to the Double Sorted Linked List class!");
	c.println ();
	DSLL userList = new DSLL ();
	String name = "";
	int number = 0;
	Node outputNode = new Node ("", 0);

	while (nextAction != '0')
	{
	    c.println ("List operations: \nPress '1' for the list by name, \n'2' for the list by number, \n" +
		    "'3' to find where a name should go, \n'4' to find where a number should go, \n'5' to insert, \n" +
		    "'6' to find a name, \n'7' to find a number, \n'8' to delete a name, \n'9' to delete a number, or \n'0' to exit.");
	    do
		nextAction = c.getChar ();

	    while (nextAction != '1' && nextAction != '2' && nextAction != '3' && nextAction != '4' && nextAction != '5'
		    && nextAction != '6' && nextAction != '7' && nextAction != '8' && nextAction != '9' && nextAction != '0');

	    c.println ();

	    if (nextAction == '1')
		c.println ("By name: " + userList.byName ());

	    else if (nextAction == '2')
		c.println ("By number: " + userList.byNumber ());

	    else if (nextAction == '3')
	    {
		c.print ("Please insert a name to find: ");
		name = c.readString ();
		outputNode = userList.findBefore (name);
		if (outputNode == null)
		    c.println ("Your name should be the first name in the list.");
		else
		    c.println ("Your name should go after the node: (" + outputNode.name + "," + outputNode.number + ")");
	    }

	    else if (nextAction == '4')
	    {
		c.print ("Please insert a number to find: ");
		number = c.readInt ();
		outputNode = userList.findBefore (number);

		if (outputNode == null)
		    c.println ("Your number should be the first number in the list.");
		else
		    c.println ("Your number should go after the node: (" + outputNode.name + "," + outputNode.number + ")");
	    }

	    else if (nextAction == '5')
	    {
		c.print ("Please enter a name to be inserted: ");
		name = c.readString ();
		c.print ("Now, enter a number to be inserted: ");
		number = c.readInt ();
		userList.insert (name, number);
		c.println ("Your name and number have been inserted.");
	    }

	    else if (nextAction == '6')
	    {
		c.print ("Please enter a name to be found: ");
		name = c.readString ();
		outputNode = userList.find (name);
		if (outputNode == null)
		    c.println ("Your name is not found.");
		else
		    c.println ("Your name is found: it has the node: (" + outputNode.name + "," + outputNode.number + ")");
	    }

	    else if (nextAction == '7')
	    {
		c.print ("Please enter a number to be found: ");
		number = c.readInt ();
		outputNode = userList.find (number);

		if (outputNode == null)
		    c.println ("Your number is not found.");
		else
		    c.println ("Your number is found: it has the node: (" + outputNode.name + "," + outputNode.number + ")");
	    }
	    else if (nextAction == '8')
	    {
		c.print ("Please enter a name to be deleted: ");
		name = c.readString ();
		userList.delete (name);
		c.println ("If your name was found, it has been deleted.");
	    }
	    else if (nextAction == '9')
	    {
		c.print ("Please enter a number to be deleted: ");
		number = c.readInt ();
		userList.delete (number);
		c.println ("If your number was found, it has been deleted.");
	    }
	    c.println ();
	}
	c.close ();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: December 23, 2015
//Purpose: To create a Node class, that will contain a name, number, and two pointers.
//Fields:
//      name: A string representing the string value of the node.
//      number: An integer representing the integer value of the node.
//      nextName: A Node, representing the next name in alphabetical order.
//      nextNumber: A Node, representing the next number in increasing order.
//Methods:
//      constructor: Defaults the name and number to input, and sets the addresses to null.
//      byName: A recursive toString method that will return all the names in sorted order.
//      byNumber: A recursive toString method that will return all the numbers in sorted order.
//********************************************************************************

class Node
{
    public String name;
    public int number;
    public Node nextName;
    public Node nextNumber;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 23, 2015
    //Purpose: A constructor that defaults the name and number to input, and sets the addresses to null.
    //Input: A string for the name, and an integer for the number.
    //Output: Initializes the fields, given the input.
    //********************************************************************************

    public Node (String inputName, int inputNumber)
    {
	this.name = inputName;
	this.number = inputNumber;
	this.nextName = null;
	this.nextNumber = null;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 23, 2015
    //Purpose: To return the string names of all of the nodes after and including the current one.
    //Input: None.
    //Output: A string, representing all of the names.
    //********************************************************************************

    public String byName ()
    {
	String totalName = "";
	totalName = "(" + this.name + "," + this.number + ") ";
	if (this.nextName != null)
	    totalName = totalName + this.nextName.byName ();
	return totalName;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 23, 2015
    //Purpose: To return the integer numbers of all of the nodes after and including the current one.
    //Input: None.
    //Output: A string, representing all of the numbers.
    //********************************************************************************

    public String byNumber ()
    {
	String totalNumber = "";
	totalNumber = "(" + this.number + "," + this.name + ") ";
	if (this.nextNumber != null)
	    totalNumber = totalNumber + this.nextNumber.byNumber ();
	return totalNumber;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: December 24, 2015
//Purpose: To create a Double Sorted Linked List (DSLL) class, that will be sorted in two independant ways.
//Fields:
//      listName: A pointer to the Node containing the first name.
//      listNumber: A pointer to the Node containing the first number.
//Methods:
//      constructor: Initializes both pointers to null.
//      byName: Returns the entire list by name, contained in a string.
//      byNumber: Returns the entire list by number, contained in a string.
//      findBefore: Returns the node before the given 1) name.
//                                                    2) number.
//      insert: Inserts a given name and number into the list.
//      find: Returns a Node with the given 1) name.
//                                          2) number.
//      delete: Deletes the Node given its: 1) name.
//                                          2) number.
//********************************************************************************

class DSLL
{
    protected Node listName;
    protected Node listNumber;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: A constructor that initializes the pointers to null.
    //Input: None.
    //Output: Initializes the pointers to null.
    //********************************************************************************

    public DSLL ()
    {
	this.listName = null;
	this.listNumber = null;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Returns the entire list by name.
    //Input: None.
    //Output: A string representing the entire list of names.
    //********************************************************************************

    public String byName ()
    {
	String output = "Empty.";
	if (this.listName != null)
	    output = this.listName.byName ();
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Returns the entire list by number.
    //Input: None.
    //Output: A string representing the entire list of numbers.
    //********************************************************************************

    public String byNumber ()
    {
	String output = "Empty.";
	if (this.listNumber != null)
	    output = this.listNumber.byNumber ();
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Returns the Node before a given name.
    //Input: A string representing the name to find.
    //Output: The Node before the given name.
    //********************************************************************************

    public Node findBefore (String inputName)
    {
	Node currentNode = this.listName;
	boolean found = false;
	if (currentNode != null)
	{
	    if (currentNode.name.compareTo (inputName) > 0)
	    {
		found = true;
		currentNode = null;
	    }
	    while ((currentNode != null) && (found == false))
	    {
		if (currentNode.nextName != null)
		{
		    if (currentNode.nextName.name.compareTo (inputName) > 0)
		    {
			found = true;
		    }
		    else
			currentNode = currentNode.nextName;
		}
		else
		{
		    found = true;
		    if (currentNode.name.compareTo (inputName) > 0)
			currentNode = null;
		}
	    }
	}
	return currentNode;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Returns the Node before a given number.
    //Input: An integer representing the number to find.
    //Output: The Node before the given number.
    //********************************************************************************

    public Node findBefore (int inputNumber)
    {
	Node currentNode = this.listNumber;
	boolean found = false;

	if (currentNode != null)
	{
	    if (currentNode.number > inputNumber)
	    {
		found = true;
		currentNode = null;
	    }
	    while ((currentNode != null) && (found == false))
	    {
		if (currentNode.nextNumber != null)
		{
		    if (currentNode.nextNumber.number > inputNumber)
			found = true;
		    else
			currentNode = currentNode.nextNumber;
		}
		else
		{
		    found = true;
		    if (currentNode.number > inputNumber)
			currentNode = null;
		}
	    }
	}
	return currentNode;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Inserts a Node into the list, and sorts it by name and number.
    //Input: A String name and integer number to be inserted.
    //Output: None.
    //********************************************************************************

    public void insert (String inputName, int inputNumber)
    {
	Node insertNode = new Node (inputName, inputNumber);
	Node beforeName = this.findBefore (inputName);
	Node beforeNumber = this.findBefore (inputNumber);

	if (beforeName == null)
	{
	    if (this.listName == null)
		this.listName = insertNode;
	    else
	    {
		insertNode.nextName = this.listName;
		this.listName = insertNode;
	    }
	}
	else if (beforeName.nextName == null)
	{
	    beforeName.nextName = insertNode;
	}
	else
	{
	    insertNode.nextName = beforeName.nextName;
	    beforeName.nextName = insertNode;
	}

	if (beforeNumber == null)
	{
	    if (this.listNumber == null)
		this.listNumber = insertNode;
	    else
	    {
		insertNode.nextNumber = this.listNumber;
		this.listNumber = insertNode;
	    }
	}

	else if (beforeNumber.nextNumber == null)
	    beforeNumber.nextNumber = insertNode;

	else
	{
	    insertNode.nextNumber = beforeNumber.nextNumber;
	    beforeNumber.nextNumber = insertNode;
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Finds the node, given the name.
    //Input: The String name to be found.
    //Output: The Node it is contained in, or null if it is not found.
    //********************************************************************************

    public Node find (String inputName)
    {
	Node foundNode = this.listName;

	if (this.listName != null)
	{
	    while (foundNode.name.equals (inputName) == false && foundNode.nextName != null)
		foundNode = foundNode.nextName;

	    if (foundNode.name.equals (inputName) == false)
		foundNode = null;
	}

	return foundNode;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Finds the node, given the number.
    //Input: The number to be found.
    //Output: The Node it is contained in, or null if it is not found.
    //********************************************************************************

    public Node find (int inputNumber)
    {
	Node foundNode = this.listNumber;

	if (this.listName != null)
	{
	    while (foundNode.number != inputNumber && foundNode.nextNumber != null)
		foundNode = foundNode.nextNumber;

	    if (foundNode.number != inputNumber)
		foundNode = null;
	}

	return foundNode;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Deletes a node, given the name.
    //Input: The name to be deleted.
    //Output: None.
    //********************************************************************************

    public void delete (String deleteString)
    {
	Node beforeName = this.listName;
	int deleteNumber = 0;
	boolean foundNode = false;
	if (beforeName != null)
	{
	    if (beforeName.name.equals (deleteString))
	    {
		deleteNumber = this.listName.number;
		this.listName = this.listName.nextName;
		foundNode = true;
	    }
	    else
	    {
		while (beforeName.nextName != null && foundNode == false)
		{
		    if (beforeName.nextName.name.equals (deleteString))
		    {
			foundNode = true;
			deleteNumber = beforeName.nextName.number;
			beforeName.nextName = beforeName.nextName.nextName;
		    }
		    else
			beforeName = beforeName.nextName;
		}
	    }
	}

	if (foundNode = true)
	{
	    Node beforeNumber = this.listNumber;

	    if (beforeNumber != null)
	    {
		if (beforeNumber.number == deleteNumber)
		    this.listNumber = this.listNumber.nextNumber;
		else
		{
		    foundNode = false;
		    while (beforeNumber.nextNumber != null && foundNode == false)
		    {
			if (beforeNumber.nextNumber.number == deleteNumber)
			{
			    beforeNumber.nextNumber = beforeNumber.nextNumber.nextNumber;
			    foundNode = true;
			}
			else
			    beforeNumber = beforeNumber.nextNumber;
		    }
		}
	    }
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 24, 2015
    //Purpose: Deletes a node, given the number.
    //Input: The number to be deleted.
    //Output: None.
    //********************************************************************************

    public void delete (int deleteNumber)
    {
	Node beforeNumber = this.listNumber;
	String deleteName = "";
	boolean foundNode = false;
	if (beforeNumber != null)
	{
	    if (beforeNumber.number == deleteNumber)
	    {
		deleteName = this.listNumber.name;
		this.listNumber = this.listNumber.nextNumber;
		foundNode = true;
	    }
	    else
	    {
		while (beforeNumber.nextNumber != null && foundNode == false)
		{
		    if (beforeNumber.nextNumber.number == deleteNumber)
		    {
			foundNode = true;
			deleteName = beforeNumber.nextNumber.name;
			beforeNumber.nextNumber = beforeNumber.nextNumber.nextNumber;
		    }
		    else
			beforeNumber = beforeNumber.nextNumber;
		}
	    }
	}
	if (foundNode = true)
	{
	    Node beforeName = this.listName;

	    if (beforeName != null)
	    {
		if (beforeName.name.equals (deleteName))
		    this.listName = this.listName.nextName;
		else
		{
		    foundNode = false;

		    while (beforeName.nextName != null && foundNode == false)
		    {
			if (beforeName.nextName.name.equals (deleteName))
			{
			    beforeName.nextName = beforeName.nextName.nextName;
			    foundNode = true;
			}
			else
			    beforeName = beforeName.nextName;
		    }
		}
	    }
	}
    }
}
