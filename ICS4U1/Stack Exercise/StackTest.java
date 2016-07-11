//********************************************************************************
//Author: Mohit Patel
//Date: January 4, 2016
//Purpose: To create a stack class, which handles brackets.
//********************************************************************************

import java.awt.*;
import java.util.*;
import hsa.Console;
import hsa.*;

public class StackTest
{
    static Console c;

    public static void main (String[] args) throws CloneNotSupportedException
    {
	c = new Console (30, 100, "Single Linked List");
	char action = '4';
	Parenthesis userBracket = new Parenthesis ("", c);
	c.println ("Welcome to the Parenthesis class!");
	while (action != '3')
	{
	    c.println ();
	    c.println ("Bracket operations: \nPress '1' to input a string and test it,"
		    + "\n'2' to read lines from a file, or"
		    + "\n'3' to exit.");
	    do
		action = c.getChar ();
	    while (action != '1' && action != '2' && action != '3');

	    if (action == '1')
	    {
		userBracket.getString ();
		userBracket.bracketCheck ();
	    }

	    else if (action == '2')
	    {
		userBracket.readFromFile();
	    }
	}
	c.close ();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: December 2, 2015
//Purpose: To create a Node class, that will contain a char and a pointer.
//Fields:
//      data: A char contained in the node.
//      next: A Node, representing the next node in the link.
//Methods:
//      constructor: Defaults the data and next.
//      clone: Clones the node.
//      toString: Returns the data of all consecutive nodes.
//********************************************************************************

class Node implements Cloneable
{
    public char data;
    public Node next;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: December 2, 2015
    //Purpose: A constructor that initializes the data to the input, and next to null.
    //Input: A char, representing the data of the node.
    //Output: Initializes the fields, given the input.
    //********************************************************************************

    public Node (char inputChar)
    {
	data = inputChar;
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
//Date: January 4, 2016
//Purpose: To create a Stack class, which can use Nodes to organize data.
//Fields:
//      top: The leading Node of the stack.
//Methods:
//      constructor: Initializes the stack to null.
//      isEmpty: Returns if the stack is empty.
//      push: Adds a Node to the stack.
//      pop: Removes a Node from the stack.
//      toString: Returns the stack as a consecutive string.
//********************************************************************************

class Stack
{
    Node top;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: A constructor that initializes the stack to null.
    //Input: None.
    //Output: Initializes the Node to null.
    //********************************************************************************

    public Stack ()
    {
	top = null;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: Checks if the stack is empty.
    //Input: None.
    //Output: A boolean representing if the stack is empty.
    //********************************************************************************

    public boolean isEmpty ()
    {
	boolean empty = false;
	if (this.top == null)
	    empty = true;
	return empty;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: Adds a character to the top of the stack.
    //Input: The character to be placed.
    //Output: None.
    //********************************************************************************

    public void push (char inputChar)
    {
	Node insertNode = new Node (inputChar);
	if (this.isEmpty ())
	    this.top = insertNode;
	else
	{
	    insertNode.next = this.top;
	    this.top = insertNode;
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: Remove a character from the top of the stack.
    //Input: None.
    //Output: The character being removed, or '!' if it is empty.
    //********************************************************************************

    public char pop ()
    {
	char output = '!';
	if (!this.isEmpty ())
	{
	    output = this.top.data;
	    this.top = this.top.next;
	}
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: A method that will return the string version of the entire chain.
    //Input: None.
    //Output: A string, representing the entire Stack.
    //********************************************************************************

    public String toString ()
    {
	String output = "";
	if (!this.isEmpty ())
	    output = top.toString ();
	return output;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: January 4, 2016
//Purpose: To create a Parenthesis class, which can evaluate strings for proper bracket use.
//Fields:
//       inputString: A String to be evaluated for bracket use.
//       outputConsole: A console to be used for communication.
//       bracketStack: The stack used to measure the use of characters.
//Methods:
//       constructor: Initializes each field.
//       getString: Gets a string from the user.
//       bracketCheck: Evaluates a String from the user for correct bracket use.
//       readFromFile: Evaluates a String from a file for correct bracket use.
//********************************************************************************

class Parenthesis
{
    String inputString;
    Console outputConsole;
    Stack bracketStack;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: A constructor that initializes the fields.
    //Input: A string, and the console to be used.
    //Output: Initializes the Parenthesis class with the given input.
    //********************************************************************************

    public Parenthesis (String input, Console c)
    {
	this.inputString = input;
	this.outputConsole = c;
	this.bracketStack = new Stack ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: Gets a string from the user.
    //Input: None.
    //Output:Changes the inputString field, dependant on the input.
    //********************************************************************************

    public void getString ()
    {
	this.outputConsole.print ("Please enter a string to evaluate: ");
	this.inputString = this.outputConsole.readString ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: Evaluates the brackets in the inputString.
    //Input: None.
    //Output: A boolean representing if the string was valid or not.
    //********************************************************************************

    public boolean bracketCheck ()
    {
	int count = 0;
	int length = this.inputString.length ();
	char currentChar = '@';
	boolean valid = true;
	char popChar = '@';

	for (count = 0 ; count < length && valid == true ; count++)
	{
	    currentChar = this.inputString.charAt (count);
	    if (currentChar == '(' || currentChar == '{' || currentChar == '[')
		this.bracketStack.push (currentChar);

	    else if (currentChar == ')' || currentChar == '}' || currentChar == ']')
	    {
		popChar = this.bracketStack.pop ();
		if (popChar == '!')
		{
		    valid = false;
		    this.outputConsole.println ("Error: cannot close the bracket using '" + currentChar + "' on character " + (count + 1) + ", as there is no open bracket.");
		}

		else if (currentChar == ')' && popChar != '(')
		{
		    valid = false;
		    this.outputConsole.println ("Error: cannot close the ')' on character " + (count + 1) + " as the closest corresponding opening bracket is not '('.");
		}
		else if (currentChar == '}' && popChar != '{')
		{
		    valid = false;
		    this.outputConsole.println ("Error: cannot close the '}' on character " + (count + 1) + " as the closest corresponding opening bracket is not '{'.");
		}
		else if (currentChar == ']' && popChar != '[')
		{
		    valid = false;
		    this.outputConsole.println ("Error: cannot close the ']' on character " + (count + 1) + " as the closest corresponding opening bracket is not '['.");
		}
	    }
	}

	if (this.bracketStack.isEmpty () && valid == true)
	    this.outputConsole.println ("Your string's brackets are valid!");
	else
	{
	    if (this.bracketStack.isEmpty () == false)
		this.outputConsole.println ("You have leftover opening brackets; not enough appropriate closing brackets.");
	    this.outputConsole.println ("Therefore, your string is invalid.");
	    valid = false;
	}
	return valid;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: January 4, 2016
    //Purpose: Evaluates a text file from the user.
    //Input: The text file.
    //Output: Specific output in the console relating to the processing of the file.
    //********************************************************************************

    public void readFromFile ()
    {
	String line = "";
	int count = 0;
	int lineLength = 0;
	int currentLine = 1;
	char currentChar = '@';
	char popChar = '@';
	StringTokenizer inputEdit;
	boolean valid = true;
	boolean commented = false;
	outputConsole.print ("Please enter your file name: ");
	String inputName = outputConsole.readString ();
	TextInputFile inputFile = new TextInputFile (inputName);
	
	while (!inputFile.eof () && valid == true)
	{
	    line = inputFile.readLine ();
	    lineLength = line.length();
	    for (count = 0 ; count < lineLength && valid == true ; count++)
	    {
		currentChar = line.charAt(count);
		if (currentChar == '(' || currentChar == '{' || currentChar == '[')
		    this.bracketStack.push (currentChar);

		else if (currentChar == ')' || currentChar == '}' || currentChar == ']')
		{
		    popChar = this.bracketStack.pop ();
		    if (popChar == '!')
		    {
			valid = false;
			this.outputConsole.println ("Error: cannot close the bracket using '" + currentChar + "' on character " + (count + 1) + ", as there is no open bracket.");
		    }

		    else if (currentChar == ')' && popChar != '(')
		    {
			valid = false;
			this.outputConsole.println ("Error: cannot close the ')' on character " + (count + 1) + " as the closest corresponding opening bracket is not '('.");
		    }
		    else if (currentChar == '}' && popChar != '{')
		    {
			valid = false;
			this.outputConsole.println ("Error: cannot close the '}' on character " + (count + 1) + " as the closest corresponding opening bracket is not '{'.");
		    }
		    else if (currentChar == ']' && popChar != '[')
		    {
			valid = false;
			this.outputConsole.println ("Error: cannot close the ']' on character " + (count + 1) + " as the closest corresponding opening bracket is not '['.");
		    }
		}
		
		else if (currentChar == '/')
		{
		    if (count + 1 < lineLength && count > 0)
		    {
			if (line.charAt (count - 1) == '/')
			    commented = false;
			    
			else if (line.charAt(count + 1) == '*')
			    commented = true;
		    }
		    
		    else if (count + 1 < lineLength)
			if (line.charAt(count+1) == '*')
			    commented = true;
		}
		else if (currentChar == '*')
		{
		    if (count > 0)
		    {
			if (line.charAt(count - 1) != '/' && count + 1 < lineLength)
			{
			    if (line.charAt(count + 1) == '/')
				commented = false;
			}
		    }
		    
		    else if (count == 0 && lineLength > 1)
		    {
			if (line.charAt(1) == '/')
			    commented = false;
		    }                    
		}

		if (valid == false)
		    this.outputConsole.println("Your above error has occured on line " + currentLine + ", which is: " + line);
	    }
	    
	    currentLine = currentLine + 1;
	}
	
	if (this.bracketStack.isEmpty () && valid == true && commented == false)
	    this.outputConsole.println("Your file's brackets are completely accurate!");
	else
	{
	    if (this.bracketStack.isEmpty () == false)
		this.outputConsole.println ("You have leftover opening brackets; not enough appropriate closing brackets.");
	    if (commented == true)
		this.outputConsole.println ("Your file is still commented; no ending '*/' has been found.");
	    this.outputConsole.println ("Therefore, your file is invalid.");
	}

    }
}
