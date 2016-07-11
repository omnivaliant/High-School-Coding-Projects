//********************************************************************************
//Author: Mohit Patel
//Date: October 25, 2015
//Purpose: To encrypt and decrypt a text file given a key.
//********************************************************************************
import java.awt.*;
import hsa.*;

public class Cryptography
{
    static Console c;           
    
    public static void main (String[] args)
    {
	c = new Console (30,80,"Cryptography");     
	char again = 'y';
	char skip = 'n';
	while (again == 'y' || again == 'Y')
	{
	    c.clear();
	    String input = "";
	    String output = "";
	    String key = "mohit";
	    c.println ("Would you like to encrypt a file? Press 'y' to continue, or any other key to skip encryption.");
	    skip = c.getChar();
	    if (skip == 'y')
	    {

		c.print ("Please enter your input file to be encrypted: ");
		input = c.readLine();
		if (input.length() < 4)
		    input = input + ".txt";
		else if (input.substring(input.length()-4).equals(".txt") == false)
		    input = input + ".txt";
		c.print ("Please enter your key: ");
		key = c.readLine();
		Vigenere crypt = new Vigenere(key);
		output = crypt.encrypt(input);
		c.println("Your encrypted file is: " + output);
	    }
	    c.println();
	    c.println ("Would you like to decrypt a file? Press 'y' to continue, or any other key to skip decryption.");
	    skip = c.getChar();
	    if (skip == 'y')
	    {
		c.print ("Please enter your input file to be decrypted: ");
		input = c.readLine();
		if (input.length() < 4)
		    input = input + ".cyp";
		else if (input.substring(input.length()-4).equals(".cyp") == false)
		    input = input + ".cyp";
		c.print ("Please enter your key: ");
		key = c.readLine();
		Vigenere crypt = new Vigenere(key);
		output = crypt.decrypt(input);
		c.println("Your decrypted file is: " + output);
	    }
	    c.println();
	    c.print("Would you like to encrypt & decrypt another file? Press 'y' to continue, or any other key to exit.");
	    again = c.getChar();
	}
	c.close();        
    } 
} 

//********************************************************************************
//Author: Mohit Patel
//Date: October 25, 2015
//Purpose: To create a Vigenere class, that is capable of encrypting and decrypting lines of text.
//Fields:
//       key: A string representing the key used to decrypt the text.
//Methods:
//       constructor: Sets the input string as the key.
//       encrypt: Encrypts a given input file with a key, using encryptLine.
//       encryptLine: Encrypts a line of text.
//       decrypt: Decrypts a given cipher file with a key, using decryptLine.
//       decryptLine: Decrypts a line of text.
//********************************************************************************

class Vigenere
{
    protected String key;
    
    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 25, 2015
    //Purpose: A constructor that initializes the key, given the string.
    //Input: A string, representing the key.
    //Output: Initializes the key field with the input.
    //********************************************************************************
    
    public Vigenere (String inputKey)
    {
	this.key = inputKey;
    }
    
    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 25, 2015
    //Purpose: Encrypts a plain text file, using the key.
    //Input: A string, representing the file name.
    //Output: A string, representing the encrypted file name.
    //********************************************************************************
    
    public String encrypt (String plainFile)
    {
	String line = "";
	if (plainFile.length() < 4)
	    plainFile = plainFile + ".txt";
	else if (plainFile.substring(plainFile.length()-4).equals(".txt") == false)
	    plainFile = plainFile + ".txt";
	TextInputFile input = new TextInputFile (plainFile);
	TextOutputFile output = new TextOutputFile (plainFile.substring(0,plainFile.length()-4) + ".cyp");
	while (!input.eof())
	{
	    line = this.encryptLine(input.readLine());
	    output.println(line);
	}
	input.close();
	output.close();
	return plainFile.substring(0,plainFile.length()-4) + ".cyp";
    }
    
    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 25, 2015
    //Purpose: Encrypts a line of text, given the line.
    //Input: A string, representing the line to be encrypted.
    //Output: A string, representing the encrypted line.
    //********************************************************************************
    
    public String encryptLine (String plainLine)
    {
	int lineIndex = 0;
	int indexValue = 0;
	int keyCount = 0;
	int offsetValue = 0;
	int resultValue = 0;
	String output = "";
	for (lineIndex = 0; lineIndex < plainLine.length(); lineIndex ++)
	{
	    indexValue = (int) plainLine.charAt(lineIndex);
	    offsetValue = ((int) this.key.charAt(keyCount)) - 32;
	    keyCount = keyCount + 1;
	    if (keyCount == this.key.length())
		keyCount = 0;
	    resultValue = indexValue + offsetValue;
	    if (resultValue > 126)
		resultValue = resultValue - 95;
	    output = output + (char) resultValue;
	}
	
	return output;
    }
    
    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 25, 2015
    //Purpose: Decrypts a cipher text file, using the key.
    //Input: A string, representing the file name.
    //Output: A string, representing the decrypted file name.
    //********************************************************************************
    
    public String decrypt (String cipherFile)
    {
	String line = "";
	if (cipherFile.length() < 4)
	    cipherFile = cipherFile + ".cyp";
	else if (cipherFile.substring(cipherFile.length()-4).equals(".cyp") == false)
	    cipherFile = cipherFile + ".cyp";
	TextInputFile input = new TextInputFile (cipherFile);
	TextOutputFile output = new TextOutputFile (cipherFile.substring(0,cipherFile.length()-4) + ".pln");
	while (!input.eof())
	{
	    line = this.decryptLine(input.readLine());
	    output.println(line);
	}
	input.close();
	output.close();
	return cipherFile.substring(0,cipherFile.length()-4) + ".pln";
    }
    
    //********************************************************************************
    //Author: Mohit Patel
    //Date: October 25, 2015
    //Purpose: Decrypts a line of text, given the line.
    //Input: A string, representing the line to be decrypted.
    //Output: A string, representing the decrypted line.
    //********************************************************************************
    public String decryptLine (String cipherLine)
    {
	int lineIndex = 0;
	int indexValue = 0;
	int keyCount = 0;
	int offsetValue = 0;
	int resultValue = 0;
	String output = "";
	for (lineIndex = 0; lineIndex < cipherLine.length(); lineIndex ++)
	{
	    indexValue = (int) cipherLine.charAt(lineIndex);
	    offsetValue = ((int) this.key.charAt(keyCount)) - 32;
	    keyCount = keyCount + 1;
	    if (keyCount == this.key.length())
		keyCount = 0;            
	    resultValue = indexValue - offsetValue;
	    if (resultValue < 32)
		resultValue = resultValue + 95;
	    output = output + (char) resultValue;
	}
	return output;
    }
}
