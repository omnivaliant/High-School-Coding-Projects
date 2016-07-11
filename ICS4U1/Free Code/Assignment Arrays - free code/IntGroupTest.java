// The "IntGroup" class.
import java.awt.*;
import hsa.Console;

public class IntGroupTest
{
    public static Console c;

    public static void main (String [] args) 
		 throws CloneNotSupportedException
    {
	c = new Console ();
	IntGroup x = new IntGroup ();
	IntGroup y = new IntGroup (20);

	c.println ("Original IntGroup x: " + x);
	c.println ("Original IntGroup y: " + y);
	c.println ("Input IntGroup x:");
	x.get (c);
	c.println ("\nInt_group x after input:"+x);
	IntGroup z = (IntGroup) x.clone ();
	c.println ("Original z: " + z);
	c.println ("Total of z: " + z.total ());
	c.println ("x + z =     " + x.add (z));
	x.insertElement (8888);
	c.println ("x with an added element: " + x);
	c.println ("z is now: " + z);
    }
}


   class IntGroup implements Cloneable
{
    protected int [] element;
    protected int size;
    protected final static int MAX = 100;

    public IntGroup (int s)
    {
	if ((s >= 0) && (s < MAX))
	    this.size = s;
	else
	    this.size = 0;
	element = new int [this.size];
    }

    public IntGroup ()
    {
	this (0);
    }

    public Object clone () throws CloneNotSupportedException
    {
	IntGroup newObject = 
			(IntGroup) super.clone ();
	newObject.element = 
			(int []) element.clone ();
	return newObject;
    }

    public void get (Console c)
    {
	int i;
	do
	{
	    c.print ("Size (1   " + MAX + "): ");
	    size = c.readInt ();
	}
	while ((size < 0) || (this.size > MAX));
	this.element = new int [this.size];

	c.println ("\nPlease enter the " + this.size + 
				     " elements:");
	for (i = 0 ; i < this.size ; i++)
	{
	    c.print (i + ": ");
	    element [i] = c.readInt ();
	}
    }

    public String toString ()
    {
	int i;
	String output = "";
	for (i = 0 ; i < this.size ; i++)
	    output += element [i] + " ";
	return output;
    }

    public int total ()
    {
	int i;
	int t = 0;
	for (i = 0 ; i < this.size ; i++)
	    t += element [i];
	return t;
    }


    public IntGroup add (IntGroup a)
    {
	int i;
	IntGroup result;
	if (this.size == a.size)
	{
	    result = new IntGroup (this.size);
	    for (i = 0 ; i < this.size ; i++)
		result.element [i] = this.element [i] + a.element [i];
	}
	else
	    result = new IntGroup ();
	return result;
    }

    public void insertElement (int x)
    {
	int i;
	int [] old_element;
	old_element = element;
	this.size++;
	element = new int [this.size];
	for (i = 0 ; i < this.size-1 ; i++)
	    element [i] = old_element [i];
	element [this.size-1] = x;
    }
}

