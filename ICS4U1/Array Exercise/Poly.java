//********************************************************************************
//Author: Mohit Patel
//Date: October 11, 2015
//Purpose: To create a polynomial class, with various fields and methods.
//********************************************************************************
import java.awt.*;
import hsa.Console;

public class Poly
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console (30, 100, "Roots of a Polynomial");
	char again = 'y';
	while (again == 'y' || again == 'Y')
	{
	    c.clear ();
	    double inputX = 0;
	    Polynomial testPolynomial = new Polynomial (0);
	    testPolynomial.get (c);
	    c.println ("The polynomial you have given is: " + testPolynomial.toString () + ".");
	    c.println ("The derivative of the polynomial is: " + testPolynomial.derivative () + ".");
	    c.print ("Please enter an x-value to evaluate the polynomial: ");
	    inputX = c.readDouble ();
	    c.println ("The polynomial evaluated at " + inputX + " is: " + testPolynomial.value (inputX) + ".");
	    c.println ("One of the roots of the polynomial is " + testPolynomial.root () + ".");
	    c.println ();
	    c.println ("Would you like to enter another polynomial? Press 'y' to continue, or any other key to exit.");
	    again = c.getChar ();
	}
	c.close ();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: October 11, 2015
//Purpose: To create a Polynomial class, with various fields and methods.
//Fields:
//       double [] coeff: An array containing doubles representing the coefficients of the polynomial.
//       degree: An integer representing the degree of the polynomial.
//Methods:
//       constructor: To initialize the array of coefficients and degree, given the degree.
//       toString: Creates a string that accurately represents the polynomial.
//       get: Allows the user to enter the degree and the coefficients.
//       value: Calculates the value of the function given an x value, using Horner's Rule.
//       derivative: Calculates the derivative of the polynomial function.
//       newton: Returns the root of the polynomial using Newton's method.
//       root: Calls newton to calculate a root of the polynomial.
//********************************************************************************

class Polynomial
{

    protected double[] coeff;
    protected int degree;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: A constructor that creates a Polynomial, given a degree.
    //Input: An integer degree.
    //Output: Initializes the coeff double array and degree of the polynomial.
    //********************************************************************************

    public Polynomial (int inputDegree)
    {
	this.degree = 0;
	this.coeff = new double [0];
	if (inputDegree >= 0)
	{
	    this.degree = inputDegree;
	    this.coeff = new double [inputDegree + 1];
	    int polyInit = 0;
	    for (polyInit = 0 ; polyInit <= this.degree ; polyInit++)
		this.coeff [polyInit] = 0;
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: To convert the polynomial into a string format.
    //Input: None.
    //Output: A string representing the polynomial.
    //********************************************************************************

    public String toString ()
    {
	String currentFunction = "";
	int currentDegree = 0;
	for (currentDegree = this.degree ; currentDegree >= 0 ; currentDegree--)
	{
	    String currentCoe = "";
	    String currentExp = "";
	    double currentOffset = this.coeff [currentDegree];

	    if (currentOffset == 1)
		if ((currentDegree < this.degree) && (currentFunction.length () > 0))
		    currentCoe = "+";
		else
		    currentCoe = "";
	    else if ((currentOffset == -1) && (currentDegree > 0))
		currentCoe = "-";
	    else if ((currentDegree == this.degree) || (currentOffset < 0) || (currentFunction.length () == 0))
	    {
		currentCoe = "" + currentOffset;
	    }
	    else
		currentCoe = "+" + currentOffset;

	    if (currentOffset == 0)
		currentCoe = "";

	    else if (currentDegree == 1)
		currentExp = "x";
	    else if (currentDegree == 0)
	    {
		if (currentOffset == 1)
		    currentExp = "1";
		else
		    currentExp = "";
	    }
	    else
		currentExp = "x^" + currentDegree;

	    currentFunction = currentFunction + currentCoe + currentExp + "";
	}

	if (currentFunction.length () == 0)
	{
	    currentFunction = "0";
	}
	return currentFunction;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: To allow the user to enter the degree and the coefficients.
    //Input: The console used for communication.
    //Output: A polynomial with properties equivilent to the input values.
    //********************************************************************************

    public void get (Console c)
    {
	int inputDegree = 0;
	int currentDegree = 0;
	c.print ("Please enter a value for the degree of the polynomial: ");
	inputDegree = c.readInt ();
	while (inputDegree < 0)
	{
	    c.print ("Your degree is invalid. Please enter a positive integer for the degree: ");
	    inputDegree = c.readInt ();
	}
	this.degree = inputDegree;
	this.coeff = new double [inputDegree + 1];
	for (currentDegree = inputDegree ; currentDegree >= 0 ; currentDegree--)
	{
	    c.print ("You will now enter the coefficient for degree " + currentDegree + " of the polynomial: ");
	    this.coeff [currentDegree] = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: To calcluate the value of the polynomial, given an x value.
    //Input: An x value.
    //Output: The value of the polynomial, using Horner's rule.
    //********************************************************************************

    public double value (double x)
    {
	double output = 0;
	int currentDegree = 0;
	for (currentDegree = this.degree ; currentDegree >= 0 ; currentDegree--)
	{
	    output = this.coeff [currentDegree] + (x * output);
	}
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: To calcluate the derivative of the current polynomial.
    //Input: None.
    //Output: A polynomial that is the derivative of the current one.
    //********************************************************************************

    public Polynomial derivative ()
    {
	int currentDegree = 0;
	Polynomial outputDerivative = new Polynomial (0);
	if (this.degree > 0 || this.coeff [0] > 0)
	{
	    outputDerivative = new Polynomial (this.degree - 1);
	    for (currentDegree = outputDerivative.degree ; currentDegree >= 0 ; currentDegree--)
	    {
		outputDerivative.coeff [currentDegree] = (currentDegree + 1) * (this.coeff [currentDegree + 1]);
	    }
	}
	return outputDerivative;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: To approximate a root of the current polynomial, calling newton.
    //Input: None.
    //Output: An approximate root of the polynomial, or an error message if no real roots are found.
    //********************************************************************************

    public double root ()
    {
	double currentRoot = 0;
	double prevRoot = currentRoot - this.newton (currentRoot);
	int countMax = 0;
	while (Math.abs (currentRoot - prevRoot) > 0.01 && countMax < 1000000)
	{
	    prevRoot = currentRoot;
	    currentRoot = currentRoot - this.newton (currentRoot);
	    countMax = countMax + 1;
	}
	if (countMax == 1000000)
	{
	    currentRoot = 0;
	    System.out.println ("Error: There is no real root nearby.");
	}
	return currentRoot;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: To approximate the root of the current polynomial, being called by root.
    //Input: None.
    //Output: The approximate root of the polynomial.
    //********************************************************************************

    protected double newton (double approxRoot)
    {
	Polynomial rootDerivative = new Polynomial (0);
	rootDerivative = this.derivative ();
	double denominator = rootDerivative.value (approxRoot);
	if (denominator == 0)
	    denominator = rootDerivative.value (approxRoot + 0.000000001);
	return (this.value (approxRoot)) / denominator;
    }
}
