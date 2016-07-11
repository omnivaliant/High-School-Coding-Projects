//*************************************************************************
//Author: Mohit Patel
//Date: September 21, 2015
//Purpose: To create a variety of methods.
//Fields: The two consoles: one for direct user input and output, and one
//        unique to the display of Sierpinski's carpet.
//Methods: Prime numbers, integration, and recursion related methods.
//*************************************************************************
import java.awt.*;
import hsa.Console;

public class Methods
{
    static Console c;
    static Console d;

    public static void main (String[] args)
    {
	int intNumber = 0;
	int intFirstInput = 1;
	int intSecondInput = 10;
	int intGap = 0;
	double semiX = 0.0;
	double semiR = 0.0;
	double quadA = 0.0;
	double quadB = 0.0;
	double quadC = 0.0;
	double startX = 0.0;
	double endX = 0.0;
	long gcdM = 0;
	long gcdN = 0;
	int intCountdown = 0;
	int intLevel = 7;
	c = new Console ("Methods");
	char again = 'y';
	while (again == 'y' || again == 'Y')
	{
	    c.println ("Please enter a number to check if it is prime or not.");
	    intNumber = c.readInt ();

	    while (intNumber <= 0)
	    {
		c.println ("Your input is invalid. Please enter a positive integer to evaluate if it is prime or not.");
		intNumber = c.readInt ();
	    }

	    if (isPrime (intNumber) == true)
		c.println ("Your number is a prime number!");
	    else
		c.println ("Your number is not a prime number!");

	    c.println ();
	    c.println ("Now, enter one of the values for a range of prime numbers.");
	    intFirstInput = c.readInt ();

	    while (intFirstInput < 0)
	    {
		c.println ("Your first number is invalid. Please enter a positive integer.");
		intFirstInput = c.readInt ();
	    }

	    c.println ();
	    c.println ("Please enter the second value for the range of prime numbers.");
	    intSecondInput = c.readInt ();

	    while (intSecondInput < 0)
	    {
		c.println ("Your second number is invalid. Please enter a positive integer.");
		intSecondInput = c.readInt ();
	    }

	    if (intFirstInput > intSecondInput)
	    {
		int temp = intFirstInput;
		intFirstInput = intSecondInput;
		intSecondInput = temp;
	    }

	    c.println ();
	    c.println ("The prime numbers in between " + intFirstInput + " and " + intSecondInput + " are:");
	    printPrimes (intFirstInput, intSecondInput);
	    c.println ("There are " + calcNumOfPrimes (intFirstInput, intSecondInput) + " primes between " + intFirstInput + " and " + intSecondInput + ".");
	    c.println ();
	    c.println ("Now, enter an even gap for the two consecutive prime numbers.");
	    intGap = c.readInt ();

	    while (intGap < 0 || (intGap % 2 == 1))
	    {
		c.println ("Your gap is invalid. Please enter a positive and even number.");
		intGap = c.readInt ();
	    }


	    TwoPrimeGap consecutiveNumbers;
	    consecutiveNumbers = findTwoPrimeGap (intGap);
	    c.println ("For a gap of " + intGap + ",");
	    c.println ("The two consecutive prime numbers are " + consecutiveNumbers.firstNum + " and " + consecutiveNumbers.secondNum + ".");

	    c.println ();
	    c.println ("Now, enter an x-value for the semi-circle.");
	    semiX = c.readDouble ();
	    c.println ("Enter an r-value for the semi-circle.");
	    semiR = c.readDouble ();

	    c.println ();
	    c.println ("The value of the semi-circle at " + semiX + ", with a radius of " + semiR + ", is " + findHeight (semiX, semiR) + ".");
	    c.println ();
	    c.println ("The area of this semi-circle is " + findArea (semiR) + ".");
	    c.println ();

	    c.println ("Please enter an 'a' value for the quadratic.");
	    quadA = c.readDouble ();
	    c.println ();
	    c.println ("Please enter a 'b' value for the quadratic.");
	    quadB = c.readDouble ();
	    c.println ();
	    c.println ("Please enter a 'c' value for the quadratic.");
	    quadC = c.readDouble ();
	    c.println ();
	    c.println ("Please enter a starting x for the quadratic.");
	    startX = c.readDouble ();
	    c.println ();
	    c.println ("Please ender an ending x for the quadratic.");
	    endX = c.readDouble ();
	    c.println ();
	    c.println ("The area under the parabola is " + findArea (quadA, quadB, quadC, startX, endX) + ".");
	    c.println ();

	    c.println ("Please enter the first value for your GCD.");
	    gcdM = c.readLong ();

	    while (gcdM <= 0)
	    {
		c.println ("The first value of your GCD is invalid. Please enter a positive value.");
		gcdM = c.readLong ();
	    }

	    c.println ();
	    c.println ("Now, please enter the second value for your GCD.");
	    gcdN = c.readLong ();

	    while (gcdN <= 0)
	    {
		c.println ("The second value of your GCD is invalid. Please enter a positive value.");
		gcdN = c.readLong ();
	    }
	    c.println ();
	    c.println ("The GCD of " + gcdM + " and " + gcdN + " is " + calcGCD (gcdM, gcdN) + ".");
	    c.println ();
	    c.println ("Enter the value you would like to countdown for.");
	    intCountdown = c.readInt ();

	    while (intCountdown < 1)
	    {
		c.println ("Your countdown value is invalid. Please enter a positive integer.");
		intCountdown = c.readInt ();
	    }
	    displayCountdown (intCountdown);
	    c.println ();
	    c.println ("Please enter the amount of levels you want in Sierpinski's Carpet.");
	    intLevel = c.readInt ();

	    while (intLevel <= 0)
	    {
		c.println ("Your level is not a positive integer. Please enter a positive integer.");
		intLevel = c.readInt ();
	    }

	    displaySierpinskiCarpet (intLevel);

	    c.println ("Would you like to run the simulation again? Press 'y' to continue, or any other key to exit.");
	    c.println ();
	    again = c.getChar ();
	}
	c.close ();
	d.close ();
    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To find out if the input is a prime number.
    //Input: A positive integer.
    //Output: A boolean of if the number is prime or not.
    //*************************************************************************

    public static boolean isPrime (int num)
    {
	boolean isPrime = true;
	int oddDivisor = 3;
	if ((num == 2) || (num == 3))
	    isPrime = true;
	else if ((num < 2) || (num % 2 == 0))
	    isPrime = false;
	else
	{
	    for (oddDivisor = 3 ; Math.sqrt (num) >= oddDivisor ; oddDivisor = oddDivisor + 2)
	    {
		if (num % oddDivisor == 0)
		    isPrime = false;
	    }
	}
	return isPrime;
    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To calculate the number of primes between two integers.
    //Input: The inclusive minimum and maximum values.
    //Output: An integer representing the number of primes between the two values.
    //*************************************************************************

    public static int calcNumOfPrimes (int min, int max)
    {
	int primeCount = 0;
	int currentNum = 0;

	if (min > max)
	{
	    int temp = min;
	    min = max;
	    max = temp;
	}

	for (currentNum = min ; currentNum <= max ; currentNum++)
	{
	    if (isPrime (currentNum))
		primeCount = primeCount + 1;
	}

	return primeCount;

    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To print out the prime numbers in a range.
    //Input: The two integer boundaries in a range.
    //Output: The prime numbers within the range.
    //*************************************************************************

    public static void printPrimes (int min, int max)
    {
	int currentNum = 0;

	if (min > max)
	{
	    int temp = min;
	    min = max;
	    max = temp;
	}

	for (currentNum = min ; currentNum <= max ; currentNum++)
	    if (isPrime (currentNum))
		c.println (currentNum);
    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To find the first 2 consecutive prime numbers in the gap size.
    //Input: The gap size.
    //Output: A TwoPrimeGap reference variable with the two consecutive
    //        prime numbers as fields, or two 0s if it is invalid.
    //*************************************************************************

    public static TwoPrimeGap findTwoPrimeGap (int intGap)
    {

	int firstNumber = 2;
	int secondNumber = firstNumber + intGap;
	int betweenPrimes = 0;
	TwoPrimeGap twoPrimes;
	twoPrimes = new TwoPrimeGap ();
	boolean notConsecutive = true;

	if (intGap % 2 == 1)
	{
	    twoPrimes.firstNum = 0;
	    twoPrimes.secondNum = 0;
	}
	else
	{
	    for (firstNumber = 2 ; notConsecutive == true ; firstNumber++)
	    {
		secondNumber = firstNumber + intGap;
		if ((isPrime (firstNumber)) && (isPrime (secondNumber)))
		{
		    notConsecutive = false;
		    for (betweenPrimes = firstNumber + 1 ; betweenPrimes < secondNumber ; betweenPrimes++)
			if (isPrime (betweenPrimes))
			    notConsecutive = true;
		}
	    }
	    firstNumber = firstNumber - 1;
	    twoPrimes.firstNum = firstNumber;
	    twoPrimes.secondNum = secondNumber;
	}

	return twoPrimes;
    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To find the value of a semi-circle function.
    //Input: The x and r values of the semi-circle.
    //Output: The function value of the semi-circle.
    //*************************************************************************

    public static double findHeight (double semiX, double semiR)
    {
	double semiOutput = Math.sqrt ((semiR * semiR) - ((semiX - semiR) * (semiX - semiR)));
       // System.out.println(semiOutput);
	return semiOutput;
    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To find the area of a semi-circle.
    //Input: The radius of the semi-circle.
    //Output: The area of the semi-circle.
    //*************************************************************************

    public static double findArea (double r)
    {
	int count = 0;
	int n = 50;
	r = Math.abs(r);
	double previousArea = 0;
	double accurateArea = 0;

	for (count = 0 ; count < n ; count++)
	    previousArea = previousArea + findHeight (count * ((2 * r) / n), r) * ((2 * r) / n);

	n = n * 2;

	for (count = 0 ; count < n ; count++)
	    accurateArea = accurateArea + findHeight (count * ((2 * r) / n), r) * ((2 * r) / n);

	while (Math.abs (accurateArea - previousArea) > 0.00005)
	{
	    n = n * 2;
	    previousArea = accurateArea;
	    accurateArea = 0;

	    for (count = 0 ; count < n ; count++)
		accurateArea = accurateArea + findHeight (count * ((2 * r) / n), r) * ((2 * r) / n);
	}

	return accurateArea;


    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To find the function value of a parabola, given its co-efficients.
    //Input: The a, b, c values of the parabola, and the specific x value.
    //Output: The value of the quadratic equation at that point.
    //*************************************************************************

    public static double findHeight (double a, double b, double c, double x)
    {
	double height = (a * x * x) + (b * x) + (c);
	return height;
    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To find the function value of a parabola, given its co-efficients.
    //Input: The a,b, and c values of the parabola, as well as the domain of start and ending x-values.
    //Output: The area underneath the quadratic, between the x-values.
    //*************************************************************************

    public static double findArea (double a, double b, double c, double startX, double endX)
    {
	int iterations = 100000;
	if (startX > endX)
	{
	    double temp = startX;
	    startX = endX;
	    endX = temp;
	}
	double currentX = startX;
	double totalX = endX - startX;
	double width = totalX / iterations;
	double area = 0;
	for (currentX = startX ; currentX <= endX ; currentX = currentX + width)
	{
	    area = area + findHeight (a, b, c, currentX) * (width);
	}
	return area;
    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To recursively calculate the GCD of two integers.
    //Input: The two integers m and n.
    //Output: Their GCD.
    //*************************************************************************

    public static long calcGCD (long m, long n)
    {
	long gcd = 0;
	if ((m < 0) || (n < 0))
	    gcd = 0;
	else if (n > 0)
	    gcd = calcGCD (n, m % n);
	else if (n == 0)
	    gcd = m;
	return gcd;

    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To print out a countdown from the input to 0.
    //Input: A positive integer.
    //Output: All consecutive integers printed until 0.
    //*************************************************************************

    public static void displayCountdown (int count)
    {
	if (count > 1)
	{
	    c.print (count + ",");
	    displayCountdown (count - 1);
	}
	else if (count == 1)
	    c.println (1 + "!");
	else if (count <= 0)
	    c.println ("Your input is invalid!");



    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To initialize the creation of a fractal carpet.
    //Input: The desired amount of levels of complexity in the carpet.
    //Output: The complicated carpet design.
    //*************************************************************************

    public static void displaySierpinskiCarpet (int level)
    {
	d = new Console (40, 100, "Sierpinski's Carpet: Level " + level);
	int r = d.getWidth () / 3;
	int x = r;
	int y = r;
	recursiveSierpinskiCarpet (x, y, r, level);


    }


    //*************************************************************************
    //Author: Mohit Patel
    //Date: September 17, 2015
    //Purpose: To create a fractal carpet design using recursion.
    //Input: X and Y coordinates, size of the square, and the current level.
    //Output: A fractal image of squares surrounded by more squares.
    //*************************************************************************

    public static void recursiveSierpinskiCarpet (int x, int y, int r, int level)
    {
	if (level > 0)
	{
	    recursiveSierpinskiCarpet (x - ((2 * r) / 3), y - ((2 * r) / 3), r / 3, level - 1);
	    recursiveSierpinskiCarpet (x + (r / 3), y - ((2 * r) / 3), r / 3, level - 1);
	    recursiveSierpinskiCarpet (x + ((4 * r) / 3), y - ((2 * r) / 3), r / 3, level - 1);
	    recursiveSierpinskiCarpet (x - ((2 * r) / 3), y + (r / 3), r / 3, level - 1);
	    recursiveSierpinskiCarpet (x + ((4 * r) / 3), y + (r / 3), r / 3, level - 1);
	    recursiveSierpinskiCarpet (x - ((2 * r) / 3), y + ((4 * r) / 3), r / 3, level - 1);
	    recursiveSierpinskiCarpet (x + (r / 3), y + ((4 * r) / 3), r / 3, level - 1);
	    recursiveSierpinskiCarpet (x + ((4 * r) / 3), y + ((4 * r) / 3), r / 3, level - 1);
	    if (level == 1)
		d.setColor (Color.yellow);
	    else if (level == 2)
		d.setColor (Color.blue);
	    else if (level == 3)
		d.setColor (Color.red);
	    else if (level == 4)
		d.setColor (Color.green);
	    else if (level == 5)
		d.setColor (Color.orange);
	    else if (level == 6)
		d.setColor (Color.magenta);
	    else if (level == 7)
		d.setColor (Color.cyan);
	    else if (level == 8)
		d.setColor (Color.pink);
	    d.fillRect (x, y, r, r);
	}
    }
}
//*************************************************************************
//Author: Mohit Patel
//Date: September 17, 2015
//Purpose: To create a container class for finding two consecutive prime numbers.
//Fields: The first and second consecutive prime numbers with a given gap.
//Methods: None; it is a container class.
//*************************************************************************

class TwoPrimeGap
{
    public int firstNum;
    public int secondNum;
}
