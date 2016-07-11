//********************************************************************************
//Author: Mohit Patel
//Date: November 27, 2015
//Purpose: To create a database program that will allow the manipulation of records.
//********************************************************************************
import hsa.*;
import java.awt.*;
import java.util.*;
import hsa.Console;

public class Hash
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console (40, 100, "Database Records");
	int count = 0;
	char again = 'y';
	char action = 'z';
	int id = 0;
	c.println ("Welcome to your movie database!");
	c.println ("Please enter a size for your database, at least 5: ");
	int size = c.readInt ();

	while (size < 5)
	{
	    c.print ("Your size is invalid. Please enter a positive integer that is at least 5: ");
	    size = c.readInt ();
	}

	HashDataBase database = new HashDataBase (size);
	c.println ("Your new, prime size is: " + database.physicalSize + ".");
	c.println ("To get started, press 'a' to add a record to the database," +
		" 'f' to find a record, 'p' to peek at the database, 'd' to delete a record, 'c' to change a record, or 'e' to exit.");
	c.println ();

	while (again == 'y' || again == 'Y')
	{
	    do
		action = c.getChar ();
	    while (!(action == 'a' || action == 'f' || action == 'p' || action == 'd' || action == 'c' || action == 'e'));

	    if (action == 'a')
	    {
		c.println ("Adding!");
		database.add (c);
	    }
	    else if (action == 'f')
	    {
		c.println ("Finding!");
		c.print ("Please enter the ID you would like to find: ");
		id = c.readInt ();
		database.find (c, id);
	    }
	    else if (action == 'p')
	    {
		c.println ("Peeking!");
		database.peek (c);
	    }
	    else if (action == 'd')
	    {
		c.println ("Deleting!");
		c.print ("Please enter the ID you would like to delete: ");
		id = c.readInt ();
		database.delete (c, id);
	    }
	    else if (action == 'c')
	    {
		c.println ("Changing!");
		database.change (c);
	    }
	    else if (action == 'e')
	    {
		c.println ("Exiting!");
		again = 'e';
	    }
	    c.println ();
	    c.println ("Press 'a' to add, 'f' to find, 'p' to peek, 'd' to delete, 'c' to change, or 'e' to exit.");
	    c.println ();
	}
	c.close ();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 27, 2015
//Purpose: To create a DBRecord class, which can create
//         a movie record containing an id, title, type, cost, distance, and date.
//Fields:
//         id              -record id
//         title           -record title
//         type            -type of movie
//         cost            -cost
//         dist            -distance to travel
//         date            -date of record
//Methods:
//         constructor     -creates a DBRecord given all the information
//         toString        -aligns information in a string
//         rightPad        -pads a string with spaces on the left to a certain width
//********************************************************************************

class DBRecord
{
    public int id;
    protected String title;
    protected String type;
    protected double cost;
    protected String dist;
    protected String date;

    //********************************************************************************
    //Constructor
    //Purpose: Creates a DBRecord given all the information
    //Parameters:id,title, type, cost, dist, date
    //Return:none
    //********************************************************************************

    public DBRecord (int x, String tit, String typ, double cos, String dis, String dat)
    {
	id = x;
	title = tit;
	type = typ;
	cost = cos;
	dist = dis;
	date = dat;
    }


    //********************************************************************************
    //Method toString
    //Purpose: Aligns information in a string
    //Parameters: None
    //Return:the string of the record's information
    //********************************************************************************

    public String toString ()
    {
	return (rightPad ("" + id, 8) + rightPad (title, 50) + rightPad (type, 10)
		+ rightPad ("" + cost, 8) + rightPad (dist, 6) + rightPad (date, 12));
    }


    //********************************************************************************
    //Method rightPad
    //Purpose:pads a string with spaces on the right to a certain width
    //Parameters:string to pad,width
    //Return: the string with a correct number of characters
    //********************************************************************************  

    public static String rightPad (String x, int w)
    {
	String s = "" + x;
	while (s.length () < w)
	    s = s + " ";
	return s;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 27, 2015
//Purpose: To create a HashDataBase class, which creates and maintains a hash table.
//Fields:
//         textInput       -the input file to read out of
//         dataBase        -an array of DBRecords
//         physicalSize    -the size of the array
//         logicalSize     -the actual amount of records in the array.
//Methods:
//         constructor     -creates a database given a size value, making it prime.
//         isPrime         -checks if a given integer is a prime number.
//         isFull          -returns if logicalSize / physicalSize > 70%.
//         rehash          -creates a new table approximately 20% larger, inserting
//                          all old non-deleted records in it, only if it needs to expand.
//         peek            -prints the complete table.
//         h               -Hashes an id, returning a position.
//         h2              -Continues to double-hash an id, ensuring a unique position.
//         insert          -adds a given DBRecord to the array, using double hashing,
//                          given the record and the console.
//         search          -returns the location of a given id in the table, or -1 if not found.
//         add             -reads a line from the file, inserting the record into the table.
//         find            -asks user for an id, and displays the complete record.
//         delete          -removes an id from the table, if found.
//         change          -changes a record if the id is the same, or creates a new record.
//********************************************************************************

class HashDataBase
{
    protected TextInputFile textInput;
    protected DBRecord[] dataBase;
    protected int physicalSize;
    protected int logicalSize;

    //********************************************************************************
    //Constructor
    //Purpose: Creates a HashDataBase class, which will have a prime size greater than 5.
    //Parameters: The prime size integer to make the database.
    //Return: None.
    //********************************************************************************

    public HashDataBase (int size)
    {
	this.textInput = new TextInputFile ("videodb.csv.txt");

	if (this.isPrime (size) == false || (size < 5))
	{
	    int newPrime = size + 1;
	    while (this.isPrime (newPrime) == false || (newPrime < 5))
		newPrime = newPrime + 1;
	    size = newPrime;
	}

	this.logicalSize = 0;
	this.physicalSize = size;
	this.dataBase = new DBRecord [size];
    }


    //********************************************************************************
    //isPrime
    //Purpose: Determines if a given integer is a prime number.
    //Parameters: An integer to be checked.
    //Return: A boolean indicating if the integer is prime.
    //********************************************************************************

    public boolean isPrime (int number)
    {
	boolean prime = true;
	int max = (int) Math.sqrt (number) + 1;
	if (number <= 1)
	    prime = false;
	else if (number == 2)
	    prime = true;
	else
	{
	    for (int count = 2 ; count <= max ; count++)
	    {
		if (number % count == 0)
		{
		    prime = false;
		}
	    }
	}
	return prime;
    }


    //********************************************************************************
    //isFull
    //Purpose: Determines if most of the hashtable is full.
    //Parameters: None.
    //Return: A boolean indicating if the integer is mostly full.
    //********************************************************************************

    public boolean isFull ()
    {
	boolean full = false;
	if ((0.0 + this.logicalSize) / this.physicalSize > 0.7)
	    full = true;
	return full;
    }


    //********************************************************************************
    //rehash
    //Purpose: Creates a new table with a prime size 20% larger, copying old values.
    //Parameters: The console to be used, and a boolean representing if the table needs to expand or not.
    //Return: None.
    //********************************************************************************

    public void rehash (Console c, boolean expand)
    {
	int size = this.physicalSize;

	if (expand == true)
	{
	    size = (int) (this.physicalSize * 1.2);
	    if ((this.isPrime (size) == false) || (size < 5))
	    {
		int newPrime = size + 1;

		while (this.isPrime (newPrime) == false || (newPrime < 5))
		    newPrime = newPrime + 1;

		size = newPrime;
	    }
	}
	DBRecord[] temp = this.dataBase;
	this.physicalSize = size;
	this.dataBase = new DBRecord [size];

	for (int count = 0 ; count < temp.length ; count++)
	{
	    if (temp [count] != null)
		this.insert (c, temp [count]);
	}

    }


    //********************************************************************************
    //peek
    //Purpose: Prints the entire table.
    //Parameters: The console to be printed on.
    //Return: None.
    //********************************************************************************

    public void peek (Console c)
    {
	for (int count = 0 ; count < this.physicalSize ; count++)
	{
	    if (c.getRow () >= c.maxrow () - 2)
	    {
		c.println ();
		c.print ("Press any key to continue the database: ");
		c.getChar ();
		c.clear ();
		c.println ();
	    }
	    if (this.dataBase [count] == null)
		c.println ("empty");
	    else
		c.println (this.dataBase [count].toString ());
	}
	c.println ("Logical size: " + this.logicalSize + ".");
	c.println ("Physical size: " + this.physicalSize + ".");
    }


    //********************************************************************************
    //Method h
    //Purpose: Returns the hash f()
    //Parameters: id, counter
    //Return: The hash function
    //********************************************************************************

    public int h (int k, int i)
    {
	return (k % this.physicalSize + i * h2 (k)) % this.physicalSize;
    }


    //********************************************************************************
    //Method h2
    //Purpose: Returns the double hashing f()
    //Parameters: Id
    //Return: Double hash function
    //********************************************************************************

    public int h2 (int k)
    {
	return (this.physicalSize - 2) - (k % (this.physicalSize - 2));
    }


    //********************************************************************************
    //insert
    //Purpose: Inserts a DBRecord into the array, noting if any collisions occur.
    //Parameters: The console to print information to.
    //Return: None.
    //********************************************************************************

    public void insert (Console c, DBRecord record)
    {
	int count = 0;

	if (this.isFull ())
	{
	    c.println ("Rehashing!");
	    this.logicalSize = 0;
	    this.rehash (c, true);
	}

	int position = this.h (record.id, count);

	while (this.dataBase [position] != null)
	{
	    count = count + 1;
	    position = this.h (record.id, count);
	}

	if (count == 1)
	    c.println ("1 collision has occured.");
	else if (count > 1)
	    c.println (count + " collisions have occured.");

	this.dataBase [position] = record;
	c.println ("The record is inserted at position: " + (position + 1) + ".");
	this.logicalSize = this.logicalSize + 1;
    }


    //********************************************************************************
    //search
    //Purpose: Returns the location of a given id in the table, or -1 if not found.
    //Parameters: The id to search for.
    //Return: The integer location of the record.
    //********************************************************************************

    public int search (int inputId)
    {
	int count = 0;
	int position = 0;
	if (inputId < 0)
	    position = -1;
	else
	{
	    position = this.h (inputId, count);
	    boolean isFound = false;

	    while (this.dataBase [position] != null && isFound == false)
	    {
		if (this.dataBase [position].id == inputId)
		    isFound = true;
		else
		{
		    count = count + 1;
		    position = this.h (inputId, count);
		}
	    }
	    position = position + 1;

	    if (isFound == false)
		position = -1;
	}
	return position;
    }


    //********************************************************************************
    //add
    //Purpose: Reads a line from the file, and inserts the record into the table.
    //Parameters: The console to output to.
    //Return: None.
    //********************************************************************************

    public void add (Console c)
    {
	if (!this.textInput.eof ())
	{
	    StringTokenizer inputEdit = new StringTokenizer (this.textInput.readLine (), ",");
	    DBRecord inputRecord = new DBRecord (Integer.parseInt (inputEdit.nextToken ()), inputEdit.nextToken (), inputEdit.nextToken (),
		    Double.parseDouble (inputEdit.nextToken ()), inputEdit.nextToken (), inputEdit.nextToken ());
	    this.insert (c, inputRecord);
	}
	else
	{
	    c.println ("New record not available! Restarting.");
	    this.textInput.close ();
	    this.textInput = new TextInputFile ("videodb.csv.txt");
	}
    }


    //********************************************************************************
    //find
    //Purpose: Asks the user for an id, and displays the complete record.
    //Parameters: The id to search for, and the console to print on.
    //Return: None.
    //********************************************************************************

    public void find (Console c, int inputId)
    {
	int position = this.search (inputId);

	if (position == -1)
	    c.println ("Record not found.");
	else
	    c.println (this.dataBase [position - 1].toString ());
    }


    //********************************************************************************
    //delete
    //Purpose: Asks the user for an id, and deletes it, if found.
    //Parameters: The console to print on.
    //Return: None.
    //********************************************************************************

    public void delete (Console c, int inputId)
    {
	int position = this.search (inputId);

	if (position == -1)
	    c.println ("Unable to delete the record: it does not exist.");
	else
	{
	    int count = 1;
	    position = position - 1;
	    this.dataBase [position] = null;
	    this.logicalSize = 0;
	    this.rehash (c, false);
	}
    }


    //********************************************************************************
    //change
    //Purpose: Asks for an id and changes it, if it is found.
    //Parameters: The console to print on.
    //Return: None.
    //********************************************************************************

    public void change (Console c)
    {
	c.print ("Please enter an ID to change: ");
	int inputId = c.readInt ();

	while (inputId < 0)
	{
	    c.print ("Your ID is invalid. Please enter a positive number: ");
	    inputId = c.readInt ();
	}

	int position = this.search (inputId);

	if (position == -1)
	    c.println ("Your ID cannot be found; therefore, no record can change.");
	else
	{
	    c.println ("Your current record is as follows: ");
	    this.find (c, inputId);
	    c.print ("Please enter a new ID: ");
	    int id = c.readInt ();

	    while (id <= 0)
	    {
		c.print ("Please enter an id greater than 0: ");
		id = c.readInt ();
	    }

	    c.print ("Please enter a title: ");
	    String title = c.readString ();
	    c.print ("Please enter a type: ");
	    String type = c.readString ();
	    c.print ("Please enter a cost: ");
	    double cost = c.readDouble ();

	    while (cost < 0)
	    {
		c.print ("Your cost is invalid. Please enter a cost greater than 0: ");
		cost = c.readDouble ();
	    }

	    c.print ("Please enter a distance: ");
	    String dist = c.readString ();
	    c.print ("Please enter a date: ");
	    String date = c.readString ();
	    DBRecord inputRecord = new DBRecord (id, title, type, cost, dist, date);

	    if (id == inputId)
		this.dataBase [position - 1] = inputRecord;
	    else
	    {
		this.delete (c, inputId);
		while (this.search (id) != -1)
		{
		    c.print ("Your new ID already exists. Please enter a new ID: ");
		    id = c.readInt ();
		}
		inputRecord.id = id;
		this.insert (c, inputRecord);
	    }
	}
    }
}
