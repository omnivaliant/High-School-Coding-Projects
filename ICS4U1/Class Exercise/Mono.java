//********************************************************************************
//Author: Mohit Patel
//Date: September 30, 2015
//Purpose: To test a monomial class, and its various methods.
//********************************************************************************
import java.awt.*;
import hsa.Console;

public class Mono
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console (40, 75, "Monomial");
	char again = 'y';
	while (again == 'y' || again == 'Y')
	{
	    Monomial firstMono, secondMono;
	    firstMono = new Monomial ();
	    secondMono = new Monomial ();
	    double monoValue = 0;
	    int monoPow = 0;
	    c.println ("You will now create your first monomial.");
	    firstMono.get (c);
	    c.println ("The coefficient is: " + firstMono.coE + ", and the exponent is " + firstMono.exp + ".");
	    c.println ("Therefore, the first monomial is: " + firstMono + ".");

	    c.println ();

	    c.print ("Enter a value to evaluate the monomial: ");
	    monoValue = c.readDouble ();
	    c.println ("The value of the monomial is: " + firstMono.value (monoValue) + ".");
	    c.print ("Enter an integer power to raise the entire polynomial by: ");
	    monoPow = c.readInt ();
	    c.println ("If you raise the entire polynomial by " + monoPow + ", you will get " + firstMono.pow (monoPow) + ".");

	    c.println ();

	    c.println ("You will now enter the second monomial you would like to test.");
	    secondMono.get (c);
	    c.println ("The coefficient is: " + secondMono.coE + ", and the exponent is " + secondMono.exp + ".");
	    c.println ("Therefore, the second monomial is: " + secondMono + ".");

	    c.println ();

	    c.print ("Enter a value to evaluate the monomial: ");
	    monoValue = c.readDouble ();
	    c.println ("The value of the monomial is: " + secondMono.value (monoValue) + ".");
	    c.print ("Enter an integer power to raise the entire polynomial by: ");
	    monoPow = c.readInt ();
	    c.println ("If you raise the entire polynomial by " + monoPow + ", you will get " + secondMono.pow (monoPow) + ".");

	    c.println ();

	    if (firstMono.canAdd (secondMono))
	    {
		c.println ("You can add the two monomials together!");
		c.println ("Their sum is " + firstMono.add (secondMono) + ".");
		c.println ("Their difference is " + firstMono.subtract (secondMono) + ".");
	    }
	    else
		c.println ("You cannot add the two monomials together!");

	    c.println ();

	    if (firstMono.canDivide (secondMono))
	    {
		c.println ("You can divide the first monomial with the second monomial!");
		c.println ("Their product is " + firstMono.multiply (secondMono) + ".");
		c.println ("Their quotient is " + firstMono.divide (secondMono) + ".");
	    }
	    else
		c.println ("You cannot divide the first monomial with the second monomial!");

	    c.println ();

	    if (firstMono.equal (secondMono))
		c.println ("The monomials are equal!");
	    else
		c.println ("The monomials are not equal!");

	    c.println ();

	    c.println ("Would you like to test another initial monomial? Press 'y' to continue, or " +
		       "any other key to exit.");
	    again = c.getChar ();
	    c.clear ();
	}
	c.close ();

    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: September 30, 2015
//Purpose: To create a monomial class, with various fields and methods of operations.
//Fields:
//       Coefficient: A double representing the coefficient of the monomial.
//       Exponent: An integer representing the exponent of the monomial.
//Methods:
//       constructor: To initialize the two fields; either with input values,
//                    or default values of 0,0.
//       simplify: Reduces the monomial if the coefficient is 0.
//       get: Obtains the field values from the user.
//       toString: Converts the monomial into a string format.
//       canAdd: Returns if the current monomial can be added to another monomial.
//       canDivide: Returns if the current monomial is divisible by another monomial.
//       add: Adds a current monomial into a given monomial.
//       subtract: Subtracts a given monomial from the current monomial.
//       multiply: Multiplies a given monomial into the current monomial.
//       divide: Divides a given monomial from the current monomial.
//       value: Returns the value of the monomial, given the x-value.
//       pow: Returns a new monomial of the current monomial raised to a given power.
//       equal: Returns if the current monomial is equal to a given monomial.
//********************************************************************************

class Monomial
{
    protected double coE;
    protected int exp;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: A constructor that creates a monomial with given inputs.
    //Input: A double coefficient, and an integer exponent.
    //Output: Initialises the fields of the monomial instance.
    //********************************************************************************

    public Monomial (double inputCoe, int inputExp)
    {
	this.coE = inputCoe;
	this.exp = inputExp;
	this.simplify ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: A constructor that creates a monomial with no given inputs.
    //Input: None.
    //Output: Initialises the fields of the monomial instance with 0 & 0.
    //********************************************************************************

    public Monomial ()
    {
	this.coE = 0;
	this.exp = 0;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To simplify the current monomial if possible.
    //Input: A double coefficient, and an integer exponent.
    //Output: Initialises the fields of the monomial instance.
    //********************************************************************************

    public void simplify ()
    {
	if (this.coE == 0)
	    this.exp = 0;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To get the values of the coefficient and exponent from the user.
    //Input: A coefficient and exponent from the user, as well as the console for communication.
    //Output: Updates the fields of the monomial.
    //********************************************************************************

    public void get (Console c)
    {
	c.print ("Please enter a coefficient value for the monomial: ");
	this.coE = c.readDouble ();
	c.print ("Please enter an exponent value for the monomial: ");
	this.exp = c.readInt ();
	this.simplify ();

    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: Converts the monomial into an appropriate string form.
    //Input: None.
    //Output: A string version of the monomial.
    //********************************************************************************

    public String toString ()
    {
	String monoCoe = "";
	String monoExp = "";
	String output = "";

	if (this.coE == 1)
	    monoCoe = "";
	else if (this.coE == -1)
	    monoCoe = "-";
	else
	    monoCoe = this.coE + "";

	if (this.coE == 0)
	    monoCoe = "0";
	else if (this.exp == 1)
	    monoExp = "x";
	else if (this.exp == 0)
	{
	    if (this.coE == 1)
		monoExp = "1";
	    else
		monoExp = "";
	}
	else
	    monoExp = "x^" + this.exp;

	output = monoCoe + monoExp;
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To determine if two monomials can be added together.
    //Input: A second monomial.
    //Output: A boolean indicating if the current monomial and given monomial can be added.
    //********************************************************************************

    public boolean canAdd (Monomial secondMono)
    {
	boolean monoAdd = false;
	if (secondMono.exp == this.exp)
	    monoAdd = true;
	return monoAdd;
    }



    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To determine if a given monomial can be divided into the current monomial.
    //Input: A second monomial.
    //Output: A boolean indicating if the given monomaial can be divided into the current monomial.
    //********************************************************************************

    public boolean canDivide (Monomial secondMono)
    {
	boolean monoDivide = true;
	if (secondMono.coE == 0)
	    monoDivide = false;
	return monoDivide;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To add the current monomial with a given monomial.
    //Input: The second monomial to be added.
    //Output: A new monomial representing the sum of the monomials.
    //********************************************************************************

    public Monomial add (Monomial secondMono)
    {
	Monomial monoSum;
	monoSum = new Monomial ();
	if (this.canAdd (secondMono))
	{
	    monoSum.exp = this.exp;
	    monoSum.coE = this.coE + secondMono.coE;
	    monoSum.simplify ();
	}
	return monoSum;

    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To subtract a given monomial from the current monomial.
    //Input: The second monomial to be subtracted.
    //Output: A new monomial representing the different in the two monomials.
    //********************************************************************************

    public Monomial subtract (Monomial secondMono)
    {
	Monomial monoDiff;
	monoDiff = new Monomial ();
	if (this.canAdd (secondMono))
	{
	    monoDiff.exp = this.exp;
	    monoDiff.coE = this.coE - secondMono.coE;
	    monoDiff.simplify ();
	}
	return monoDiff;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To multiply a given monomial with the current monomial.
    //Input: The second monomial to be multiplied.
    //Output: A monomial representing the product of the two monomials.
    //********************************************************************************

    public Monomial multiply (Monomial secondMono)
    {
	Monomial monoProduct;
	monoProduct = new Monomial ();
	monoProduct.exp = this.exp + secondMono.exp;
	monoProduct.coE = this.coE * secondMono.coE;
	monoProduct.simplify ();
	return monoProduct;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To divide the current monomial with a given monomial.
    //Input: The second monomial to be divided.
    //Output: A new monomial representing the quotient from the division.
    //********************************************************************************

    public Monomial divide (Monomial secondMono)
    {
	Monomial monoQuotient;
	monoQuotient = new Monomial ();
	if (this.canDivide (secondMono))
	{
	    monoQuotient.exp = this.exp - secondMono.exp;
	    monoQuotient.coE = this.coE / secondMono.coE;
	    monoQuotient.simplify ();
	}
	return monoQuotient;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To determine the value of the monomial, given an x value.
    //Input: A value for x.
    //Output: The value of the monomial.
    //********************************************************************************

    public double value (double x)
    {
	return this.coE * Math.pow (x, this.exp);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To raise the current monomial with a given power.
    //Input: An integer power to raise the current monomial.
    //Output: A new monomial, representing the current monomial raised to the given power.
    //********************************************************************************

    public Monomial pow (int pow)
    {
	Monomial monoPow;
	monoPow = new Monomial ();
	monoPow.coE = Math.pow (this.coE, pow);
	monoPow.exp = this.exp * pow;
	return monoPow;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: September 30, 2015
    //Purpose: To determine if the given monomial is equal to the current monomial.
    //Input: A second monomial.
    //Output: A boolean representing if the current monomial is the same as the given monomial.
    //********************************************************************************

    public boolean equal (Monomial secondMono)
    {
	boolean monoEqual = false;
	if ((this.coE == secondMono.coE) && (this.exp == secondMono.exp))
	    monoEqual = true;
	return monoEqual;
    }
}
