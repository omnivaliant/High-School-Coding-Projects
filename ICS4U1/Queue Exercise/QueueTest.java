//********************************************************************************
//Author: Mohit Patel
//Date: January 4, 2016
//Purpose: To create various queue implementations, that can add and remove numbers.
//********************************************************************************
import java.awt.*;
import hsa.Console;

public class QueueTest
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console ();
	int size = 10;
	StrLA straightLine = new StrLA (size);
	firstShiftA firstA = new firstShiftA (size);
	secondShiftA secondA = new secondShiftA (size);
	circularA circularArray = new circularA (size);
	LLQueue linkedQueue = new LLQueue ();
	char nextAction = '!';
	while (nextAction != '4')
	{
	    c.println ("Please enter: \n'1' to add an element;" +
		    "\n'2' to remove a number; \n'3' to reset the queue and the size; or" +
		    "\n'4' to exit the program.");

	    do
		nextAction = c.getChar ();
	    while (!(nextAction == '1' || nextAction == '2' || nextAction == '3' || nextAction == '4'));

	    if (nextAction == '1')
	    {
		straightLine.add ();
		firstA.add ();
		secondA.add ();
		circularArray.add ();
		linkedQueue.add ();
	    }
	    else if (nextAction == '2')
	    {
		straightLine.remove ();
		firstA.remove ();
		secondA.remove ();
		circularArray.remove ();
		linkedQueue.remove ();
	    }
	    else if (nextAction == '3')
	    {
		c.clear ();
		c.print ("Please enter a new queue size: ");
		size = c.readInt ();

		while (size < 1)
		{
		    c.print ("Your size is invalid. Please enter a positive integer: ");
		    size = c.readInt ();
		}

		straightLine.reset (size);
		firstA.reset (size);
		secondA.reset (size);
		circularArray.reset (size);
		linkedQueue.reset (size);

	    }
	    c.clear ();
	    c.println ("[] denotes the front, \n() denotes the back of the array, and \n!! denotes an overlap.");
	    c.println();
	    c.println ("Straight line array: ");
	    c.println (straightLine.toString ());
	    c.println ();
	    c.println ("First shifted array: ");
	    c.println (firstA.toString ());
	    c.println ();
	    c.println ("Second shifted array: ");
	    c.println (secondA.toString ());
	    c.println ();
	    c.println ("Circular array: ");
	    c.println (circularArray.toString ());
	    c.println ();
	    c.println ("Linked list: ");
	    c.println (linkedQueue.toString ());
	    c.println ();
	}
	c.close();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: January 7, 2016
//Purpose: To create a Queue class, that will be the superclass of other implementations.
//Field:
//      currentInt: The current integer to the added to the queue.
//Methods:
//      add: Adds an element to the end of the queue.
//      remove: Removes an element from the beginning of the queue.
//      reset: Clears the queue.
//      toString: Prints the queue as a string.
//********************************************************************************

abstract class Queue
{
    public int currentInt;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: A constructor that will initialise the integer counter to 1.
    //Input: None.
    //Output: A queue with an integer counter.
    //********************************************************************************

    public Queue ()
    {
	this.currentInt = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: An abstract method that will get add an integer to the queue, if it is not full.
    //Input: None.
    //Output: A boolean representing if an integer was inserted or not.
    //********************************************************************************

    abstract public boolean add ();

    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: An abstract method that will remove an integer from the queue, if it is not empty.
    //Input: None.
    //Output: A boolean representing if an integer was removed or not.
    //********************************************************************************

    abstract public boolean remove ();

    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: An abstract method that will clear and reset the queue.
    //Input: The integer for the new size of the queue.
    //Output: A reset queue.
    //********************************************************************************

    abstract public void reset (int inputSize);

    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: An abstract method that will print the array as a string.
    //Input: None.
    //Output: The queue as a string.
    //********************************************************************************
    
    abstract public String toString();
}

//********************************************************************************
//Author: Mohit Patel
//Date:  January 7, 2016
//Purpose: To create a Straight-Line Implementation of the queue, using an array.
//Inherited fields: currentInt.
//Unique fields:
//       queueArray: An array that represents the current queue.
//       front: The current front offset of the array.
//       back: The current back offset of the array.
//Inherited methods: add, remove, reset, toString.
//Unique methods:
//       constructor: Initialises the array and the currentInt.
//********************************************************************************

class StrLA extends Queue
{
    protected int[] queueArray;
    protected int front;
    protected int back;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: A constructor that will initialise the fields of the straight-line array.
    //Input: The size of the array to be created.
    //Output: A new, empty SLA.
    //********************************************************************************

    public StrLA (int queueSize)
    {
	super ();
	this.front = 0;
	this.back = 0;
	this.queueArray = new int [queueSize];
	for (int count = 0 ; count < queueSize ; count++)
	    this.queueArray [count] = 0;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: Adds an integer to the array.
    //Input: None.
    //Output: A boolean representing if an integer was inserted or not.
    //********************************************************************************
    public boolean add ()
    {
	boolean isFull = false;
	if (this.back > this.queueArray.length - 1)
	    isFull = true;
	else
	{
	    queueArray [this.back] = this.currentInt;
	    this.back = this.back + 1;
	    this.currentInt = this.currentInt + 1;
	}
	return isFull;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: Removes an integer from the array.
    //Input: None.
    //Output: A boolean representing if an integer was removed or not.
    //********************************************************************************

    public boolean remove ()
    {
	boolean isEmpty = false;
	if (this.front == this.back)
	    isEmpty = true;
	else
	{
	    queueArray [this.front] = 0;
	    this.front = this.front + 1;
	}
	return isEmpty;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: Resets the queue.
    //Input: The integer for the new size of the queue.
    //Output: An empty array.
    //********************************************************************************

    public void reset (int inputSize)
    {
	this.currentInt = 1;
	this.front = 0;
	this.back = 0;
	this.queueArray = new int [inputSize];
	for (int count = 0 ; count < inputSize ; count++)
	    this.queueArray [count] = 0;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: Prints the array.
    //Input: None.
    //Output: A string representing the array.
    //********************************************************************************

    public String toString ()
    {
	String output = "";
	int count = 0;
	for (count = 0 ; count < this.queueArray.length ; count++)
	{
	    if (count == front && count == back)
		output = output + " !" + this.queueArray[count] + "!";
	    else if (count == front)
		output = output + " [" + this.queueArray[count] + "]";
	    else if (count == back)
		output = output + " (" + this.queueArray[count] + ")";
	    else
		output = output + " " + this.queueArray [count];
	}
	return output;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date:  January 10, 2016
//Purpose: To create a shifted implementation of the queue, using an array, which modifies add when full.
//Inherited fields: currentInt, queueArray, front, back.
//Inherited methods: add, remove, reset.
//********************************************************************************

class firstShiftA extends StrLA
{
    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: A constructor that will initialise the fields of the shifted-line array.
    //Input: The size of the array to be created.
    //Output: A new, empty shifted array.
    //********************************************************************************

    public firstShiftA (int queueSize)
    {
	super (queueSize);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: Adds an integer to the array, resetting it if it is full.
    //Input: None.
    //Output: A boolean representing if an integer was inserted or not.
    //********************************************************************************
    public boolean add ()
    {
	boolean full = super.add ();
	if (full == true)
	{
	    if (this.queueArray [0] == 0)
	    {
		full = false;
		boolean reachedEnd = false;
		int count = 0;
		this.front = 0;
		this.back = 0;
		while (this.queueArray [this.back] == 0 && reachedEnd == false)
		{
		    this.back = this.back + 1;

		    if (this.back == this.queueArray.length)
		    {
			reachedEnd = true;
			this.back = 0;
		    }
		}
		for (count = 0 ; this.back < this.queueArray.length ; count++)
		{
		    this.queueArray [count] = this.queueArray [this.back];
		    this.back = this.back + 1;
		}

		this.back = count;

		while (count != this.queueArray.length)
		{
		    this.queueArray [count] = 0;
		    count = count + 1;
		}
		if (reachedEnd)
		    this.back = 0;
		this.queueArray [this.back] = this.currentInt;
		this.back = this.back + 1;
		this.currentInt = this.currentInt + 1;
	    }
	}
	return full;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date:  January 10, 2016
//Purpose: To create a shifted implementation of the queue, using an array, which shifts the array each time an element is removed.
//Inherited fields: currentInt, queueArray, front, back.
//Inherited methods: add, remove, reset.
//********************************************************************************

class secondShiftA extends StrLA
{
    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: A constructor that will initialise the fields of the shifted-line array.
    //Input: The size of the array to be created.
    //Output: A new, empty shifted array.
    //********************************************************************************

    public secondShiftA (int queueSize)
    {
	super (queueSize);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: Removes an integer from the array. by moving the entire list back by 1.
    //Input: None.
    //Output: A boolean representing if an integer was removed or not.
    //********************************************************************************
    public boolean remove ()
    {
	boolean isEmpty = false;
	if (this.back == 0)
	    isEmpty = true;
	else
	{
	    int count = 0;
	    for (count = 0 ; count < this.queueArray.length - 1 ; count++)
		this.queueArray [count] = this.queueArray [count + 1];
	    this.queueArray [count] = 0;
	    this.back = this.back - 1;
	}
	return isEmpty;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: January 10, 2016
//Purpose: To create a circular array implementation of the queue.
//Inherited fields: currentInt, queueArray, front, back.
//Inherited methods: add, remove, reset.
//********************************************************************************

class circularA extends StrLA
{
    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: A constructor that will initialise the fields of the circular array.
    //Input: The size of the array to be created.
    //Output: A new, empty shifted array.
    //********************************************************************************

    public circularA (int queueSize)
    {
	super (queueSize);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: Adds an integer to the linked list.
    //Input: None.
    //Output: A boolean representing if an integer was inserted or not.
    //********************************************************************************
    public boolean add ()
    {
	boolean isFull = false;
	if (this.back + 1 == this.front)
	    isFull = true;
	else if (this.back == this.queueArray.length - 1 && this.front == 0)
	    isFull = true;
	else
	{
	    queueArray [this.back] = this.currentInt;
	    if (this.back == this.queueArray.length - 1)
		this.back = 0;
	    else
		this.back = this.back + 1;
	    this.currentInt = this.currentInt + 1;
	}
	return isFull;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 7, 2016
    //Purpose: Removes an integer from the circular array.
    //Input: None.
    //Output: A boolean representing if an integer was removed or not.
    //********************************************************************************

    public boolean remove ()
    {
	boolean isEmpty = false;
	if (this.front == this.back)
	    isEmpty = true;
	else
	{
	    queueArray [this.front] = 0;

	    if (this.front == this.queueArray.length - 1)
		this.front = 0;
	    else
		this.front = this.front + 1;
	}
	return isEmpty;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: December 2, 2015
//Purpose: To create a Node class, that will contain an integer and a pointer.
//Fields:
//      data: An integer contained in the node.
//      next: A Node, representing the next node in the link.
//Methods:
//      constructor: Defaults the data and next.
//      clone: Clones the node.
//      toString: Returns the data of all consecutive nodes.
//********************************************************************************

class Node implements Cloneable
{
    public int data;
    public Node next;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: A constructor that initializes the data to the input, and next to null.
    //Input: An integer, representing the data of the node.
    //Output: Initializes the fields, given the input.
    //********************************************************************************

    public Node (int inputData)
    {
	data = inputData;
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
//Date:  January 7, 2016
//Purpose: To create a linked-list implementation of the queue, using singly-linked nodes.
//Inherited fields: currentInt.
//Unique fields:
//       queueFront: The first Node in the queue.
//       queueBack: The last Node in the queue.
//Inherited methods: add, remove, reset, toString.
//Unique methods:
//       constructor: Initialises the linked list and the currentInt.
//********************************************************************************

class LLQueue extends Queue
{
    Node queueFront;
    Node queueBack;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: A constructor that initializes the data to the input, and the pointers to null.
    //Input: None.
    //Output: Initializes the queue to null.
    //********************************************************************************

    public LLQueue ()
    {
	super ();
	this.queueFront = null;
	this.queueBack = null;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: Adds an integer into the linked list.
    //Input: None.
    //Output: True, since an integer is always added to a linked list.
    //********************************************************************************

    public boolean add ()
    {
	boolean added = true;
	Node insertNode = new Node (this.currentInt);
	this.currentInt = this.currentInt + 1;
	if (this.queueFront == null)
	{
	    this.queueFront = insertNode;
	    this.queueBack = insertNode;
	}
	else
	{
	    this.queueBack.next = insertNode;
	    this.queueBack = insertNode;
	}
	return added;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: Removes an integer from the linked list.
    //Input: None.
    //Output: A boolean representing if an integer was removed or not.
    //********************************************************************************

    public boolean remove ()
    {
	boolean removed = true;
	if (this.queueFront == null)
	    removed = false;
	else
	{
	    this.queueFront = this.queueFront.next;
	    if (this.queueFront == null)
		this.queueBack = null;
	}
	return removed;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: Resets the linked list.
    //Input: The integer to start on.
    //Output: A reset linked list.
    //********************************************************************************

    public void reset (int startingInt)
    {
	this.queueFront = null;
	this.queueBack = null;
	this.currentInt = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 10, 2016
    //Purpose: Prints the list out as a string.
    //Input: None.
    //Output: A string representing the linked list.
    //********************************************************************************

    public String toString ()
    {
	String output = "";
	if (this.queueFront != null)
	    output = " " + this.queueFront.toString ();
	return output;
    }
}
