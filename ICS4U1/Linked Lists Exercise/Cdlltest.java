//********************************************************************************
//Author: Mohit Patel
//Date: December 12, 2015
//Purpose: To create a doubly linked circular linked list, that handles integer data.
//********************************************************************************

import java.awt.*;
import hsa.Console;

public class Cdlltest
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console ("CircularList class");
	char nextAction = '!';
	c.println ("Welcome to the Doubly, Circular Linked List class!");
	c.println ();
	CircularList firstList = new CircularList ();
	CircularList splitList = new CircularList ();
	int inputInt = 0;
	int beforeInt = 0;

	while (nextAction != 'e')
	{
	    c.println ("Node operations: \nPress 'n' to return the amount of nodes, \n'i' to insert a node, \n'd' to delete a node, \n'l' to return the list counting left, " +
		    "\n'r' for the list counting right, \n's' to split the list in half, or \n'e' to exit.");
	    do
		nextAction = c.getChar ();

	    while (nextAction != 'n' && nextAction != 'i' && nextAction != 'd' && nextAction != 'l'
		    && nextAction != 'r' && nextAction != 's' && nextAction != 'e');
	    c.println ();

	    if (nextAction == 'n')
		c.println ("Your number of nodes is: " + firstList.numNodes () + ".");

	    else if (nextAction == 'i')
	    {
		c.println ("Inserting left!");
		c.print ("Please enter a value to insert: ");
		inputInt = c.readInt ();
		c.print ("Enter the value to place it to the left: ");
		beforeInt = c.readInt ();
		firstList.insertLeft (inputInt, beforeInt);
		c.println ("Your number has been inserted.");
	    }

	    else if (nextAction == 'd')
	    {
		c.print ("Please enter the value to delete: ");
		inputInt = c.readInt ();

		if (firstList.delete (inputInt))
		    c.println ("Your number has been deleted.");
		else
		    c.println ("Your number was not found; therefore, it has not been deleted.");
	    }
	    else if (nextAction == 'l')
		c.println ("The list going left is: " + firstList.toStringLeft ());

	    else if (nextAction == 'r')
		c.println ("The list going right is: " + firstList.toStringRight ());

	    else if (nextAction == 's')
	    {
		splitList = firstList.splitInTwo ();
		c.println ("Your first list, after being split going right is: " + firstList.toStringRight ());
		c.println ("Your second list, after being split going right is: " + splitList.toStringRight ());
	    }
	    c.println ();


	}
	c.close ();

    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: December 12, 2015
//Purpose: To create a Node class, that will contain an integer and two pointers.
//Fields:
//      data: An integer contained in the node.
//      left: A Node, representing the previous consecutive node in the circle.
//      right: A Node, representing the next consecutive node in the circle.
//Methods:
//      constructor: Defaults the data, left, and right.
//********************************************************************************

class Node
{
    public int data;
    public Node left;
    public Node right;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 12, 2015
    //Purpose: A constructor that initializes the data to the input, and the left and right to null.
    //Input: An integer, representing the data it carries.
    //Output: Initializes the fields, given the input.
    //********************************************************************************

    public Node (int inputInt)
    {
	this.data = inputInt;
	this.left = null;
	this.right = null;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: December 12, 2015
//Purpose: To create a Circular linked list class, that will be doubly linked.
//Fields:
//      list: The header node, which contains information about the list.
//Methods:
//      constructor: Initializes the list with a size value of an input.
//      numNodes: Returns the value in the header Node.
//      insertLeft: Inserts a value to the left of another value.
//      delete: Deletes a node given its value.
//      toStringLeft: Creates a string of the list values, going left.
//      toStringRight: Creates a string of the list values, going right.
//      splitInTwo: Splits the current list in half, given that it is even.
//********************************************************************************

class CircularList
{
    protected Node list;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 12, 2015
    //Purpose: A constructor that initializes the list to 0.
    //Input: None.
    //Output: Initializes the empty list.
    //********************************************************************************

    public CircularList ()
    {
	this.list = new Node (0);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 12, 2015
    //Purpose: Returns the value in the header node.
    //Input: None.
    //Output:The integer value in the header node.
    //********************************************************************************

    public int numNodes ()
    {
	return this.list.data;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 12, 2015
    //Purpose: A constructor that will insert a node to the left of a given value.
    //Input: The value to insert, and the value to search for.
    //Output: None.
    //********************************************************************************

    public void insertLeft (int intInsert, int intBefore)
    {
	Node insertNode = new Node (intInsert);
	if (this.numNodes () == 0)
	{
	    this.list.left = insertNode;
	    this.list.right = insertNode;
	    insertNode.left = insertNode;
	    insertNode.right = insertNode;
	}
	else
	{
	    Node currentNode = this.list.left;
	    while (currentNode.data != intBefore && currentNode.left != this.list.left)
		currentNode = currentNode.left;

	    if (currentNode.data == intBefore)
	    {
		insertNode.right = currentNode;
		insertNode.left = currentNode.left;
		currentNode.left.right = insertNode;
		currentNode.left = insertNode;
		if (insertNode.right == this.list.right)
		    this.list.right = insertNode;

	    }
	    else
	    {
		insertNode.left = this.list.left;
		insertNode.right = this.list.right;
		;
		this.list.left.right = insertNode;
		this.list.right.left = insertNode;
		this.list.left = insertNode;
	    }
	}
	this.list.data = this.list.data + 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 12, 2015
    //Purpose: To delete a node from the list, given a value.
    //Input: The value to delete.
    //Output: A boolean representing if the node was deleted or not.
    //********************************************************************************

    public boolean delete (int intDelete)
    {
	boolean deleted = false;
	if (this.numNodes () != 0)
	{
	    Node currentNode = this.list.left;
	    while (currentNode.data != intDelete && currentNode.left != this.list.left)
		currentNode = currentNode.left;
	    if (currentNode.data == intDelete)
	    {
		if (this.numNodes () == 1)
		{
		    this.list.left = null;
		    this.list.right = null;
		}
		else
		{
		    if (this.list.left == currentNode)
			this.list.left = currentNode.left;
		    if (this.list.right == currentNode)
			this.list.right = currentNode.right;
		    currentNode = currentNode.right;
		    currentNode.left.left.right = currentNode;
		    currentNode.left = currentNode.left.left;
		}
		this.list.data = this.list.data - 1;
		deleted = true;
	    }
	}
	return deleted;


    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 12, 2015
    //Purpose: To create a string value of the entire list, going left.
    //Input: None.
    //Output: The list as a string, going left.
    //********************************************************************************

    public String toStringLeft ()
    {
	String outputString = "";
	if (this.numNodes () == 0)
	{
	    outputString = "(0)";
	}
	else
	{
	    Node currentNode = this.list.left;
	    outputString = "" + currentNode.data;
	    while (currentNode.left != this.list.left)
	    {
		currentNode = currentNode.left;
		outputString = outputString + " " + currentNode.data;
	    }
	    outputString = outputString + " (" + this.numNodes () + ")";
	}
	return outputString;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 12, 2015
    //Purpose: To create a string value of the entire list, going right.
    //Input: None.
    //Output: The list as a string, going right.
    //********************************************************************************

    public String toStringRight ()
    {
	String outputString = "";
	if (this.numNodes () == 0)
	{
	    outputString = "(0)";
	}
	else
	{
	    Node currentNode = this.list.right;
	    outputString = "" + currentNode.data;
	    while (currentNode.right != this.list.right)
	    {
		currentNode = currentNode.right;
		outputString = outputString + " " + currentNode.data;
	    }
	    outputString = outputString + " (" + this.numNodes () + ")";
	}
	return outputString;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 12, 2015
    //Purpose: To split the list into half, if the list is even.
    //Input: None.
    //Output: The second half of the list.
    //********************************************************************************

    public CircularList splitInTwo ()
    {
	CircularList secondList = new CircularList ();
	CircularList outputList = new CircularList ();
	if (!((this.numNodes () == 0) || (this.numNodes () % 2 == 1)))
	{
	    Node currentNode = this.list.left;
	    int currentCount = 1;

	    while (this.numNodes () / 2 > currentCount)
	    {
		currentNode = currentNode.left;
		currentCount = currentCount + 1;
	    }

	    Node secondNode = currentNode.left;
	    currentNode.left = this.list.left;
	    secondList.list.left = secondNode;
	    secondList.list.right = this.list.right;
	    this.list.right.left = secondList.list.left;
	    this.list.right = currentNode;
	    this.list.left.right = this.list.right;
	    secondNode.right = secondList.list.right;
	    secondList.list.data = this.numNodes () / 2;
	    this.list.data = this.list.data / 2;
	    outputList.list = this.list;
	    this.list = secondList.list;
	}
	return outputList;
    }
}
