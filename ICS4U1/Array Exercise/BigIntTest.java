//********************************************************************************
//Author: Mohit Patel
//Date: October 13, 2015
//Purpose: To create a BigPositiveInt class and BigInt class, which allows the creation of big integers.
//********************************************************************************

import java.awt.*;
import hsa.Console;

public class BigIntTest
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console (30, 100, "BigPositiveInt Class");
	char again = 'y';
	while (again == 'y' || again == 'Y')
	{

	    c.clear ();
	    c.println("You will now enter your first BigPositiveInt: ");
	    BigPositiveInt firstInt = new BigPositiveInt (0);
	    firstInt.get(c);
	    c.println("You will now enter your second BigPositiveInt: ");
	    BigPositiveInt secondInt = new BigPositiveInt (0);
	    secondInt.get(c);
	    BigPositiveInt combinedInt = new BigPositiveInt (0);
	    c.println();
	    combinedInt = firstInt.add (secondInt);
	    c.println ("Your summed BigPositiveInt is now " + combinedInt.toString () + ".");
	    c.println();
	    c.println("You may choose to subtract only if the second BigPositiveInt is smaller than the first BigPositiveInt.");
	    c.println("Press 'y' if that is that is true, or any other key to skip subtraction.");
	    char subtract = c.getChar();
	    c.println();
	    if (subtract=='y')
	    {
		combinedInt = firstInt.subtract(secondInt);
		c.println("Your subtracted BigPositiveInt is now " + combinedInt.toString() + ".");
	    } 
	    combinedInt = firstInt.multiply (secondInt);
	    c.println("Your multiplied BigPositiveInt is now " + combinedInt.toString () + ".");
	    c.println();
	    c.println ("Would you like to test more BigPositiveInts? Press 'y' to continue, or any other key to exit.");
	    again = c.getChar ();
	}
	c.close ();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: October 13, 2015
//Purpose: To create a BigPositiveInt class, with various fields and methods.
//Fields:
//       int[] digits: An integer array representing the digits in the big integer.
//       size: An integer representing the amount of digits in the big integer.
//       sign: A character ('+' or '-') representing if the BigPositiveInt is positive or negative.
//Methods:
//       constructor: To initialize the BigPositiveInt with:
//                    1) A size and a single value to be placed in every digit.
//                    2) A size, which will call the first constructor with a value of 0.
//       get: Gets the BigPositiveInt from the user, given the console.
//       addDigitFront: Adds a digit to the front of the BigPositiveInt. (offset 0)
//       addDigitBack: Adds a digit to the back of the BigPositiveInt. (offset size)
//       toString: Creates a string of the BigPositiveInt in the correct format.
//       add: Adds a given integer to the current BigPositiveInt, creating a new BigPositiveInt.
//       add (overloaded): Adds a given BigPositiveInt to the current BigPositiveInt, returning a new BigPositiveInt.
//       subtract: Subtracts a given integer from the current BigPositiveInt, returning a BigPositiveInt.
//       subtract (overloaded): Subtracts a given BigPositiveInt to the current BigPositiveInt, returning a new BigPositiveInt.
//       multiply: Multiplies a given integer with the current BigPositiveInt, returning a BigPositiveInt.
//       multiply (overloaded): Multiplies a given BigPositiveInt with the current BigPositiveInt, returning a BigPositiveInt.
//********************************************************************************

class BigPositiveInt
{

    protected int[] digits;
    protected int size;
    protected char sign;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: A constructor that initializes the size and all values, given the size and a value.
    //Parameters: The size and value for each digit.
    //Return Value: None.
    //********************************************************************************

    public BigPositiveInt (int size, int digit)
    {
	int currentDigit = 0;
	this.digits = new int [size];
	this.size = size;
	this.sign = '+';
	for (currentDigit = size - 1 ; currentDigit >= 0 ; currentDigit--)
	    this.digits [currentDigit] = digit;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: A constructor that initializes the size and all values, given a size.
    //Parameters: The size.
    //Return Value: None.
    //********************************************************************************

    public BigPositiveInt (int size)
    {
	this (size, 0);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: To get the BigPositiveInt from the user.
    //Parameters: Console object.
    //Return Value: None.
    //********************************************************************************

    public void get (Console c)
    {
	String a;
	a = c.readString ();
	this.size = 0;

	for (int i = 0 ; i < a.length () ; i++)
	    this.addDigitFront (a.charAt (i) - '0');

	this.removeLeadingZeros ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Removes any excess zeroes in the front of the array.
    //Parameters: None.
    //Return Value: None.
    //********************************************************************************

    public void removeLeadingZeros ()
    {
	int[] old;
	while ((this.digits [this.size - 1] == 0) && (size > 1))
	    this.size--;

	old = this.digits;
	this.digits = new int [this.size];

	for (int a = 0 ; a < this.size ; a++)
	    this.digits [a] = old [a];
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Adds a given integer to the front of the current BigPositiveInt.
    //Parameters: Given integer.
    //Return Value: None
    //********************************************************************************

    public void addDigitFront (int added)
    {
	int[] oldDigit;
	oldDigit = this.digits;

	this.size++;
	this.digits = new int [this.size];

	for (int i = 1 ; i < this.size ; i++)
	    this.digits [i] = oldDigit [i - 1];
	this.digits [0] = added;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Adds a given integer to the back of the current BigPositiveInt.
    //Parameters: Given integer.
    //Return Value: None
    //********************************************************************************

    public void addDigitBack (int added)
    {
	int[] oldDigit;
	oldDigit = this.digits;

	this.size++;
	this.digits = new int [this.size];

	for (int i = 0 ; i < this.size - 1 ; i++)
	    this.digits [i] = oldDigit [i];
	this.digits [this.size - 1] = added;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Converts the BigPositiveInt into a string format.
    //Parameters: None.
    //Return Value: The BigPositiveInt as a string.
    //********************************************************************************

    public String toString ()
    {
	String output = "";
	int count = 0;
	for (count = this.size - 1 ; count >= 0 ; count--)
	    output = output + this.digits [count];
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Adds a given integer into the current BigPositiveInt, creating a new BigPositiveInt.
    //Parameters: The integer to be added with.
    //Return Value: A BigPositiveInt, the result of the addition.
    //********************************************************************************

    public BigPositiveInt add (int intAdd)
    {
	int count = 0;
	int intLength = String.valueOf (intAdd).length ();
	int[] sumArray = new int [intLength];
	BigPositiveInt sumInt = new BigPositiveInt (intLength);


	for (count = 0 ; count < intLength ; count++)
	{
	    sumArray [count] = intAdd % 10;
	    intAdd = intAdd / 10;
	}
	sumInt.digits = sumArray;
	sumInt.size = intLength;
	BigPositiveInt added = this.add (sumInt);
	return added;


    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Adds a given BigPositiveInt into the current BigPositiveInt, creating a new BigPositiveInt.
    //Parameters: The BigPositiveInt to be added.
    //Return Value: A BigPositiveInt, the result of the addition.
    //********************************************************************************

    public BigPositiveInt add (BigPositiveInt bigInput)
    {
	int count = 0;
	this.removeLeadingZeros ();
	BigPositiveInt sumInt = new BigPositiveInt (this.size);
	sumInt.removeLeadingZeros ();


	while (this.size >= bigInput.size)
	{
	    bigInput.addDigitBack (0);
	}

	while (sumInt.size < bigInput.size)
	{
	    sumInt.addDigitBack (0);
	}

	for (count = 0 ; (count < this.size) && (count < sumInt.size) ; count++)
	{
	    sumInt.digits [count] = this.digits [count];
	}
	
	count = 0;
	
	while (count < bigInput.size)
	{
	    sumInt.digits [count] = sumInt.digits [count] + bigInput.digits [count];
	    
	    if (sumInt.digits [count] >= 10)
	    {
		sumInt.digits [count] = sumInt.digits [count] % 10;
		
		if (count == sumInt.digits.length - 1)
		{
		    sumInt.addDigitBack (0);
		}
		
		sumInt.digits [count + 1] = sumInt.digits [count + 1] + 1;
	    }
	    count = count + 1;
	}
	sumInt.removeLeadingZeros ();
	sumInt.size = sumInt.digits.length;
	return sumInt;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 20, 2015
    //Purpose: Subtracts the given integer into the current BigPositiveInt, creating a new BigPositiveInt.
    //         An assumption made is that the number being subtracted is less than the current BigPositiveInt.
    //Parameters: The integer to be subtracted.
    //Return Value: A BigPositiveInt, the result of the subtraction.
    //********************************************************************************

    public BigPositiveInt subtract (int intSubtract)
    {
	int count = 0;
	int intLength = String.valueOf (intSubtract).length ();
	int[] diffArray = new int [intLength];
	BigPositiveInt diffInt = new BigPositiveInt (intLength);

	for (count = 0 ; count < intLength ; count++)
	{
	    diffArray [count] = intSubtract % 10;
	    intSubtract = intSubtract / 10;
	}
	diffInt.digits = diffArray;
	diffInt.size = intLength;
	BigPositiveInt difference = this.subtract (diffInt);
	return difference;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 20, 2015
    //Purpose: Subtracts the given BigPositiveInt from the current BigPositiveInt, creating a new BigPositiveInt.
    //         An assumption made is that the number being subtracted is less than the current BigPositiveInt.
    //Parameters: The BigPositiveInt to be subtracted.
    //Return Value: A BigPositiveInt, the result of the subtraction.
    //********************************************************************************

    public BigPositiveInt subtract (BigPositiveInt bigInput)
    {
	int count = 0;
	this.removeLeadingZeros ();
	BigPositiveInt diffInt = new BigPositiveInt (this.size);
	diffInt.removeLeadingZeros ();

	while (this.size >= bigInput.size)
	{
	    bigInput.addDigitBack (0);
	}

	while (diffInt.size < bigInput.size)
	{
	    diffInt.addDigitBack (0);
	}

	for (count = 0 ; (count < this.size) && (count < diffInt.size) ; count++)
	{
	    diffInt.digits [count] = this.digits [count];
	}

	count = 0;
	while (count < bigInput.size)
	{
	    diffInt.digits [count] = diffInt.digits [count] - bigInput.digits [count];

	    if (diffInt.digits [count] < 0)
	    {
		diffInt.digits [count] = diffInt.digits [count] + 10;
		diffInt.digits [count + 1] = diffInt.digits [count + 1] - 1;
	    }
	    count = count + 1;
	}
	diffInt.removeLeadingZeros ();
	diffInt.size = diffInt.digits.length;
	return diffInt;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 21, 2015
    //Purpose: Multiplies the given integer into the BigPositiveInt.
    //Parameters: The integer to be multiplied.
    //Return Value: A BigPositiveInt, the result of the multiplication.
    //********************************************************************************

    public BigPositiveInt multiply (int intMultiply)
    {
	int count = 0;
	int intLength = String.valueOf (intMultiply).length ();
	int[] productArray = new int [intLength];
	BigPositiveInt productInt = new BigPositiveInt (intLength);

	for (count = 0 ; count < intLength ; count++)
	{
	    productArray [count] = intMultiply % 10;
	    intMultiply = intMultiply / 10;
	}
	productInt.digits = productArray;
	productInt.size = intLength;
	BigPositiveInt multiResult = this.multiply (productInt);
	return multiResult;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 20, 2015
    //Purpose: Multiplies the given BigPositiveInt into the current BigPositiveInt.
    //Parameters: The BigPositiveInt to be multiplied.
    //Return Value: A BigPositiveInt, the result of the multiplication.
    //********************************************************************************

    public BigPositiveInt multiply (BigPositiveInt bigInput)
    {
	int count = 0;
	int currentDigit = 0;
	int carry = 0;

	BigPositiveInt multInt = new BigPositiveInt (this.size + bigInput.size, 0);
	BigPositiveInt sumLine = new BigPositiveInt (this.size + bigInput.size, 0);
	currentDigit = 0;
	for (currentDigit = 0 ; currentDigit < bigInput.size ; currentDigit++)
	{
	    for (count = 0 ; count < this.size ; count++)
	    {
		sumLine.digits[count] = bigInput.digits [currentDigit] * this.digits [count] + carry;
		if (sumLine.digits[count] >= 10)
		{
		    if (count == this.size-1)
		    {
			sumLine.digits[count+1] = sumLine.digits[count] / 10;
			sumLine.digits[count] = sumLine.digits[count] % 10;
		    }
		    else
		    {
			carry = sumLine.digits[count] / 10;
			sumLine.digits[count] = sumLine.digits[count] % 10;
		    }
		}
		else
		    carry = 0;
	    }
	    count = currentDigit;
	    while (count > 0)
	    {
		sumLine.addDigitFront(0);
		count = count - 1;
	    }
	    multInt = multInt.add(sumLine);
	    sumLine = new BigPositiveInt(this.size+bigInput.size,0);
	    carry = 0;
	}
	multInt.removeLeadingZeros();
	multInt.size = multInt.digits.length;
	return multInt;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: October 21, 2015
//Purpose: To create a BigInt class, with various fields and methods.
//Fields:
//       int[] digits: An integer array representing the digits in the big integer.
//       size: An integer representing the amount of digits in the big integer.
//       sign: A character ('+' or '-') representing if the BigInt is positive or negative.
//Methods:
//       constructor: To initialize the BigInt with:
//                    1) A size and a single value to be placed in every digit, and the sign.
//                    2) A size, which will call the first constructor with a value of 0.
//       get: Gets the BigInt from the user, given the console.
//       addDigitFront: Adds a digit to the front of the BigInt (offset 0)
//       addDigitBack: Adds a digit to the back of the BigInt (offset size)
//       toString: Creates a string of the BigInt in the correct format.
//       add: Adds a given integer to the current BigInt, creating a new BigInt.
//       add (overloaded): Adds a given BigInt to the current BigInt, returning a new BigInt.
//       subtract: Subtracts a given integer from the current BigInt, returning a BigInt.
//       subtract (overloaded): Subtracts a given BigInt to the current BigInt, returning a new BigInt.
//       multiply: Multiplies a given integer with the current BigInt, returning a BigInt.
//       multiply (overloaded): Multiplies a given BigInt with the current BigInt, returning a BigInt.
//********************************************************************************

class BigInt
{

    protected int[] digits;
    protected int size;
    protected char sign;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: A constructor that initializes the size and all values, given the size, value, and sign.
    //Parameters: The size, value for each digit, and sign/
    //Return Value: None.
    //********************************************************************************

    public BigInt (int size, int digit, char sign)
    {
	int currentDigit = 0;
	this.digits = new int [size];
	this.size = size;
	if (sign == '-')
	    this.sign = '-';
	else
	    this.sign = '+';
	for (currentDigit = size - 1 ; currentDigit >= 0 ; currentDigit--)
	    this.digits [currentDigit] = digit;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: A constructor that initializes the size and all values, given a size.
    //Parameters: The size.
    //Return Value: None.
    //********************************************************************************

    public BigInt (int size)
    {
	this (size, 0, '+');
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: To get the BigInt from the user.
    //Parameters: Console object.
    //Return Value: None.
    //********************************************************************************

    public void get (Console c)
    {
	String a;
	a = c.readString ();
	this.size = 0;

	for (int i = 0 ; i < a.length () ; i++)
	    this.addDigitBack (a.charAt (i) - '0');
	char sign = c.readChar();
	if (sign == '-')
	    this.sign = '-';
	else
	    this.sign = '+';

	this.removeLeadingZeros ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Removes any excess zeroes in the front of the array.
    //Parameters: None.
    //Return Value: None.
    //********************************************************************************

    public void removeLeadingZeros ()
    {
	int[] old;
	while ((this.digits [this.size - 1] == 0) && (size > 1))
	    this.size--;

	old = this.digits;
	this.digits = new int [this.size];

	for (int a = 0 ; a < this.size ; a++)
	    this.digits [a] = old [a];
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Adds a given integer to the front of the current BigInt.
    //Parameters: Given integer.
    //Return Value: None
    //********************************************************************************

    public void addDigitFront (int added)
    {
	int[] oldDigit;
	oldDigit = this.digits;

	this.size++;
	this.digits = new int [this.size];

	for (int i = 1 ; i < this.size ; i++)
	    this.digits [i] = oldDigit [i - 1];
	this.digits [0] = added;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Adds a given integer to the back of the current BigInt.
    //Parameters: Given integer.
    //Return Value: None
    //********************************************************************************

    public void addDigitBack (int added)
    {
	int[] oldDigit;
	oldDigit = this.digits;

	this.size++;
	this.digits = new int [this.size];

	for (int i = 0 ; i < this.size - 1 ; i++)
	    this.digits [i] = oldDigit [i];
	this.digits [this.size - 1] = added;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Converts the BigInt into a string format.
    //Parameters: None.
    //Return Value: The BigInt as a string.
    //********************************************************************************

    public String toString ()
    {
	String output = "";
	int count = 0;
	for (count = this.size - 1 ; count >= 0 ; count--)
	    output = output + this.digits [count];
	if (sign == '-')
	    output = this.sign + output;
	return output;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Adds a given integer into the current BigInt, creating a new BigInt.
    //Parameters: The integer to be added with.
    //Return Value: A BigInt, the result of the addition.
    //********************************************************************************

    public BigInt add (int intAdd)
    {
	int count = 0;
	int intLength = String.valueOf (intAdd).length ();
	int[] sumArray = new int [intLength];
	BigInt sumInt = new BigInt (intLength);


	for (count = 0 ; count < intLength ; count++)
	{
	    sumArray [count] = intAdd % 10;
	    intAdd = intAdd / 10;
	}
	sumInt.digits = sumArray;
	sumInt.size = intLength;
	if (intAdd < 0)
	    sumInt.sign = '-';
	else
	    sumInt.sign = '+';
	BigInt added = this.add (sumInt);
	return added;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 13, 2015
    //Purpose: Adds a given BigInt into the current BigInt, creating a new BigInt.
    //Parameters: The BigInt to be added.
    //Return Value: A BigInt, the result of the addition.
    //********************************************************************************

    public BigInt add (BigInt bigInput)
    {
	int count = 0;
	this.removeLeadingZeros ();
	BigInt sumInt = new BigInt (this.size);
	sumInt.removeLeadingZeros ();
	if (this.sign != sumInt.sign)
	{
	    sumInt = this.subtract(bigInput);
	}
	while (this.size >= bigInput.size)
	{
	    bigInput.addDigitBack (0);
	}

	while (sumInt.size < bigInput.size)
	{
	    sumInt.addDigitBack (0);
	}

	for (count = 0 ; (count < this.size) && (count < sumInt.size) ; count++)
	{
	    sumInt.digits [count] = this.digits [count];
	}
	
	count = 0;
	
	while (count < bigInput.size)
	{
	    sumInt.digits [count] = sumInt.digits [count] + bigInput.digits [count];
	    
	    if (sumInt.digits [count] >= 10)
	    {
		sumInt.digits [count] = sumInt.digits [count] % 10;
		
		if (count == sumInt.digits.length - 1)
		{
		    sumInt.addDigitBack (0);
		}
		
		sumInt.digits [count + 1] = sumInt.digits [count + 1] + 1;
	    }
	    count = count + 1;
	}
	sumInt.removeLeadingZeros ();
	sumInt.size = sumInt.digits.length;
	return sumInt;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 20, 2015
    //Purpose: Subtracts the given integer into the current BigInt, creating a new BigInt.
    //         An assumption made is that the number being subtracted is less than the current BigInt.
    //Parameters: The integer to be subtracted.
    //Return Value: A BigInt, the result of the subtraction.
    //********************************************************************************

    public BigInt subtract (int intSubtract)
    {
	int count = 0;
	int intLength = String.valueOf (intSubtract).length ();
	int[] diffArray = new int [intLength];
	BigInt diffInt = new BigInt (intLength);

	for (count = 0 ; count < intLength ; count++)
	{
	    diffArray [count] = intSubtract % 10;
	    intSubtract = intSubtract / 10;
	}
	diffInt.digits = diffArray;
	diffInt.size = intLength;
	BigInt difference = this.subtract (diffInt);
	return difference;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 20, 2015
    //Purpose: Subtracts the given BigInt from the current BigInt, creating a new BigInt.
    //         An assumption made is that the number being subtracted is less than the current BigInt.
    //Parameters: The BigInt to be subtracted.
    //Return Value: A BigInt, the result of the subtraction.
    //********************************************************************************

    public BigInt subtract (BigInt bigInput)
    {
	int count = 0;
	this.removeLeadingZeros ();
	BigInt diffInt = new BigInt (this.size);
	diffInt.removeLeadingZeros ();

	while (this.size >= bigInput.size)
	{
	    bigInput.addDigitBack (0);
	}

	while (diffInt.size < bigInput.size)
	{
	    diffInt.addDigitBack (0);
	}

	for (count = 0 ; (count < this.size) && (count < diffInt.size) ; count++)
	{
	    diffInt.digits [count] = this.digits [count];
	}

	count = 0;
	while (count < bigInput.size)
	{
	    diffInt.digits [count] = diffInt.digits [count] - bigInput.digits [count];

	    if (diffInt.digits [count] < 0)
	    {
		diffInt.digits [count] = diffInt.digits [count] + 10;
		diffInt.digits [count + 1] = diffInt.digits [count + 1] - 1;
	    }
	    count = count + 1;
	}
	diffInt.removeLeadingZeros ();
	diffInt.size = diffInt.digits.length;
	return diffInt;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 21, 2015
    //Purpose: Multiplies the given integer into the BigInt.
    //Parameters: The integer to be multiplied.
    //Return Value: A BigInt, the result of the multiplication.
    //********************************************************************************

    public BigInt multiply (int intMultiply)
    {
	int count = 0;
	int intLength = String.valueOf (intMultiply).length ();
	int[] productArray = new int [intLength];
	BigInt productInt = new BigInt (intLength);

	for (count = 0 ; count < intLength ; count++)
	{
	    productArray [count] = intMultiply % 10;
	    intMultiply = intMultiply / 10;
	}
	productInt.digits = productArray;
	productInt.size = intLength;
	BigInt multiResult = this.multiply (productInt);
	return multiResult;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 20, 2015
    //Purpose: Multiplies the given BigInt into the current BigInt.
    //Parameters: The BigInt to be multiplied.
    //Return Value: A BigInt, the result of the multiplication.
    //********************************************************************************

    public BigInt multiply (BigInt bigInput)
    {
	int count = 0;
	int currentDigit = 0;
	int carry = 0;

	BigInt multInt = new BigInt (this.size + bigInput.size, 0,'+');
	BigInt sumLine = new BigInt (this.size + bigInput.size, 0,'+');
	currentDigit = 0;
	for (currentDigit = 0 ; currentDigit < bigInput.size ; currentDigit++)
	{
	    for (count = 0 ; count < this.size ; count++)
	    {
		sumLine.digits[count] = bigInput.digits [currentDigit] * this.digits [count] + carry;
		if (sumLine.digits[count] >= 10)
		{
		    if (count == this.size-1)
		    {
			sumLine.digits[count+1] = sumLine.digits[count] / 10;
			sumLine.digits[count] = sumLine.digits[count] % 10;
		    }
		    else
		    {
			carry = sumLine.digits[count] / 10;
			sumLine.digits[count] = sumLine.digits[count] % 10;
		    }
		}
		else
		    carry = 0;
	    }
	    count = currentDigit;
	    while (count > 0)
	    {
		sumLine.addDigitFront(0);
		count = count - 1;
	    }
	    multInt = multInt.add(sumLine);
	    sumLine = new BigInt(this.size+bigInput.size,0,'+');
	    carry = 0;
	}
	multInt.removeLeadingZeros();
	multInt.size = multInt.digits.length;
	return multInt;
    }
}
