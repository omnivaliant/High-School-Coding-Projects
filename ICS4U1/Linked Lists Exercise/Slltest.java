//********************************************************************************
//Author: Mohit Patel
//Date: December 2, 2015
//Purpose: To create a singly linked list, that handles strings.
//********************************************************************************

import java.awt.*;
import hsa.Console;

public class Slltest
{
    static Console c;

    public static void main (String[] args) throws CloneNotSupportedException
    {
	c = new Console (40, 50, "Single Linked List");
	char again = 'y';
	char nextAction = 'n';
	c.println ("Welcome to the unsorted Singly Linked List class!");
	while (again == 'y')
	{
	    SinglyLinkedList firstList = new SinglyLinkedList ();
	    SinglyLinkedList secondList = new SinglyLinkedList ();
	    SinglyLinkedList combinedList = new SinglyLinkedList ();
	    String inputString = "";
	    String findString = "";
	    String firstString = "";
	    String secondString = "";
	    nextAction = 'n';

	    c.println ("You will start with your first list.");
	    c.println ("----------------------------------------");
	    while (nextAction != '2')
	    {
		c.println ("Press 'p' to print out the list,\n'f' to find the node before a string,\n'i' to insert a string behind another string,\n'd' to delete a string, "
			+ "\n'o' to print odd numbers,\n's' to use SelfOrganizingSearch,\n'e' to exchange two nodes,\n'r' to reverse the list, or\n'2' to move to the second list.");
		do
		    nextAction = c.getChar ();

		while (nextAction != 'p' && nextAction != 'f' && nextAction != 'i' && nextAction != 'd' && nextAction != 'o'
			&& nextAction != 's' && nextAction != 'e' && nextAction != 'r' && nextAction != '2');

		c.println ();

		if (nextAction == 'p')
		    c.println ("Printing the list: " + firstList.toString ());

		else if (nextAction == 'f')
		{
		    c.println ("Finding!");
		    c.print ("Please insert the string to find: ");
		    findString = c.readString ();
		    Node foundNode = firstList.find (findString);
		    if (firstList.isEmpty ())
			c.println ("Your list is empty; therefore, it cannot be found.");
		    else if (foundNode == null)
			c.println ("Your string is the first node in the list!");
		    else if (foundNode.next == null)
			c.println ("Your string is not found.");
		    else
			c.println ("The previous string to your string is " + foundNode.data + ".");
		}

		else if (nextAction == 'i')
		{
		    c.println ("Inserting!");
		    c.print ("Please enter the string to insert: ");
		    inputString = c.readString ();
		    c.print ("Please enter the string to place it before: ");
		    findString = c.readString ();
		    firstList.insert (inputString, findString);
		    c.println ("Your string has been inserted.");
		}

		else if (nextAction == 'd')
		{
		    c.println ("Deleting");
		    c.print ("Please enter the string to delete: ");
		    inputString = c.readString ();
		    if (firstList.delete (inputString))
			c.println ("Your string has been successfully deleted.");
		    else
			c.println ("Your string has not been deleted.");
		}

		else if (nextAction == 'o')
		    c.println ("The odd data points are: " + firstList.printOdd ());

		else if (nextAction == 's')
		{
		    c.println ("Now doing SelfOrganizingSearch.");
		    c.print ("Please enter the string you would like to search for: ");
		    inputString = c.readString ();
		    Node found = firstList.selfOrganizingSearch (inputString);
		    if (found == null)
			c.println ("Your word is not found.");
		    else
			c.println ("Your word is found! It will be placed in the beginning.");
		}

		else if (nextAction == 'e')
		{
		    c.println ("Now exchanging two nodes.");
		    c.print ("Please enter the first string to exchange: ");
		    firstString = c.readString ();
		    c.print ("Now, enter the second string to exchange: ");
		    secondString = c.readString ();
		    firstList.exchange (firstString, secondString);
		    c.println ("If both strings are found, the exchange has been done.");
		}

		else if (nextAction == 'r')
		{
		    firstList.reverse ();
		    c.println ("Your list has been reversed.");
		}
		c.println ();
	    }

	    c.clear ();
	    nextAction = '!';
	    c.println ("Moving on to your second list!");
	    c.println ("------------------------------");

	    while (nextAction != '2')
	    {
		c.println ("Press 'p' to print out the list,\n'c' for the concatenated version of both lists,\n'f' to find the node before a string,\n'i' to insert a string behind another string,\n'd' to delete a string, "
			+ "\n'o' to print odd numbers,\n's' to use SelfOrganizingSearch,\n'e' to exchange two nodes,\n'r' to reverse the list, or\n'2' to exit.");
		do
		    nextAction = c.getChar ();

		while (nextAction != 'p' && nextAction != 'c' && nextAction != 'f' && nextAction != 'i' && nextAction != 'd'
			&& nextAction != 'o' && nextAction != 's' && nextAction != 'e' && nextAction != 'r' && nextAction != '2');

		c.println ();

		if (nextAction == 'p')
		    c.println ("Printing the list: " + secondList.toString ());

		else if (nextAction == 'c')
		{
		    combinedList = firstList.concatenate (secondList);
		    c.println ("Your combined list is: " + combinedList.toString ());
		}

		else if (nextAction == 'f')
		{
		    c.println ("Finding!");
		    c.print ("Please insert the string to find: ");
		    findString = c.readString ();
		    Node foundNode = secondList.find (findString);
		    if (secondList.isEmpty ())
			c.println ("Your list is empty; therefore, it cannot be found.");
		    else if (foundNode == null)
			c.println ("Your string is the first node in the list!");
		    else if (foundNode.next == null)
			c.println ("Your string is not found.");
		    else
			c.println ("The previous string to your string is " + foundNode.data + ".");
		}

		else if (nextAction == 'i')
		{
		    c.println ("Inserting!");
		    c.print ("Please enter the string to insert: ");
		    inputString = c.readString ();
		    c.print ("Please enter the string to place it before: ");
		    findString = c.readString ();
		    secondList.insert (inputString, findString);
		    c.println ("Your string has been inserted.");
		}

		else if (nextAction == 'd')
		{
		    c.println ("Deleting");
		    c.print ("Please enter the string to delete: ");
		    inputString = c.readString ();
		    if (secondList.delete (inputString))
			c.println ("Your string has been successfully deleted.");
		    else
			c.println ("Your string has not been deleted.");
		}

		else if (nextAction == 'o')
		    c.println ("The odd data points are: " + secondList.printOdd ());

		else if (nextAction == 's')
		{
		    c.println ("Now doing SelfOrganizingSearch.");
		    c.print ("Please enter the string you would like to search for: ");
		    inputString = c.readString ();
		    Node found = secondList.selfOrganizingSearch (inputString);
		    if (found == null)
			c.println ("Your word is not found.");
		    else
			c.println ("Your word is found! It will be placed in the beginning.");
		}

		else if (nextAction == 'e')
		{
		    c.println ("Now exchanging two nodes.");
		    c.print ("Please enter the first string to exchange: ");
		    firstString = c.readString ();
		    c.print ("Now, enter the second string to exchange: ");
		    secondString = c.readString ();
		    secondList.exchange (firstString, secondString);
		    c.println ("If both strings are found, the exchange has been done.");
		}

		else if (nextAction == 'r')
		{
		    secondList.reverse ();
		    c.println ("Your list has been reversed.");
		}
		c.println ();
	    }

	    c.clear ();
	    c.println ("Exiting!");
	    c.println ();
	    c.println ("Would you like to create another set of SinglyLinkedLists? Press 'y' to continue,"
		    + " or any other key to exit.");
	    again = c.getChar ();
	}
	c.close ();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: December 2, 2015
//Purpose: To create a Node class, that will contain a string and a pointer.
//Fields:
//      data: A string contained in the node.
//      next: A Node, representing the next node in the link.
//Methods:
//      constructor: Defaults the data and next.
//      clone: Clones the node.
//      toString: Returns the data of all consecutive nodes.
//********************************************************************************

class Node implements Cloneable
{
    public String data;
    public Node next;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: A constructor that initializes the data to the input, and next to null.
    //Input: A string, representing the data of the node.
    //Output: Initializes the fields, given the input.
    //********************************************************************************

    public Node (String inputString)
    {
	data = inputString;
	next = null;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: A method that will clone the node.
    //Input: None.
    //Output: The exact replica of the node.
    //********************************************************************************

    public Object clone () throws CloneNotSupportedException
    {
	Node newNode = (Node) super.clone ();
	if (this.next == null)
	    newNode.next = null;
	else
	    newNode.next = (Node) next.clone ();
	return newNode;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: A method that will return the string version of the entire chain.
    //Input: None.
    //Output: A string, representing the rest of the Nodes.
    //********************************************************************************

    public String toString ()
    {
	String totalOutput = "";
	totalOutput = totalOutput + this.data + " ";
	if (this.next != null)
	    totalOutput = totalOutput + this.next.toString ();
	return totalOutput;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: December 2, 2015
//Purpose: To create a SinglyLinkedList class, that maintains a list of unsorted Strings.
//Fields:
//       list: The first node in a chain of nodes.
//Methods:
//       constructor: Defaults the list to null.
//       isEmpty: Checks if the list is empty.
//       clone: Clones the entire SinglyLinkedList class.
//       toString: Returns the complete String data in every node of the list.
//       find: Returns the node before the node with the given string.
//       insert: Inserts a given string before another string in the list.
//       delete: A boolean representing if a node is deleted from the list or not.
//       printOdd: Creates a string with the data from odd nodes: 1,3,5, etc.
//       selfOrganizingSearch: Return a node given a string, moving it to the front.
//       concatenate: Attaches a given list to the current list, making a third list.
//       exchange: Exchanges two nodes in a list.
//       reverse: Completely reverses the list.
//********************************************************************************

class SinglyLinkedList implements Cloneable
{
    protected Node list;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: A constructor that initializes the list to null.
    //Input: None.
    //Output: Initializes the list to null.
    //********************************************************************************

    public SinglyLinkedList ()
    {
	this.list = null;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Checks if the list is empty.
    //Input: None.
    //Output: A boolean indicating if the list is empty.
    //********************************************************************************

    public boolean isEmpty ()
    {
	return this.list == null;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Clones the list.
    //Input: None.
    //Output: A SinglyLinkedList identical to the current one.
    //********************************************************************************

    public Object clone () throws CloneNotSupportedException
    {
	SinglyLinkedList newList = (SinglyLinkedList) super.clone ();
	if (this.list != null)
	    newList.list = (Node) this.list.clone ();
	else
	    newList.list = null;
	return newList;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Converts the entire list to a string.
    //Input: None.
    //Output: A String, representing all nodes in the list.
    //********************************************************************************

    public String toString ()
    {
	String outputString = "Empty";
	if (!this.isEmpty ())
	    outputString = this.list.toString ();
	return outputString;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Finds the node before the node containing the given string.
    //Input: A string, representing the value to search before.
    //Output: A node, before the node with the given string.
    //********************************************************************************

    public Node find (String inputString)
    {
	Node output = new Node ("");
	Node currentNode = this.list;
	boolean found = false;

	if (this.isEmpty ())
	    output = null;

	else if (this.list.next == null)
	    output = null;

	else if (currentNode.data.equals (inputString))
	    output = null;
	else
	{
	    while ((currentNode != null) && (found == false))
	    {
		if (currentNode.next == null)
		    output = currentNode;

		else if (currentNode.next.data.equals (inputString))
		{
		    output = currentNode;
		    found = true;
		}
		currentNode = currentNode.next;
	    }
	}
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Inserts a given string before a given second string, or at the end.
    //Input: The string to be inserted, and the string to search for placement.
    //Output: None.
    //********************************************************************************

    public void insert (String insertString, String nextString)
    {
	Node foundNode = this.find (nextString);
	Node insertNode = new Node (insertString);
	if (foundNode == null)
	{
	    if (this.isEmpty ())
		this.list = insertNode;
	    else
	    {
		insertNode.next = this.list;
		this.list = insertNode;
	    }
	}
	else if (this.list.next == null)
	{
	    insertNode.next = this.list;
	    this.list = insertNode;
	}
	else if (foundNode.next == null)
	{
	    foundNode.next = insertNode;
	}
	else
	{
	    insertNode.next = foundNode.next;
	    foundNode.next = insertNode;
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Deletes a node, given the string it contains.
    //Input: The string to delete.
    //Output: A boolean indicating if the deletion occured or not.
    //********************************************************************************

    public boolean delete (String deleteString)
    {
	boolean deleted = false;
	if (this.find (deleteString) != null)
	{
	    if (this.find (deleteString).next != null)
	    {
		this.find (deleteString).next = this.find (deleteString).next.next;
		deleted = true;
	    }
	}
	else if (this.find (deleteString) == null)
	{
	    if (this.isEmpty () == false)
	    {
		this.list = this.list.next;
		deleted = true;
	    }
	}
	return deleted;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Prints the odd nodes in the chain.
    //Input: None.
    //Output: All values in the odd node data, as a string.
    //********************************************************************************

    public String printOdd ()
    {
	boolean isOdd = true;
	String output = "";
	Node current = list;
	if (!this.isEmpty ())
	{
	    output = this.list.data + " ";
	    if (current.next != null)
		current = current.next;

	    while (current.next != null)
	    {
		if (isOdd == true)
		    isOdd = false;
		else
		{
		    isOdd = true;
		    output = output + current.data + " ";
		}
		current = current.next;
	    }

	    if (isOdd == false)
		output = output + current.data + " ";
	}
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Returns the node given a string, and places it at the beginning if found.
    //Input: The string to identify the node.
    //Output: The node if found, or null.
    //********************************************************************************

    public Node selfOrganizingSearch (String inputString)
    {
	Node outputNode = this.find (inputString);
	
	if (outputNode == null)
	{
	    if (!this.isEmpty())
	    {
		if (this.list.next != null)
		{
		    outputNode = this.list;
		}
	    }
	}
	
	else
	{
	    if (outputNode.next == null)
		outputNode = null;
	    else
	    {
		Node foundNode = new Node ("");
		foundNode.next = outputNode.next.next;
		foundNode.data = outputNode.next.data;
		outputNode.next = outputNode.next.next;
		foundNode.next = this.list;
		this.list = foundNode;
		outputNode = foundNode;
	    }
	}
	return outputNode;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Concatenates a given list to the current list.
    //Input: The second list to be concatenated.
    //Output: The new concatenated list.
    //********************************************************************************

    public SinglyLinkedList concatenate (SinglyLinkedList inputList) throws CloneNotSupportedException
    {
	SinglyLinkedList outputList = new SinglyLinkedList ();
	if (this.isEmpty ())
	    outputList = (SinglyLinkedList) inputList.clone ();
	else
	{
	    SinglyLinkedList currentList = (SinglyLinkedList) this.clone ();
	    Node tempNode = currentList.list;
	    while (tempNode.next != null)
		tempNode = tempNode.next;
	    if (!inputList.isEmpty ())
		tempNode.next = (Node) inputList.list.clone ();
	    outputList = currentList;
	}

	return outputList;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Exchanges two nodes in the list.
    //Input: The two strings representing the two nodes to be exchanged.
    //Output: None.
    //********************************************************************************

    public void exchange (String firstString, String secondString)
    {
	Node firstNode = this.find (firstString);
	Node secondNode = this.find (secondString);
	boolean exchangable = true;

	if (firstNode != null)
	{
	    if (firstNode.next == null)
		exchangable = false;
	}

	if (secondNode != null)
	{
	    if (secondNode.next == null)
		exchangable = false;
	}

	if (firstNode == secondNode)
	    exchangable = false;

	if (exchangable)
	{
	    Node tempNode1 = new Node ("");
	    Node tempNode2 = new Node ("");

	    if (firstNode == null)
	    {
		tempNode1.next = this.list;
		tempNode2.next = tempNode1.next.next;
		this.list = secondNode.next;
		tempNode1.next.next = this.list.next;
		if (secondNode != tempNode1.next)
		{
		    secondNode.next = tempNode1.next;
		    this.list.next = tempNode2.next;
		}
		else
		{
		    this.list.next = tempNode1.next;
		}
	    }

	    else if (secondNode == null)
	    {
		tempNode1.next = this.list;
		tempNode2.next = tempNode1.next.next;
		this.list = firstNode.next;
		tempNode1.next.next = this.list.next;
		if (firstNode != tempNode1.next)
		{
		    firstNode.next = tempNode1.next;
		    this.list.next = tempNode2.next;
		}
		else
		{
		    this.list.next = tempNode1.next;
		}
	    }

	    else if (firstNode.next == secondNode)
	    {
		tempNode1.next = firstNode.next;
		tempNode2.next = secondNode.next;
		firstNode.next = tempNode2.next;
		tempNode1.next.next = tempNode2.next.next;
		tempNode2.next.next = tempNode1.next;
	    }

	    else if (secondNode.next == firstNode)
	    {
		tempNode1.next = secondNode;
		tempNode2.next = secondNode.next;
		secondNode.next = firstNode.next;
		firstNode.next = firstNode.next.next;
		secondNode.next.next = firstNode;
	    }

	    else
	    {
		tempNode1.next = firstNode.next;
		tempNode2.next = secondNode.next;
		firstNode.next = secondNode.next;
		tempNode2.next = tempNode2.next.next;
		secondNode.next.next = tempNode1.next.next;
		secondNode.next = tempNode1.next;
		tempNode1.next.next = tempNode2.next;
	    }
	}
    }

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: Reverses the list.
    //Input: None.
    //Output: None.
    //********************************************************************************
    public void reverse ()
    {
	SinglyLinkedList reversed = new SinglyLinkedList ();
	Node currentNode = this.list;
	Node reversedNode = reversed.list;

	while (this.isEmpty () == false)
	{
	    if (currentNode.next != null)
	    {
		while (currentNode.next.next != null)
		{
		    currentNode = currentNode.next;
		}
		if (reversed.isEmpty ())
		{
		    reversed.list = currentNode.next;
		    currentNode.next = null;

		    if (this.list.next == null)
		    {
			reversed.list.next = this.list;
			this.list = null;
		    }
		}
		else
		{
		    reversedNode = reversed.list;
		    while (reversedNode.next != null)
			reversedNode = reversedNode.next;
		    reversedNode.next = currentNode.next;
		    currentNode.next = null;
		}
		currentNode = this.list;
	    }
	    else if (reversed.isEmpty ())
	    {
		reversed.list = this.list;
		this.list = null;
	    }
	    else
	    {
		reversedNode.next.next = this.list;
		this.list = null;
	    }
	}

	this.list = reversed.list;

    }
}
