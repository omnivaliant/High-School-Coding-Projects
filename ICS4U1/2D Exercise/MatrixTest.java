//********************************************************************************
//Author: Mohit Patel
//Date: November 3, 2015
//Purpose: To write a Matrix class, which has fields and methods of a matrix.
//********************************************************************************
import java.awt.*;
import java.util.*;
import hsa.*;

public class MatrixTest
{
    static Console c;
    static Console d;

    public static void main (String[] args) throws CloneNotSupportedException
    {
	c = new Console (40, 70, "Matrices Input");
	char again = 'y';
	while (again == 'y' || again == 'Y')
	{
	    c.clear ();
	    Matrix firstMatrix = new Matrix ();
	    firstMatrix.get (c);
	    Matrix secondMatrix = new Matrix ();
	    secondMatrix.get (c);
	    c.println ("Your matrices will be shown on a different console.");
	    c.println ("Only your first matrix will be evaluated for properties.");
	    d = new Console (45, 160, "Matrices Output");
	    d.println ("The first matrix: ");
	    firstMatrix.print (d, d.getRow (), d.getColumn ());
	    d.println ("The second matrix: ");
	    secondMatrix.print (d, d.getRow (), d.getColumn ());
	    d.println ("First column average: ");
	    Matrix columnAverage = new Matrix ();
	    columnAverage = firstMatrix.columnAverage ();
	    columnAverage.print (d, d.getRow (), d.getColumn ());
	    if (firstMatrix.square ())
	    {
		d.println ("Your first matrix is square.");
		d.println ("The determinant of your matrix is: " + firstMatrix.determinant () + ".");
	    }
	    else
	    {
		d.println ("Your first matrix is not square.");
	    }
	    if (firstMatrix.sameSize (secondMatrix))
	    {
		d.println ("Your two matrices are the same size.");
		d.println ();
		d.println ("Formatted for matrices less than 5 columns: ");
		d.println ("Adding gives: ");
		int prevRow = d.getRow ();
		Matrix add = new Matrix ();
		add = firstMatrix.add (secondMatrix);
		firstMatrix.print (d, prevRow, d.getColumn ());
		d.setCursor (prevRow + 1, d.getColumn () + 39);
		d.println ("+");
		secondMatrix.print (d, prevRow, d.getColumn () + 40);
		d.setCursor (prevRow + 1, d.getColumn () + 79);
		d.println ("=");
		add.print (d, prevRow, d.getColumn () + 80);
		prevRow = d.getRow ();
		firstMatrix.print (d, prevRow, d.getColumn ());
		d.setCursor (prevRow + 1, d.getColumn () + 39);
		d.println ("-");
		secondMatrix.print (d, prevRow, d.getColumn () + 40);
		d.setCursor (prevRow + 1, d.getColumn () + 79);
		d.println ("=");
		Matrix subtract = new Matrix ();
		subtract = firstMatrix.subtract (secondMatrix);
		subtract.print (d, prevRow, d.getColumn () + 80);
	    }
	    else
		d.println ("Your two matrices are not the same size.");
	    Matrix minor = new Matrix ();
	    minor = firstMatrix.minor (1, 1);
	    d.println ("The minor of the first matrix, with the first row and column removed, is: ");
	    minor.print (d, d.getRow (), d.getColumn ());
	    Matrix transpose = new Matrix ();
	    transpose = firstMatrix.transpose ();
	    d.println ("The transpose of the first matrix is: ");
	    transpose.print (d, d.getRow (), d.getColumn ());
	    if (firstMatrix.rows == secondMatrix.rows)
	    {
		d.println ("The concatenated matrix is: ");
		Matrix concatenated = new Matrix ();
		concatenated = firstMatrix.concatenate (secondMatrix);
		concatenated.print (d, d.getRow (), d.getColumn ());
	    }

	    c.println ();
	    c.print ("Would you like to test another matrix? Press 'y' to continue, or any other key to exit.");
	    again = c.getChar ();
	    d.clear ();
	    d.close ();
	}
	c.close ();

    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 3, 2015
//Purpose: To create a Matrix class, that is capable of doing matrix operations.
//Fields:
//       element: The 2D array of doubles itself.
//       rows: An integer value representing the amount of rows in the matrix.
//       cols: An integer value representing the amount of columns in the matrix.
//Methods:
//       constructor: To initialize the Matrix with:
//                    1) No parameters, making an empty matrix.
//                    2) One parameter (n), making a n-square matrix initialized to 0.
//                    3) Two parameters (m,n), making a mxn rectangular matrix initialized to 0.
//                    4) Three parameters (m,n,p), making a mxn rectangular matrix initialzed to p.
//       clone: Makes a deep copy of the matrix.
//       get: Obtains the matrix from the user.
//       print: Accurately prints the matrix given a console, starting screen row, and starting screen column.
//       getFromFile: Reads and assigns the values of the rows and columns of the matrix, given a TextInputFile.
//       columnAverage: Returns a matrix row representing the average of each of the columns.
//       sameSize: Returns if the given matrix is the same size as the current matrix.
//       square: Returns if the current matrix is a square matrix.
//       add: Adds a given matrix into the current matrix, returning the sum.
//       subtract: Subtracts a given matrix into the current matrix, returning the difference.
//       minor: Returns the minor of the current matrix.
//       determinant: Returns the terminant of the current matrix.
//       tranpose: Returns a matrix with the rows and columns exchanged.
//       substitute: Returns a matrix which has a given column
//                   exchanged with a column of the current matrix.
//       concatenate: Creates a matrix which has another matrix attached to it.
//       split: Creates a new matrix starting at a given column.
//********************************************************************************

class Matrix implements Cloneable
{
    protected double[] [] element;
    protected int rows;
    protected int cols;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 3, 2015
    //Purpose: A constructor that initializes the empty matrix, given no parameters.
    //Input: None.
    //Output: An empty matrix.
    //********************************************************************************

    public Matrix ()
    {
	this.element = new double [0] [0];
	this.rows = 0;
	this.cols = 0;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 3, 2015
    //Purpose: A constructor that initializes a square matrix, given one parameter.
    //Input: A parameter, representing the n-square size.
    //Output: A square matrix.
    //********************************************************************************

    public Matrix (int squareSize)
    {
	this ();
	if (squareSize > 0)
	{
	    this.element = new double [squareSize] [squareSize];
	    this.rows = squareSize;
	    this.cols = squareSize;
	    for (int intRow = 0 ; intRow < squareSize ; intRow++)
	    {
		for (int intCol = 0 ; intCol < squareSize ; intCol++)
		    this.element [intRow] [intCol] = 0;
	    }
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 3, 2015
    //Purpose: A constructor that initializes a empty mxn matrix, given two parameters.
    //Input: A row parameter for the number of rows, and an col parameter for the number of columns.
    //Output: An empty rectangular matrix, of size mxn.
    //********************************************************************************

    public Matrix (int intRow, int intCol)
    {
	this ();
	if (intRow > 0 && intCol > 0)
	{
	    this.element = new double [intRow] [intCol];
	    this.rows = intRow;
	    this.cols = intCol;
	    for (int rowCount = 0 ; rowCount < intRow ; rowCount++)
	    {
		for (int colCount = 0 ; colCount < intCol ; colCount++)
		    this.element [rowCount] [colCount] = 0;
	    }
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 3, 2015
    //Purpose: A constructor that initializes a mxn matrix, initilized to the given p.
    //Input: A row parameter for the number of rows, col parameter for the number of columns,
    //       and value parameter for each of their values.
    //Output: An rectangular matrix of size mxn, initialized to p.
    //********************************************************************************

    public Matrix (int intRow, int intCol, double value)
    {
	this ();
	if (intRow > 0 && intCol > 0)
	{
	    this.element = new double [intRow] [intCol];
	    this.rows = intRow;
	    this.cols = intCol;
	    for (int rowCount = 0 ; rowCount < intRow ; rowCount++)
	    {
		for (int colCount = 0 ; colCount < intCol ; colCount++)
		    this.element [rowCount] [colCount] = value;
	    }
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 7, 2015
    //Purpose: Clones the matrix.
    //Input: None.
    //Output: A deep copy of the matrix.
    //********************************************************************************

    public Object clone () throws CloneNotSupportedException
    {
	Matrix newObject = (Matrix) super.clone ();
	newObject.element = (double[] []) this.element.clone ();
	for (int rowCount = 0 ; rowCount < this.rows ; rowCount++)
	{
	    newObject.element [rowCount] = (double[]) this.element [rowCount].clone ();
	}
	return newObject;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 7, 2015
    //Purpose: Gets the matrix from the user.
    //Input: The console to obtain the matrix from.
    //Output: A matrix, with the properties defined by the user.
    //********************************************************************************

    public void get (Console c)
    {
	c.print ("Please enter the amount of rows for your matrix: ");
	int rows = c.readInt ();

	while (rows < 0)
	{
	    c.print ("Your rows are invalid. Please enter a positive integer: ");
	    rows = c.readInt ();
	}
	c.print ("Now, enter the amount of columns you want for your matrix: ");
	int columns = c.readInt ();

	while (columns < 0)
	{
	    c.print ("Your columns are invalid. Please enter a positive integer: ");
	    columns = c.readInt ();
	}
	this.rows = rows;
	this.cols = columns;
	if (rows == 0 || columns == 0)
	{
	    rows = 0;
	    columns = 0;
	}
	this.element = new double [rows] [cols];

	for (rows = 0 ; rows < this.rows ; rows++)
	{
	    for (columns = 0 ; columns < this.cols ; columns++)
	    {
		c.print ("Please enter a value for the matrix at row " + (rows + 1)
			+ " and column " + (columns + 1) + ": ");
		this.element [rows] [columns] = c.readDouble ();
		while (Math.abs (this.element [rows] [columns]) >= 1000)
		{
		    c.print ("The magnitude of your number is too large. Please enter a number less than 1000: ");
		    this.element [rows] [columns] = c.readDouble ();
		}
	    }
	}
	c.println ();
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 3, 2015
    //Purpose: Prints the matrix, given a console, startingScreenRow, and startingScreenColumn.
    //Input: A console to be printed on, and a startingRow and startingColumn to print the matrix.
    //Output: An accurate representation of the matrix, on the console.
    //********************************************************************************

    public void print (Console c, int startRow, int startCol)
    {
	c.setCursor (startRow, startCol);
	double currentElement = 0;
	if (this.rows == 0 || this.cols == 0)
	    c.println ("[]");
	else
	{
	    for (int rowCount = 0 ; rowCount < this.rows ; rowCount++)
	    {
		for (int colCount = 0 ; colCount < this.cols ; colCount++)
		{
		    currentElement = this.element [rowCount] [colCount];
		    while (Math.abs (currentElement) >= 1000)
			currentElement = currentElement / 10;
		    c.print (currentElement, 9, 2);
		}
		c.setCursor (startRow + 1 + rowCount, startCol);
	    }
	}
	c.setCursor (c.getRow () + 1, 1);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 4, 2015
    //Purpose: Gets the matrix from a file, and comverts it into a class.
    //Input: A TextInputFile, representing the file to be read from.
    //Output: A matrix with the properties of the file.
    //********************************************************************************

    public void getFromFile (TextInputFile input)
    {
	StringTokenizer inputEdit;
	int currentRow = 0;
	int currentColumn = 0;
	while (!input.eof ())
	{
	    inputEdit = new StringTokenizer (input.readLine ());
	    if (currentRow == 0)
	    {
		int totalRows = Integer.parseInt (inputEdit.nextToken ());
		int totalCols = Integer.parseInt (inputEdit.nextToken ());
		this.element = new double [totalRows] [totalCols];
		this.rows = totalRows;
		this.cols = totalCols;
	    }
	    else
	    {
		for (currentColumn = 0 ; currentColumn < this.cols ; currentColumn++)
		    this.element [currentRow - 1] [currentColumn] = Double.parseDouble (inputEdit.nextToken ());
	    }
	    currentRow = currentRow + 1;
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 4, 2015
    //Purpose: Calculates the averages of each column of the matrix.
    //Input: None.
    //Output: A 1xcols matrix, that contains the averages of each column.
    //********************************************************************************

    public Matrix columnAverage ()
    {
	Matrix average = new Matrix (1, this.cols);
	int columnCount = 0;
	int rowCount = 0;
	double columnSum = 0;
	for (columnCount = 0 ; columnCount < this.cols ; columnCount++)
	{
	    for (rowCount = 0 ; rowCount < this.rows ; rowCount++)
	    {
		columnSum = columnSum + this.element [rowCount] [columnCount];
	    }
	    average.element [0] [columnCount] = columnSum / rowCount;
	    columnSum = 0;

	}
	return average;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 4, 2015
    //Purpose: Determines if a given matrix is the same size as the current matrix.
    //Input: A matrix to compare size.
    //Output: A boolean representing if the matrix is the same size or not.
    //********************************************************************************

    public boolean sameSize (Matrix inputMatrix)
    {
	boolean isSameSize = false;
	if (this.cols == inputMatrix.cols && this.rows == inputMatrix.rows)
	    isSameSize = true;
	return isSameSize;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 4, 2015
    //Purpose: Determines if the current matrix is square or not.
    //Input: None.
    //Output: A boolean representing if the matrix is square or not.
    //********************************************************************************

    public boolean square ()
    {
	boolean isSquare = false;
	if (this.cols == this.rows)
	    isSquare = true;
	return isSquare;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 4, 2015
    //Purpose: Adds a given matrix to the current matrix.
    //Input: A matrix to be added.
    //Output: A matrix representing the sum of the matrices.
    //********************************************************************************

    public Matrix add (Matrix inputMatrix)
    {
	Matrix sum = new Matrix ();
	if (this.sameSize (inputMatrix))
	{
	    int rowCount = 0;
	    int columnCount = 0;
	    sum = new Matrix (this.rows, this.cols);
	    for (rowCount = 0 ; rowCount < this.rows ; rowCount++)
	    {
		for (columnCount = 0 ; columnCount < this.cols ; columnCount++)
		{
		    sum.element [rowCount] [columnCount] = this.element [rowCount] [columnCount]
			+ inputMatrix.element [rowCount] [columnCount];
		}

	    }
	}
	return sum;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 4, 2015
    //Purpose: Subtracts a given matrix from the current matrix.
    //Input: A matrix to be subtracted.
    //Output: A matrix representing the difference of the matrices.
    //********************************************************************************

    public Matrix subtract (Matrix inputMatrix)
    {
	Matrix difference = new Matrix ();
	if (this.sameSize (inputMatrix))
	{
	    int rowCount = 0;
	    int columnCount = 0;
	    difference = new Matrix (this.rows, this.cols);
	    for (rowCount = 0 ; rowCount < this.rows ; rowCount++)
	    {
		for (columnCount = 0 ; columnCount < this.cols ; columnCount++)
		{
		    difference.element [rowCount] [columnCount] = this.element [rowCount] [columnCount]
			- inputMatrix.element [rowCount] [columnCount];
		}

	    }
	}
	return difference;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 4, 2015
    //Purpose: Returns the minor of the current matrix.
    //Input: The row and column to be removed.
    //Output: A matrix with the given row and column removed, if possible.
    //********************************************************************************

    public Matrix minor (int inputRow, int inputColumn)
    {
	Matrix currentMinor = new Matrix ();
	if (!(inputRow > this.rows) || (inputColumn > this.cols) || (inputRow < 1) || (inputColumn < 1))
	{
	    currentMinor = new Matrix (this.rows - 1, this.cols - 1);
	    int currentRow = 0;
	    int currentColumn = 0;
	    for (currentRow = 0 ; currentRow < this.rows ; currentRow++)
	    {
		if (currentRow + 1 < inputRow)
		{
		    for (currentColumn = 0 ; currentColumn < this.cols ; currentColumn++)
		    {
			if (currentColumn + 1 < inputColumn)
			{
			    currentMinor.element [currentRow] [currentColumn] = this.element [currentRow] [currentColumn];
			}
			else if (currentColumn + 1 > inputColumn)
			{
			    currentMinor.element [currentRow] [currentColumn - 1] = this.element [currentRow] [currentColumn];
			}
		    }
		}
		else if (currentRow + 1 > inputRow)
		{
		    for (currentColumn = 0 ; currentColumn < this.cols ; currentColumn++)
		    {
			if (currentColumn + 1 < inputColumn)
			{
			    currentMinor.element [currentRow - 1] [currentColumn] = this.element [currentRow] [currentColumn];
			}
			else if (currentColumn + 1 > inputColumn)
			{
			    currentMinor.element [currentRow - 1] [currentColumn - 1] = this.element [currentRow] [currentColumn];
			}

		    }
		}
	    }
	}
	return currentMinor;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 7, 2015
    //Purpose: Returns the determinant of the current matrix.
    //Input: None.
    //Output: The determinant of the current matrix.
    //********************************************************************************

    public double determinant ()
    {
	double determinant = 0;
	int s = 1;
	int columnCount = 0;
	if (this.square ())
	{
	    if (this.rows == 2)
	    {
		determinant = (this.element [0] [0] * this.element [1] [1]) - (this.element [0] [1] * this.element [1] [0]);
	    }
	    else if (this.rows > 2)
	    {
		for (columnCount = 0 ; columnCount < this.cols ; columnCount++)
		{
		    determinant = determinant + (s * this.element [0] [columnCount] * this.minor (1, (columnCount + 1)).determinant ());
		    s = s * -1;
		}
	    }
	    else if (this.rows == 1)
	    {
		determinant = this.element [0] [0];
	    }
	}
	return determinant;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 7, 2015
    //Purpose: Returns the transpose of the current matrix.
    //Input: None.
    //Output: A matrix, representing the nxm of the current mxn matrix.
    //********************************************************************************

    public Matrix transpose ()
    {
	Matrix transposed = new Matrix (this.cols, this.rows);
	int rowCount = 0;
	int colCount = 0;
	for (rowCount = 0 ; rowCount < transposed.rows ; rowCount++)
	{
	    for (colCount = 0 ; colCount < transposed.cols ; colCount++)
	    {
		transposed.element [rowCount] [colCount] = this.element [colCount] [rowCount];
	    }

	}
	return transposed;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 7, 2015
    //Purpose: Returns a matrix, with a column replaced from the current one.
    //Input: A matrix with only one column, and the column to be replaced.
    //Output: A matrix, with one of the columns replaced.
    //********************************************************************************

    public Matrix substitute (Matrix matrixColumn, int intCol)
    {
	Matrix substituted = new Matrix (this.rows, this.cols);
	int rowCount = 0;
	int colCount = 0;
	intCol = intCol - 1;
	for (rowCount = 0 ; rowCount < this.rows ; rowCount++)
	{
	    for (colCount = 0 ; colCount < this.cols ; colCount++)
	    {
		substituted.element [rowCount] [colCount] = this.element [rowCount] [colCount];
	    }
	}
	if ((matrixColumn.cols == 1) && (intCol > 0) && (intCol < this.cols))
	{
	    for (rowCount = 0 ; rowCount < substituted.rows ; rowCount++)
	    {
		substituted.element [rowCount] [intCol] = matrixColumn.element [rowCount] [0];
	    }
	}
	return substituted;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 7, 2015
    //Purpose: Returns a matrix, with the given matrix attached to the current matrix.
    //Input: A matrix to be attached.
    //Output: A concatenated matrix.
    //********************************************************************************

    public Matrix concatenate (Matrix attachedMatrix) throws CloneNotSupportedException
    {
	Matrix concatenated = new Matrix (this.rows, this.cols);
	concatenated = (Matrix) this.clone ();
	int rowCount = 0;
	int colCount = 0;
	int attachedColCount = 0;

	if (attachedMatrix.rows == this.rows)
	{
	    concatenated = new Matrix (this.rows, this.cols + attachedMatrix.cols);
	    for (rowCount = 0 ; rowCount < this.rows ; rowCount++)
	    {
		for (colCount = 0 ; colCount < this.cols ; colCount++)
		{
		    concatenated.element [rowCount] [colCount] = this.element [rowCount] [colCount];
		}

		for (colCount = colCount ; colCount < concatenated.cols ; colCount++)
		{
		    concatenated.element [rowCount] [colCount] = attachedMatrix.element [rowCount] [attachedColCount];
		    attachedColCount = attachedColCount + 1;
		}
		attachedColCount = 0;
	    }
	}
	return concatenated;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 7, 2015
    //Purpose: Returns the current matrix starting at a given column.
    //Input: The column in which the new matrix begins.
    //Output: A matrix, which is the previous matrix split at the given column.
    //********************************************************************************

    public Matrix split (int splitCol)
    {
	Matrix splitted = new Matrix ();
	int rowCount = 0;
	int colCount = 0;
	if (splitCol > 0 && splitCol < this.cols)
	{
	    splitted = new Matrix (this.rows, this.cols - splitCol);
	    for (rowCount = 0 ; rowCount < this.rows ; rowCount++)
	    {
		for (colCount = 0 ; colCount < splitted.cols ; colCount++)
		{
		    splitted.element [rowCount] [colCount] = this.element [rowCount] [colCount + splitCol];
		}
	    }
	}
	return splitted;
    }
}
