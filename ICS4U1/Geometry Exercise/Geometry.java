//********************************************************************************
//Author: Mohit Patel
//Date: November 3, 2015
//Purpose: To create various geometric shapes, demonstrating inheritance.
//         The hierarchy of shapes is as follows:
//
//         Shape
//              D2Shape
//                      Circle
//                      Square
//                      Triangle
//                      Pentagon
//              D3Shape
//                      Sphere
//                      Cube
//                      Tetrahedron
//                      Octahedron
//                      Cylinder
//                      Cone
//********************************************************************************

import java.awt.*;
import java.lang.*;
import hsa.Console;

public class Geometry
{
    static Console c;

    public static void main (String[] args)
    {
	c = new Console (30, 70, "A Geometry Hierarchy of Classes");
	Shape test;
	int count = 0;
	int shapeCount = 0;
	char shapeType = ' ';
	Shape currentShape = new Circle ();
	Shape[] shapeArray = new Shape [0];
	char again = 'y';
	char moreShapes = 'y';

	while (again == 'y')
	{
	    while (moreShapes == 'y')
	    {
		c.println ("Shape # " + (shapeCount + 1));
		c.println ();
		c.println ("Press '2' for a 2D shape, or '3' for a 3D shape.");
		shapeType = c.getChar ();

		while (!(shapeType == '2' || shapeType == '3'))
		{
		    shapeType = c.getChar ();
		}

		if (shapeType == '2')
		{
		    c.println ("You have chosen: 2D shape.");
		    c.println ();
		    c.println ("Press 'c' for a circle, 's' for a square, 't' for a triangle, or 'p' for a pentagon.");
		    shapeType = c.getChar ();

		    while (!(shapeType == 'c' || shapeType == 's' || shapeType == 't' || shapeType == 'p'))
		    {
			shapeType = c.getChar ();
		    }

		    if (shapeType == 'c')
		    {
			currentShape = new Circle ();
			c.println ("You have chosen: Circle.");
		    }
		    else if (shapeType == 's')
		    {
			currentShape = new Square ();
			c.println ("You have chosen: Square.");
		    }
		    else if (shapeType == 't')
		    {
			currentShape = new Triangle ();
			c.println ("You have chosen: Triangle.");
		    }
		    else if (shapeType == 'p')
		    {
			currentShape = new Pentagon ();
			c.println ("You have chosen: Pentagon.");
		    }
		}
		else if (shapeType == '3')
		{
		    c.println ("You have chosen: 3D shape.");
		    c.println ();
		    c.println ("Press 's' for a sphere, 'c' for a cube, 't' for a tetrahedron, 'o' for an octahedron, " +
			    "'y' for a cylinder, or 'n' for a cone ");
		    shapeType = c.getChar ();

		    while (!(shapeType == 's' || shapeType == 'c' || shapeType == 't' || shapeType == 'o' || shapeType == 'y' || shapeType == 'n'))
		    {
			shapeType = c.getChar ();
		    }

		    if (shapeType == 's')
		    {
			currentShape = new Sphere ();
			c.println ("You have chosen: Sphere.");
		    }
		    else if (shapeType == 'c')
		    {
			currentShape = new Cube ();
			c.println ("You have chosen: Cube.");
		    }
		    else if (shapeType == 't')
		    {
			currentShape = new Tetrahedron ();
			c.println ("You have chosen: Tetrahedron.");
		    }
		    else if (shapeType == 'o')
		    {
			currentShape = new Octahedron ();
			c.println ("You have chosen: Octahedron.");
		    }
		    else if (shapeType == 'y')
		    {
			currentShape = new Cylinder ();
			c.println ("You have chosen: Cylinder.");
		    }
		    else if (shapeType == 'n')
		    {
			currentShape = new Cone ();
			c.println ("You have chosen: Cone.");
		    }
		}
		c.println ();
		currentShape.get (c);
		c.println ();
		Shape[] tempArray = new Shape [shapeArray.length + 1];

		for (count = 0 ; count < shapeArray.length ; count++)
		    tempArray [count] = shapeArray [count];

		tempArray [count] = currentShape;
		shapeArray = tempArray;
		shapeCount = shapeCount + 1;
		shapeType = ' ';
		c.println ("Would you like to create more shapes? Press 'y' to continue, or any other key to finish.");
		moreShapes = c.getChar ();
		c.clear ();
	    }
	    moreShapes = 'y';
	    c.println ("Your shapes will now be displayed in order, along with all of their properties.");
	    c.println ("Press any key to continue.");
	    c.getChar ();
	    c.clear ();

	    for (count = 1 ; count <= shapeCount ; count++)
	    {
		c.println ("Shape # " + count);
		c.println ();
		shapeArray [count - 1].put (c);
		c.println ();
		c.println ("Press any key to move to the next available shape.");
		c.getChar ();
		c.println ();
	    }
	    c.clear ();
	    c.println ("You have finished your database of " + (count - 1) + " shape(s)!");
	    c.println ();
	    c.println ("Would you like to create a new shape database? Press 'y' to continue, or any other key to exit.");
	    again = c.getChar ();
	    count = 0;
	    shapeCount = 0;
	    shapeType = ' ';
	    shapeArray = new Shape [0];
	    c.clear ();
	}
	c.close ();
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 11, 2015
//Purpose: To create a Shape class, which is the abstract base class of all other classes in this program.
//Inherited fields: None.
//Unique fields:
//       colour: A string representing the colour of the shape.
//Inherited methods: None.
//Unique methods:
//       constructor: To initialize the Shape with a red colour.
//       get: An abstract method that will have subclasses obtain appropriate values from the user.
//       put: An abstract method that will have subclasses print out the properties of their class.
//********************************************************************************

abstract class Shape
{
    protected String colour;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A constructor that defaults the shape to a colour of red.
    //Input: None.
    //Output: A shape with a colour of red.
    //********************************************************************************

    public Shape ()
    {
	this.colour = "red";
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: An abstract method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A shape with the values given from the user.
    //********************************************************************************

    abstract public void get (Console c);

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: An abstract method that will output information to the user.
    //Input: The console to output the information to.
    //Output: Information about the specific shape, such as its name and its perimeter and area.
    //********************************************************************************

    abstract public void put (Console c);

}

//********************************************************************************
//Author: Mohit Patel
//Date: November 11, 2015
//Purpose: To create a D2shape class, which is the subclass of Shape.
//Inherited fields: colour.
//Unique fields:
//       size: The magnification of the D2 shape.
//Inherited methods: get, put.
//Unique methods:
//       constructor: To initialize the D2 shape with a size, along with Shape data elements.
//       perimeter: A method that will calculate the perimeter of the D2 shape.
//       area: A method that will calculate the area of the D2 shape.
//********************************************************************************

abstract class D2shape extends Shape
{
    protected double size;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A constructor that defaults the magnification and colour of the D2 shape.
    //Input: None.
    //Output: A D2 shape with a magnification of 1 and a colour of red.
    //********************************************************************************

    public D2shape ()
    {
	super ();
	this.size = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: An abstract method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A shape with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	c.print ("Please enter the colour of the shape: ");
	this.colour = c.readString ();
	c.print ("Please enter the size of the shape: ");
	this.size = c.readDouble ();

	while (this.size <= 0)
	{
	    c.print ("Your size is invalid. Please enter a positive value: ");
	    this.size = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: Information about the specific shape, such as its name and its perimeter and area.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The colour is: " + this.colour + ".");
	c.println ("The size is: " + this.size + ".");
	c.println ("The perimeter is: " + this.perimeter () + " units.");
	c.println ("The area is: " + this.area () + " units squared.");
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: An abstract method that will calculate the perimeter of the D2 shape.
    //Input: None.
    //Output: A double representing the perimeter of the shape.
    //********************************************************************************

    abstract public double perimeter ();

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: An abstract method that will calculate the area of the D2 shape.
    //Input: None.
    //Output: A double representing the area of the shape.
    //********************************************************************************

    abstract public double area ();

}

//********************************************************************************
//Author: Mohit Patel
//Date: November 11, 2015
//Purpose: To create a D3shape class, which is the subclass of Shape.
//Inherited fields: colour.
//Unique fields:
//       size: The magnification of the D3 shape.
//Inherited methods: get, put.
//Unique methods:
//       constructor: To initialize the D3 shape with a size, along with Shape data elements.
//       sArea: A method that will calculate the surface area of the D3 shape.
//       volume: A method that will calculate the volume of the D3 shape.
//********************************************************************************

abstract class D3shape extends Shape
{
    protected double size;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A constructor that defaults the magnification and colour of the D3 shape.
    //Input: None.
    //Output: A D3 shape with a magnification of 1 and a colour of red.
    //********************************************************************************

    public D3shape ()
    {
	super ();
	this.size = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A shape with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	c.print ("Please enter the colour of the shape: ");
	this.colour = c.readString ();
	c.print ("Please enter the size of the shape: ");
	this.size = c.readDouble ();
	while (this.size <= 0)
	{
	    c.print ("Your size is invalid. Please enter a positive value: ");
	    this.size = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: Information about the specific shape.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The colour is: " + this.colour + ".");
	c.println ("The size is: " + this.size + ".");
	c.println ("The surface area is: " + this.sArea () + " units squared.");
	c.println ("The volume is: " + this.volume () + " units cubed.");
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: An abstract method that will calculate the surface area of the D3 shape.
    //Input: None.
    //Output: A double representing the surface area of the shape.
    //********************************************************************************

    abstract public double sArea ();

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: An abstract method that will calculate the volume of the D3 shape.
    //Input: None.
    //Output: A double representing the volume of the shape.
    //********************************************************************************

    abstract public double volume ();

}

//********************************************************************************
//Author: Mohit Patel
//Date: November 12, 2015
//Purpose: To create a Circle class, which is the subclass of D2 shape.
//Inherited fields: colour, size.
//Unique fields:
//       radius: The radius of the circle.
//       PI: The math constant pi used for calculations.
//Inherited methods: get, put, perimeter, area.
//Unique methods:
//       constructor: To initialize the circle with a colour, size, and radius of 1.
//********************************************************************************

class Circle extends D2shape
{
    protected double radius;
    protected static final double PI = Math.PI;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the circle with a radius of one, along with D2 properties.
    //Input: None.
    //Output: A default circle with a radius of 1.
    //********************************************************************************

    public Circle ()
    {
	super ();
	this.radius = 1;

    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A circle with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the radius of the circle: ");
	this.radius = c.readDouble ();
	while (this.radius <= 0)
	{
	    c.print ("Your radius is invalid. Please enter a positive value: ");
	    this.radius = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the circle, along with the perimeter and area.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Circle.");
	c.println ("The radius is: " + this.radius + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the perimeter of the circle.
    //Input: None.
    //Output: A double representing the perimeter of the circle.
    //********************************************************************************

    public double perimeter ()
    {
	return 2 * Circle.PI * this.radius;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the area of the circle.
    //Input: None.
    //Output: A double representing the area of the circle.
    //********************************************************************************

    public double area ()
    {
	return Circle.PI * this.radius * this.radius;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 12, 2015
//Purpose: To create a Square class, which is the subclass of D2 shape.
//Inherited fields: colour, size.
//Unique fields:
//       length: The side length of the circle.
//Inherited methods: get, put, perimeter, area.
//Unique methods:
//       constructor: To initialize the square with a colour, size, and length of 1.
//********************************************************************************

class Square extends D2shape
{
    protected double length;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the square with a length of one, along with D2 properties.
    //Input: None.
    //Output: A default square with a length of 1.
    //********************************************************************************

    public Square ()
    {
	super ();
	this.length = 1;

    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A square with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the side length of the square: ");
	this.length = c.readDouble ();
	while (this.length <= 0)
	{
	    c.print ("Your length is invalid. Please enter a positive value: ");
	    this.length = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the square, along with the perimeter and area.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Square.");
	c.println ("The length is: " + this.length + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the perimeter of the square.
    //Input: None.
    //Output: A double representing the perimeter of the square.
    //********************************************************************************

    public double perimeter ()
    {
	return 4 * this.length;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the area of the square.
    //Input: None.
    //Output: A double representing the area of the square.
    //********************************************************************************

    public double area ()
    {
	return this.length * this.length;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 12, 2015
//Purpose: To create a Triangle class, which is the subclass of D2 shape.
//Inherited fields: colour, size.
//Unique fields:
//       sideA: The first side length of the triangle.
//       sideB: The second side length of the triangle.
//       sideC: The third side length of the triangle.
//Inherited methods: get, put, perimeter, area.
//Unique methods:
//       constructor: To initialize the triangle with a colour, size, and side lengths of 1.
//********************************************************************************

class Triangle extends D2shape
{
    protected double sideA;
    protected double sideB;
    protected double sideC;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the triangle with a length of one, along with D2 properties.
    //Input: None.
    //Output: A default triangle with side lengths of 1.
    //********************************************************************************

    public Triangle ()
    {
	super ();
	this.sideA = 1;
	this.sideB = 1;
	this.sideC = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A triangle with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	do
	{
	    c.print ("Please enter the first side length of the triangle: ");
	    this.sideA = c.readDouble ();

	    while (this.sideA <= 0)
	    {
		c.print ("Your first side length is invalid. Please enter a positive value: ");
		this.sideA = c.readDouble ();
	    }
	    c.print ("Please enter the second side length of the triangle: ");
	    this.sideB = c.readDouble ();

	    while (this.sideB <= 0)
	    {
		c.print ("Your second side length is invalid. Please enter a positive value: ");
		this.sideB = c.readDouble ();
	    }
	    c.print ("Please enter the third side length of the triangle: ");
	    this.sideC = c.readDouble ();

	    while (this.sideC <= 0)
	    {
		c.print ("Your third side length is invalid. Please enter a positive value: ");
		this.sideC = c.readDouble ();
	    }

	    if (this.sideA + this.sideB <= this.sideC || this.sideA + this.sideC <= this.sideB
		    || this.sideB + this.sideC <= this.sideA)
	    {
		c.println ("Your triangle is invalid. Ensure that any two side lengths added together " +
			"are larger than the third side.");
	    }
	}
	while (this.sideA + this.sideB <= this.sideC || this.sideA + this.sideC <= this.sideB
		|| this.sideB + this.sideC <= this.sideA);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the triangle, along with the perimeter and area.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Triangle.");
	c.println ("The first side length is: " + this.sideA + " units.");
	c.println ("The second side length is: " + this.sideB + " units.");
	c.println ("The third side length is: " + this.sideC + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the perimeter of the triangle.
    //Input: None.
    //Output: A double representing the perimeter of the triangle.
    //********************************************************************************

    public double perimeter ()
    {
	return this.sideA + this.sideB + this.sideC;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the area of the triangle.
    //Input: None.
    //Output: A double representing the area of the triangle.
    //********************************************************************************

    public double area ()
    {
	double semiP = (this.sideA + this.sideB + this.sideC) / 2.0;
	return Math.sqrt (semiP * (semiP - this.sideA) * (semiP - this.sideB) * (semiP - this.sideC));
    }
}


//********************************************************************************
//Author: Mohit Patel
//Date: November 12, 2015
//Purpose: To create a Pentagon class, which is the subclass of D2 shape.
//Inherited fields: colour, size.
//Unique fields:
//       length: The side length of the pentagon.
//Inherited methods: get, put, perimeter, area.
//Unique methods:
//       constructor: To initialize the pentagon with a colour, size, and length of 1.
//********************************************************************************

class Pentagon extends D2shape
{
    protected double length;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the pentagon with a length of one, along with D2 properties.
    //Input: None.
    //Output: A default pentagon with a length of 1.
    //********************************************************************************

    public Pentagon ()
    {
	super ();
	this.length = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A pentagon with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the side length of the regular pentagon: ");
	this.length = c.readDouble ();
	while (this.length <= 0)
	{
	    c.print ("Your length is invalid. Please enter a positive value: ");
	    this.length = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the pentagon, along with the perimeter and area.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Regular Pentagon.");
	c.println ("The length is: " + this.length + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the perimeter of the pentagon.
    //Input: None.
    //Output: A double representing the perimeter of the pentagon.
    //********************************************************************************

    public double perimeter ()
    {
	return this.length * 5;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the area of the pentagon.
    //Input: None.
    //Output: A double representing the area of the pentagon.
    //********************************************************************************

    public double area ()
    {
	return 0.25 * Math.sqrt (5 * (5 + 2 * Math.sqrt (5))) * this.length * this.length;
    }
}


//********************************************************************************
//Author: Mohit Patel
//Date: November 12, 2015
//Purpose: To create a Sphere class, which is the subclass of D3 shape.
//Inherited fields: colour, size.
//Unique fields:
//       radius: The radius of the sphere.
//       PI: The math constant pi used for calculations.
//Inherited methods: get, put, sArea, volume.
//Unique methods:
//       constructor: To initialize the sphere with a colour, size, and radius of 1.
//********************************************************************************

class Sphere extends D3shape
{
    protected double radius;
    protected static final double PI = Math.PI;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the sphere with a radius of one, along with D3 properties.
    //Input: None.
    //Output: A default sphere with a radius of 1.
    //********************************************************************************

    public Sphere ()
    {
	super ();
	this.radius = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A sphere with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the radius of the sphere: ");
	this.radius = c.readDouble ();
	while (this.radius <= 0)
	{
	    c.print ("Your radius is invalid. Please enter a positive value: ");
	    this.radius = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the sphere, along with the surface area and volume.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Sphere.");
	c.println ("The radius is: " + this.radius + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the surface area of the sphere.
    //Input: None.
    //Output: A double representing the surface area of the sphere.
    //********************************************************************************

    public double sArea ()
    {
	return 4 * Sphere.PI * this.radius * this.radius;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the volume of the sphere.
    //Input: None.
    //Output: A double representing the volume of the sphere.
    //********************************************************************************

    public double volume ()
    {
	return 4.0 / 3.0 * Sphere.PI * this.radius * this.radius * this.radius;
    }
}


//********************************************************************************
//Author: Mohit Patel
//Date: November 12, 2015
//Purpose: To create a Cube class, which is the subclass of D3 shape.
//Inherited fields: colour, size.
//Unique fields:
//       length: The side length of the cube.
//Inherited methods: get, put, sArea, volume.
//Unique methods:
//       constructor: To initialize the cube with a colour, size, and length of 1.
//********************************************************************************

class Cube extends D3shape
{
    protected double length;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the cube with a length of one, along with D3 properties.
    //Input: None.
    //Output: A default cube with a length of 1.
    //********************************************************************************

    public Cube ()
    {
	super ();
	this.length = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A cube with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the length of the cube: ");
	this.length = c.readDouble ();

	while (this.length <= 0)
	{
	    c.print ("Your length is invalid. Please enter a positive value: ");
	    this.length = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the cube, along with the surface area and volume.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Cube.");
	c.println ("The length is: " + this.length + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the surface area of the cube.
    //Input: None.
    //Output: A double representing the surface area of the cube.
    //********************************************************************************

    public double sArea ()
    {
	return 6.0 * this.length * this.length;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the volume of the cube.
    //Input: None.
    //Output: A double representing the volume of the cube.
    //********************************************************************************

    public double volume ()
    {
	return this.length * this.length * this.length;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 12, 2015
//Purpose: To create a Tetrahedron class, which is the subclass of D3 shape.
//Inherited fields: colour, size.
//Unique fields:
//       length: The side length of the tetrahedron.
//Inherited methods: get, put, sArea, volume.
//Unique methods:
//       constructor: To initialize the tetrahedron with a colour, size, and length of 1.
//********************************************************************************

class Tetrahedron extends D3shape
{
    protected double length;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the tetrahedron with a length of one, along with D3 properties.
    //Input: None.
    //Output: A default tetrahedron with a length of 1.
    //********************************************************************************

    public Tetrahedron ()
    {
	super ();
	this.length = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A tetrahedron with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the length of the tetrahedron: ");
	this.length = c.readDouble ();
	while (this.length <= 0)
	{
	    c.print ("Your length is invalid. Please enter a positive value: ");
	    this.length = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the tetrahedron, along with the surface area and volume.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Regular Tetrahedron.");
	c.println ("The length is: " + this.length + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the surface area of the tetrahedron.
    //Input: None.
    //Output: A double representing the surface area of the tetrahedron.
    //********************************************************************************

    public double sArea ()
    {
	return Math.sqrt (3) * this.length * this.length;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the volume of the tetrahedron.
    //Input: None.
    //Output: A double representing the volume of the tetrahedron.
    //********************************************************************************

    public double volume ()
    {
	return this.length * this.length * this.length / (6.0 * Math.sqrt (2.0));
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 12, 2015
//Purpose: To create an Octahedron class, which is the subclass of D3 shape.
//Inherited fields: colour, size.
//Unique fields:
//       length: The side length of the octahedron.
//Inherited methods: get, put, sArea, volume.
//Unique methods:
//       constructor: To initialize the octahedron with a colour, size, and length of 1.
//********************************************************************************

class Octahedron extends D3shape
{
    protected double length;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the octahedron with a length of one, along with D3 properties.
    //Input: None.
    //Output: A default octahedron with a length of 1.
    //********************************************************************************

    public Octahedron ()
    {
	super ();
	this.length = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: An octahedron with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the length of the octahedron: ");
	this.length = c.readDouble ();

	while (this.length <= 0)
	{
	    c.print ("Your length is invalid. Please enter a positive value: ");
	    this.length = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the octahedron, along with the surface area and volume.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Regular Octahedron.");
	c.println ("The length is: " + this.length + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the surface area of the octahedron.
    //Input: None.
    //Output: A double representing the surface area of the octahedron.
    //********************************************************************************

    public double sArea ()
    {
	return 2 * Math.sqrt (3) * this.length * this.length;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the volume of the octahedron.
    //Input: None.
    //Output: A double representing the volume of the octahedron.
    //********************************************************************************

    public double volume ()
    {
	return this.length * this.length * this.length * Math.sqrt (2.0) / (3.0);
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 19, 2015
//Purpose: To create a Cylinder class, which is the subclass of D3 shape.
//Inherited fields: colour, size.
//Unique fields:
//       radius: The radius of the cylinder.
//       height: The height of the cylinder.
//       PI: The math constant pi used for calculations.
//Inherited methods: get, put, sArea, volume.
//Unique methods:
//       constructor: To initialize the cylinder with a colour, size, radius, and height of 1.
//********************************************************************************

class Cylinder extends D3shape
{
    protected double radius;
    protected double height;
    protected static final double PI = Math.PI;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the cylinder with a radius and height of one, along with D2 properties.
    //Input: None.
    //Output: A default cylinder with a radius and height of 1.
    //********************************************************************************

    public Cylinder ()
    {
	super ();
	this.radius = 1;
	this.height = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A cylinder with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the radius of the cylinder: ");
	this.radius = c.readDouble ();

	while (this.radius <= 0)
	{
	    c.print ("Your radius is invalid. Please enter a positive value: ");
	    this.radius = c.readDouble ();
	}

	c.print ("Please enter the height of the cylinder: ");
	this.height = c.readDouble ();

	while (this.height <= 0)
	{
	    c.print ("Your height is invalid. Please enter a positive value: ");
	    this.height = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the cylinder, along with the surface area and volume.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Cylinder.");
	c.println ("The radius is: " + this.radius + " units.");
	c.println ("The height is: " + this.height + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the surface area of the cylinder.
    //Input: None.
    //Output: A double representing the surface area of the cylinder.
    //********************************************************************************

    public double sArea ()
    {
	return 2 * Cylinder.PI * this.radius * (this.height + this.radius);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the volume of the cylinder.
    //Input: None.
    //Output: A double representing the volume of the cylinder.
    //********************************************************************************

    public double volume ()
    {
	return Cylinder.PI * this.radius * this.radius * this.height;
    }
}

//********************************************************************************
//Author: Mohit Patel
//Date: November 19, 2015
//Purpose: To create a Cone class, which is the subclass of D3 shape.
//Inherited fields: colour, size.
//Unique fields:
//       radius: The radius of the cone.
//       height: The height of the cone.
//       PI: The math constant pi used for calculations.
//Inherited methods: get, put, sArea, volume.
//Unique methods:
//       constructor: To initialize the cone with a colour, size, radius, and height of 1.
//********************************************************************************

class Cone extends D3shape
{
    protected double radius;
    protected double height;
    protected static final double PI = Math.PI;

    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A constructor that defaults the cone with a radius and height of one, along with D2 properties.
    //Input: None.
    //Output: A default cone with a radius and height of 1.
    //********************************************************************************

    public Cone ()
    {
	super ();
	this.radius = 1;
	this.height = 1;
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will get values from the user.
    //Input: The console to obtain the information from.
    //Output: A cone with the values given from the user.
    //********************************************************************************

    public void get (Console c)
    {
	super.get (c);
	c.print ("Please enter the radius of the cone: ");
	this.radius = c.readDouble ();

	while (this.radius <= 0)
	{
	    c.print ("Your radius is invalid. Please enter a positive value: ");
	    this.radius = c.readDouble ();
	}

	c.print ("Please enter the height of the cone: ");
	this.height = c.readDouble ();

	while (this.height <= 0)
	{
	    c.print ("Your height is invalid. Please enter a positive value: ");
	    this.height = c.readDouble ();
	}
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 12, 2015
    //Purpose: A method that will output information to the user.
    //Input: The console to output the information to.
    //Output: All the properties of the cone, along with the surface area and volume.
    //********************************************************************************

    public void put (Console c)
    {
	c.println ("The shape is: Cone.");
	c.println ("The radius is: " + this.radius + " units.");
	c.println ("The height is: " + this.height + " units.");
	super.put (c);
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the surface area of the cone.
    //Input: None.
    //Output: A double representing the surface area of the cone.
    //********************************************************************************

    public double sArea ()
    {
	return Cone.PI * this.radius * (this.radius +
		Math.sqrt (this.height * this.height + this.radius * this.radius));
    }


    //********************************************************************************
    //Author: Mohit Patel
    //Date: November 11, 2015
    //Purpose: A method that will calculate the volume of the cone.
    //Input: None.
    //Output: A double representing the volume of the cone.
    //********************************************************************************

    public double volume ()
    {
	return 1.0 / 3.0 * Cone.PI * this.radius * this.radius * this.height;
    }
}
