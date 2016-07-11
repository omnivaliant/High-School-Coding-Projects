//********************************************************************************
//Author: Mohit Patel
//Date: October 1, 2015
//Purpose: To create a program demonstrating scrabble elements.
//********************************************************************************

import java.awt.*;
import hsa.Console;

public class Scrabble
{
    static Console c;
    public static void main (String[] args)
    {
	c = new Console (30, 120, "Scrabble");
	char again = 'y';
	while (again == 'y' || again == 'Y')
	{
	    Tile testTile;
	    testTile = new Tile ();
	    c.setCursor (0, 10);
	    c.println ();
	    c.println ("A new tile has been generated.");
	    c.println ("This tile is the letter " + testTile + ", and has a value of " + testTile.value () + ".");
	    c.println ("This tile will now be printed below.");
	    testTile.print (c, 10, 70);
	    c.setCursor (10, 1);

	    ScrabbleHand testHand;
	    testHand = new ScrabbleHand ();
	    c.println ("A new hand has been generated.");
	    c.println ("The hand has the letters " + testHand + ", and has the cumulative value of " + testHand.value () + ".");
	    c.println ("This hand will now be printed below.");
	    testHand.print (c, 10, 260);
	    c.println ();
	    c.setCursor (20, 1);
	    c.println ("The permutations of this hand will be printed below: ");
	    testHand.printPermutations (c, 22);
	    c.println ();
	    c.println ();
	    c.println ("Would you like to generate another random letter and hand? Press 'y' to continue, or any other key to exit.");
	    again = c.getChar ();
	}
	c.close ();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: October 1, 2015
//Purpose: To create a tile class, with a letter and various simple methods.
//Fields:
//       Letter: A character between A to Z.
//Methods:
//       constructor: To initialize the letter; either with a random letter, or
//                    a single letter determined by the parameter.
//       toString: Returns the letter of the tile.
//       value: Returns the value of the tile.
//       print: Will print the tile, given coordinates of the top left corner.
//********************************************************************************

class Tile
{
    protected char letter;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: A constructor that creates a tile, given a letter.
    //Input: A letter, representing the tile.
    //Output: Initializes the letter of the tile.
    //********************************************************************************

    public Tile (char inputLetter)
    {
	this.letter = inputLetter;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: A constructor that randomly creates a tile, when not given an input.
    //Input: None.
    //Output: Initializes the letter of the tile randomly, from A-Z.
    //********************************************************************************

    public Tile ()
    {
	int randomNumber = ((int) (Math.random () * 26)) + 65;
	this.letter = (char) randomNumber;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: To convert the tile into a string.
    //Input: None.
    //Output: The letter of the tile, as a string.
    //********************************************************************************

    public String toString ()
    {
	return "" + this.letter;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: To convert the letter of the tile into its equivalent value.
    //Input: None.
    //Output: The integer value of the tile.
    //********************************************************************************

    public int value ()
    {
	int value = 1;
	if (this.letter == 'D' || this.letter == 'G')
	    value = 2;
	else if (this.letter == 'B' || this.letter == 'C' || this.letter == 'M' || this.letter == 'P')
	    value = 3;
	else if (this.letter == 'F' || this.letter == 'H' || this.letter == 'V' || this.letter == 'W' || this.letter == 'Y')
	    value = 4;
	else if (this.letter == 'K')
	    value = 5;
	else if (this.letter == 'J' || this.letter == 'X')
	    value = 8;
	else if (this.letter == 'Q' || this.letter == 'Z')
	    value = 10;
	return value;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: To print the letter, given a coordinate of the top left corner.
    //Input: The console to be printed on, and the x and y coordinate.
    //Output: The visual display of the letter and value.
    //********************************************************************************

    public void print (Console c, int x, int y)
    {
	Color brownColour;
	brownColour = new Color (218, 165, 32);
	Font f;
	f = new Font ("Arial", Font.BOLD, 80);
	c.setColor (brownColour);
	c.fill3DRect (x, y, 100, 100, true);
	c.setColor (Color.black);
	c.setFont (f);
	c.drawString ("" + this.letter, x + 10, y + 70);
	f = new Font ("Arial", Font.BOLD, 24);
	c.setFont (f);
	c.drawString ("" + this.value (), x + 70, y + 90);
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: October 1, 2015
//Purpose: To create a hand class, composed of 5 tile classes.
//Fields:
//       tile1: A tile object representing the first scrabble tile.
//       tile2: A tile object representing the second scrabble tile.
//       tile3: A tile object representing the third scrabble tile.
//       tile4: A tile object representing the fourth scrabble tile.
//       tile5: A tile object representing the fifth scrabble tile.
//Methods:
//       constructor: To initialize the five tiles; either with no parameters,
//                    or 5 char parameters representing the 5 characters.
//       value: Returns the sum of the 5 values of the hand.
//       toString: Returns the five characters in a string.
//       print: Will print the hand, which prints the five tiles in a row.
//       printPermutations: Will print all possible 120 permutations of the hand.
//********************************************************************************

class ScrabbleHand
{
    protected Tile tile1;
    protected Tile tile2;
    protected Tile tile3;
    protected Tile tile4;
    protected Tile tile5;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: A constructor that creates the five tiles, given 5 characters.
    //Input: The five characters.
    //Output: Initializes the five tiles with the given letters.
    //********************************************************************************

    public ScrabbleHand (char inputTile1, char inputTile2, char inputTile3,
	    char inputTile4, char inputTile5)
    {
	this.tile1 = new Tile (inputTile1);
	this.tile2 = new Tile (inputTile2);
	this.tile3 = new Tile (inputTile3);
	this.tile4 = new Tile (inputTile4);
	this.tile5 = new Tile (inputTile5);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: A constructor that randomly creates the five tiles, given no input.
    //Input: None.
    //Output: Initializes the five tiles randomly, from A-Z.
    //********************************************************************************

    public ScrabbleHand ()
    {
	this.tile1 = new Tile ();
	this.tile2 = new Tile ();
	this.tile3 = new Tile ();
	this.tile4 = new Tile ();
	this.tile5 = new Tile ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: To determine the value of the entire hand.
    //Input: None.
    //Output: The value of all 5 tiles together.
    //********************************************************************************

    public int value ()
    {
	return this.tile1.value () + this.tile2.value () + this.tile3.value () +
	    this.tile4.value () + this.tile5.value ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: To converted the ScabbleHand into a string.
    //Input: None.
    //Output: The string version of the hand.
    //********************************************************************************

    public String toString ()
    {
	return "" + this.tile1 + this.tile2 + this.tile3 + this.tile4 + this.tile5;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 1, 2015
    //Purpose: To print the visualization of the hand into the console.
    //Input: The console, as well as the x and y coordinates of the initial tile.
    //Output: The graphic of the hand, in the console.
    //********************************************************************************

    public void print (Console c, int x, int y)
    {
	c.clearRect (x, y, 800, 100);
	this.tile1.print (c, x, y);
	this.tile2.print (c, x + 100, y);
	this.tile3.print (c, x + 200, y);
	this.tile4.print (c, x + 300, y);
	this.tile5.print (c, x + 400, y);
	Font f;
	f = new Font ("Arial", Font.BOLD, 70);
	c.setFont (f);
	c.drawString ("(" + this.value () + ")", x + 550, y + 70);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 4, 2015
    //Purpose: To print all possible permutations of the hand, using recursivePermutations.
    //Input: The console to print the permutations on, and the starting row.
    //Output: All 120 permutations of the hand.
    //********************************************************************************
    public void printPermutations (Console c, int intRow)
    {
	c.setCursor (intRow, 1);
	recursivePermutations (this.toString (), "", c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 4, 2015
    //Purpose: To recursively print all 120 permutations of the hand.
    //Input: A string representing all possible letters left in the permutation,
    //       a string represnting the current collection of letters in the permutation,
    //       and the console.
    //Output: All 120 permutations of the hand, on the console.
    //********************************************************************************
    public void recursivePermutations (String lettersLeft, String currentLetters, Console d)
    {
	int count = 1;
	if (lettersLeft.length () == 1)
	    d.print (currentLetters + lettersLeft + " ");
	else
	{
	    for (count = 0 ; count < lettersLeft.length () ; count++)
		recursivePermutations (lettersLeft.substring (0, count) + lettersLeft.substring (count + 1), currentLetters + lettersLeft.charAt (count), d);
	}
    }
}
