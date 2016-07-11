//********************************************************************************
//Author: Mohit Patel
//Date: January 11, 2016
//Purpose: To create a functional binary search tree.
//********************************************************************************

import hsa.*;
import java.util.*;

class BinarySearchTreeTest
{
    static Console c = new Console (40, 80, "Binary Search Tree");

    public static void main (String[] args)
    {
	BinarySearchTree inputTree = new BinarySearchTree ();
	boolean deleted = false;
	char action = 'y';
	int input = 0;
	int output = 0;
	Node sibling = new Node ();
	c.println ("Welcome to the Binary Search Tree!");
	c.println ();
	while (action != '9')
	{
	    c.println ("Press 1 to insert an integer;\n2 for the tree as a traversal;" +
		    "\n3 for the height and number of nodes of tree;\n4 for if the tree is perfectly balanced " +
		    "and height balanced;\n5 for the level of an integer;\n6 for the sibling of a given integer;" +
		    "\n7 for the breadth first order;\n8 to delete a node; or \n9 to exit.");
	    do
		action = c.getChar ();
	    while (!(action == '1' || action == '2' || action == '3' || action == '4' || action == '5'
			|| action == '6' || action == '7' || action == '8' || action == '9'));
	    c.println ();
	    if (action == '1')
	    {
		c.print ("Please enter an integer to be inserted: ");
		input = c.readInt ();
		inputTree.add (input);
		c.clear();
		c.println (input + " has been inserted.");
	    }
	    else if (action == '2')
	    {
		action = '!';
		c.println ("Press 1 for pre-order traversal, 2 for post-order traversal, or 3 for in-order traversal.");
		do
		    action = c.getChar ();
		while (!(action == '1' || action == '2' || action == '3'));

		c.clear ();

		if (action == '1')
		    c.println ("Pre-order: " + inputTree.preOrder ());
		else if (action == '2')
		    c.println ("Post-order: " + inputTree.postOrder ());
		else if (action == '3')
		    c.println ("In-order: " + inputTree.inOrder ());
	    }
	    else if (action == '3')
	    {
		c.clear();
		c.println ("Height: " + inputTree.height ());
		c.println ("Nodes: " + inputTree.nodes ());
	    }
	    else if (action == '4')
	    {
		c.clear();
		if (inputTree.perfectlyBalanced ())
		    c.println ("It is perfectly balanced!");
		else
		    c.println ("It is not perfectly balanced.");

		if (inputTree.heightBalanced ())
		    c.println ("It is height balanced!");
		else
		    c.println ("It is not height balanced.");
	    }
	    else if (action == '5')
	    {
		c.print ("Please enter an integer to find the level of: ");
		input = c.readInt ();
		output = inputTree.getLevel (input);
		c.clear();
		if (output == -1)
		    c.println (input + " was not found.");
		else
		    c.println (input + "'s level is: " + output + ".");
	    }
	    else if (action == '6')
	    {
		c.print ("Please enter an integer to find it's sibling: ");
		input = c.readInt ();
		sibling = inputTree.findSibling (input);
		c.clear();
		if (sibling == null)
		    c.println (input + "'s sibling was not found.");
		else
		    c.println ("The sibling  of " + input + " was found, with the data of " + sibling.data + ".");
	    }
	    else if (action == '7')
	    {
		c.clear();
		c.println ("Breadth first order: " + inputTree.breadthFirstOrder () + ".");
	    }
	    else if (action == '8')
	    {
		c.print ("Please enter an integer to be deleted: ");
		input = c.readInt ();
		deleted = inputTree.delete (input);
		c.clear();
		if (deleted)
		    c.println (input + " was deleted.");
		else
		    c.println (input + " was not deleted.");
	    }
	    c.println ();
	    inputTree.printTree (c);
	    c.println ();
	}
	c.close ();
    }
}

//Class Node
//Fields:   int data    -   the information held by the Node
//          Node right  -   the next node to the right of the tree
//          Node left   -   the next node to the left of the tree

class Node
{
    public int data;
    public Node left;
    public Node right;

    public Node (int info)
    {
	this.data = info;
	this.left = null;
	this.right = null;
    }


    public Node ()
    {
	this (0);
    }
}
//Class QNode
//Fields:   Node data   -   the information held by the QNode
//          QNode next  -   the next node in the list
class QNode
{
    public Node data;
    public QNode next;

    public QNode (Node info)
    {
	this.data = info;
	this.next = null;
    }


    public QNode ()
    {
	this (null);
    }
}

//Class Queue
//Fields:   QNode front -   the front of the queue
//          QNode back  -   the back of the queue
//Methods:  add     -   adds a given node to the Queue
//          remove  -   removes a node at the front and returns removed node
//          empty   -   returns true if queue is empty
class Queue
{
    public QNode front;
    public QNode back;

    public Queue ()
    {
	this.front = null;
	this.back = null;
    }


    //add
    //Purpose:      adds a node at the end of the queue
    //Parameters:   Node x   -   the node being added
    //Output:       None
    public void add (Node x)
    {
	if (this.isEmpty ())
	{
	    this.front = new QNode (x);
	    this.back = this.front;
	}
	else
	{
	    this.back.next = new QNode (x);
	    this.back = this.back.next;
	}
    }


    //remove
    //Purpose:      removes a node at the front of the queue
    //Parameters:   None
    //Output:       the node that was removed
    public Node remove ()
    {
	Node ans;

	ans = this.front.data;
	this.front = this.front.next;
	return ans;
    }


    //isEmpty
    //Purpose:      returns true if array is empty
    //Parameters:   None
    //Output:       true or false
    public boolean isEmpty ()
    {
	boolean status = false;
	if (this.front == null)
	    status = true;
	return status;
    }
}

//Class BinarySearchTree
//Fields:   Node root           -   the root of the tree
//Methods:  add                 -   adds a leaf to the tree with given info
//          find                -   returns the node with the given information
//          printTree           -   recursively prints the entire tree, calling rPrintTree
//          rprintTree          -   recursively prints the tree.
//          preOrder            -   traverses through the tree recursively, going to root, then left, then right.
//          rpreOrder           -   the recursive traversal algorithm called for pre order.
//          postOrder           -   traverses through the tree recursively, going to left, right, then root.
//          rpostOrder          -   the recursive traversal algorithm called for post order.
//          inOrder             -   traverses through the tree recursively, going to left, root, then right.
//          rinOrder            -   the recursive traversal algothim called for in order.
//          height              -   returns the height of the tree
//          rheight             -   recursively finds the height of the tree
//          nodes               -   returns the number of nodes in the tree
//          rnodes              -   recursively finds the amount of nodes in the tree
//          perfectlyBalanced   -   returns if the entire tree is perfectly balanced
//          rperfectlyBalanced  -   recursively finds out if the entire tree is perfectly balanced
//          heightBalanced      -   returns if the entire tree is height balanced
//          rheightBalanced     -   recursively finds out of the entire tree is height balanced
//          getLevel            -   returns the level of a given integer
//          findBefore          -   returns the parent of a given int's node.
//          findSibling         -   returns the node of a  given int's sibling.
//          breadthFirstOrder   -   Creates a string of the entire tree, level by level.
//          delete              -   removes a node from an existing tree.

class BinarySearchTree
{
    protected Node root;

    public BinarySearchTree ()
    {
	root = null;
    }


    //add
    //Purpose:      adds a leaf to the tree
    //Parameters:   int x   -   the info of the leaf being added
    //Output:       true or false
    public boolean add (int info)
    {

	if (this.root == null)
	    this.root = new Node (info);
	else
	{
	    Node ptr = this.root;
	    while (ptr != null)
	    {
		if (info < ptr.data)
		    if (ptr.left != null)
			ptr = ptr.left;
		    else
		    {
			ptr.left = new Node (info);
			return true;
		    }
		else if (info > ptr.data)
		    if (ptr.right != null)
			ptr = ptr.right;
		    else
		    {
			ptr.right = new Node (info);
			return true;
		    }
		else if (info == ptr.data)
		{
		    return false;
		}
	    }
	}
	return true;
    }


    //find
    //Purpose:      finds the node with the given information
    //Parameters:   int x   -   the info of the node that is being looked for
    //Output:       returns the node with the given information
    public Node find (int x)
    {
	Node ptr;
	ptr = this.root;
	while (ptr != null && ptr.data != x)
	    if (x < ptr.data)
		ptr = ptr.left;
	    else
		ptr = ptr.right;
	return ptr;
    }


    /************************************************
    Method:printTree
    Purpose:Prints the tree in a normal way.
	(Can't handle super wide trees.)
	-  Developed by Jonathan Chan, May 1997
	-  Java version by Edmund Wong, Dec 2000
	-  Modified by Ian Halliday, June 2001
    Parameters: The Console
    Return Value: None
    *************************************************/
    public void printTree (Console c)
    {
	c.setCursor
	    (rprintTree (c, root, c.getRow ()), 1);
    }


    /************************************************
    Method: rprintTree
    Purpose: See above.
    Parameters: the console, the node being printed
		and the row to print on
    Return Value: The maximum row reached by
		  printing (allowing for useful
		  cursor placement)
    *************************************************/
    protected int rprintTree (Console c, Node n, int r)
    {
	int maxRow;
	if (n != null)
	{
	    maxRow = rprintTree (c, n.left, r + 2);
	    c.setCursor (r, c.getColumn ());
	    c.print (n.data, 3);
	    maxRow = Math.max (maxRow, rprintTree (c, n.right, r + 2));
	    return maxRow;
	}
	return r - 1;
    }


    /************************************************
    Method: preOrder
    Purpose: Prints the tree as the string, starting with the root,
	     and then the left and right subtrees.
    Parameters: None.
    Return Value: A String representing the tree in pre-order.
    *************************************************/

    public String preOrder ()
    {
	String output = "";
	output = this.rpreOrder ("", this.root);
	return output;
    }


    /************************************************
    Method: rpreOrder
    Purpose: Recursively prints the tree as a string, using pre-order.
    Parameters: The current string to modify, and the current node.
    Return Value: A String representing the tree in pre-order.
    *************************************************/

    protected String rpreOrder (String inputString, Node currentNode)
    {
	if (currentNode != null)
	{
	    inputString = inputString + currentNode.data + " ";
	    if (currentNode.left != null)
		inputString = this.rpreOrder (inputString, currentNode.left);
	    if (currentNode.right != null)
		inputString = this.rpreOrder (inputString, currentNode.right);
	}
	return inputString;
    }


    /************************************************
    Method: postOrder
    Purpose: Prints the tree as the string, starting with the left,
	     right subtrees, and then root.
    Parameters: None.
    Return Value: A String representing the tree in post-order.
    *************************************************/

    public String postOrder ()
    {
	String output = "";
	output = this.rpostOrder ("", this.root);
	return output;
    }


    /************************************************
    Method: rpostOrder
    Purpose: Recursively prints the tree as a string, using pre-order.
    Parameters: The current string to modify, and the current node.
    Return Value: A String representing the tree in post-order.
    *************************************************/

    protected String rpostOrder (String inputString, Node currentNode)
    {
	if (currentNode != null)
	{
	    if (currentNode.left != null)
		inputString = this.rpostOrder (inputString, currentNode.left);
	    if (currentNode.right != null)
		inputString = this.rpostOrder (inputString, currentNode.right);
	    inputString = inputString + currentNode.data + " ";
	}
	return inputString;
    }


    /************************************************
    Method: inOrder
    Purpose: Prints the tree as the string, starting with the left,
	     root, and then the right subtrees.
    Parameters: None.
    Return Value: A String representing the tree in order.
    *************************************************/

    public String inOrder ()
    {
	String output = "";
	output = this.rinOrder ("", this.root);
	return output;
    }


    /************************************************
    Method: rpostOrder
    Purpose: Recursively prints the tree as a string, using in-order.
    Parameters: The current string to modify, and the current node.
    Return Value: A String representing the tree in order.
    *************************************************/

    protected String rinOrder (String inputString, Node currentNode)
    {
	if (currentNode != null)
	{
	    if (currentNode.left != null)
		inputString = this.rinOrder (inputString, currentNode.left);
	    inputString = inputString + currentNode.data + " ";
	    if (currentNode.right != null)
		inputString = this.rinOrder (inputString, currentNode.right);
	}
	return inputString;
    }


    /************************************************
    Method: height
    Purpose: Returns the height of the tree, calling rheight.
    Parameters: None.
    Return Value: The height of the tree.
    *************************************************/

    public int height ()
    {
	int output = 0;
	if (this.root != null)
	    output = this.rheight (1, this.root);
	return output;
    }


    /************************************************
    Method: height
    Purpose: Returns the height of the tree, being called recursively.
    Parameters: The height of the previous tree.
    Return Value: The height of the entire tree.
    *************************************************/

    protected int rheight (int currentHeight, Node currentNode)
    {
	if (!(currentNode.left == null && currentNode.right == null))
	{
	    int leftHeight = 0;
	    if (currentNode.left != null)
		leftHeight = rheight (currentHeight + 1, currentNode.left);
	    int rightHeight = 0;
	    if (currentNode.right != null)
		rightHeight = rheight (currentHeight + 1, currentNode.right);
	    if (leftHeight > rightHeight)
		currentHeight = leftHeight;
	    else
		currentHeight = rightHeight;
	}


	return currentHeight;
    }


    /************************************************
    Method: nodes()
    Purpose: Returns the amount of node in the tree.
    Parameters: None.
    Return Value: The number of nodes in the tree.
    *************************************************/

    public int nodes ()
    {
	int output = 0;
	if (this.root != null)
	    output = this.rnodes (this.root);
	return output;
    }


    /************************************************
    Method: rnodes
    Purpose: Recursively returns the amount of nodes in the tree.
    Parameters: The current node.
    Return Value: The number of nodes in the current subtree.
    *************************************************/

    protected int rnodes (Node currentNode)
    {
	int outputNodes = 1;
	if (!(currentNode.left == null && currentNode.right == null))
	{
	    int leftNodes = 0;
	    if (currentNode.left != null)
		leftNodes = this.rnodes (currentNode.left);
	    int rightNodes = 0;
	    if (currentNode.right != null)
		rightNodes = this.rnodes (currentNode.right);
	    outputNodes = 1 + leftNodes + rightNodes;
	}
	return outputNodes;
    }


    /************************************************
    Method: perfectlyBalanced
    Purpose: Returns if the tree is perfectly balanced or not.
    Parameters: None.
    Return Value: A boolean representing if the tree is perfectly balanced or not.
    *************************************************/

    public boolean perfectlyBalanced ()
    {
	boolean output = true;
	if (this.root != null)
	    output = this.rperfectlyBalanced (this.root);
	return output;
    }


    /************************************************
    Method: rperfecltyBalanced
    Purpose: Recursively determines if the tree is perfectly balanced or not.
    Parameters: The current node.
    Return Value: A boolean representing if the tree is perfectly balanced or not.
    *************************************************/

    protected boolean rperfectlyBalanced (Node currentNode)
    {
	boolean output = true;
	if (!(currentNode.left == null && currentNode.right == null))
	{
	    BinarySearchTree leftTree = new BinarySearchTree ();
	    leftTree.root = currentNode.left;
	    BinarySearchTree rightTree = new BinarySearchTree ();
	    rightTree.root = currentNode.right;

	    if (leftTree.root == null)
	    {
		if (rightTree.nodes () > 1)
		    output = false;
		else
		    output = this.rperfectlyBalanced (rightTree.root);
	    }
	    else if (rightTree.root == null)
	    {
		if (leftTree.nodes () > 1)
		    output = false;
		else
		    output = this.rperfectlyBalanced (leftTree.root);
	    }
	    else
	    {
		if (Math.abs (leftTree.nodes () - rightTree.nodes ()) > 1)
		    output = false;
		else
		{
		    output = this.rperfectlyBalanced (leftTree.root) && this.rperfectlyBalanced (rightTree.root);
		}
	    }
	}
	return output;
    }


    /************************************************
    Method: heightBalanced
    Purpose: Returns if the tree is height balanced or not.
    Parameters: None.
    Return Value: A boolean representing if the tree is height balanced or not.
    *************************************************/

    public boolean heightBalanced ()
    {
	boolean output = true;
	if (this.root != null)
	    output = this.rheightBalanced (this.root);
	return output;
    }


    /************************************************
    Method: rheightBalanced
    Purpose: Recursively determines if the tree is height balanced or not.
    Parameters: The current node.
    Return Value: If the current tree is height balanced or not.
    *************************************************/

    protected boolean rheightBalanced (Node currentNode)
    {
	boolean output = true;
	if (!(currentNode.left == null && currentNode.right == null))
	{
	    BinarySearchTree leftTree = new BinarySearchTree ();
	    leftTree.root = currentNode.left;
	    BinarySearchTree rightTree = new BinarySearchTree ();
	    rightTree.root = currentNode.right;

	    if (leftTree.root == null)
	    {
		if (rightTree.height () > 1)
		    output = false;
		else
		    output = this.rheightBalanced (rightTree.root);
	    }
	    else if (rightTree.root == null)
	    {
		if (leftTree.height () > 1)
		    output = false;
		else
		    output = this.rheightBalanced (leftTree.root);
	    }
	    else
	    {
		if (Math.abs (leftTree.height () - rightTree.height ()) > 1)
		    output = false;
		else
		    output = this.rheightBalanced (leftTree.root) && this.rheightBalanced (rightTree.root);
	    }
	}
	return output;
    }


    /************************************************
    Method: getLevel
    Purpose: Returns the level of a given integer, if its found.
    Parameters: The integer to find.
    Return Value: -1 if not found, or the level of the integer.
    *************************************************/

    public int getLevel (int findInt)
    {
	int output = 0;

	if (this.root == null)
	    output = -1;
	else
	{
	    Node currentNode = this.root;
	    boolean found = false;

	    while (currentNode.data != findInt && found == false)
	    {
		if (findInt > currentNode.data && currentNode.right != null)
		    currentNode = currentNode.right;
		else if (findInt < currentNode.data && currentNode.left != null)
		    currentNode = currentNode.left;
		else
		    found = true;
		output = output + 1;
	    }

	    if (found == true)
		output = -1;
	}
	return output;
    }


    /************************************************
    Method: findBefore
    Purpose: Finds the parent above the Node with the given string.
    Parameters: The int to search for.
    Return Value: The parent of the string; null if not found or is the root.
    *************************************************/

    public Node findBefore (int findInt)
    {
	Node output = null;
	boolean found = false;
	if (this.root != null)
	{
	    Node currentNode = this.root;
	    if (currentNode.data != findInt)
	    {
		while (found == false)
		{
		    if (currentNode.left == null)
		    {
			if (currentNode.right != null)
			{
			    if (currentNode.right.data != findInt)
				currentNode = currentNode.right;
			    else
				found = true;
			}
			else
			    found = true;
		    }
		    else if (currentNode.right == null)
		    {
			if (currentNode.left.data != findInt)
			    currentNode = currentNode.left;
			else
			    found = true;
		    }
		    else if (currentNode.right.data == findInt || currentNode.left.data == findInt)
			found = true;
		    else if (findInt > currentNode.data)
			currentNode = currentNode.right;
		    else
			currentNode = currentNode.left;
		}
		
		if (currentNode.right != null)
		{
		    if (currentNode.right.data == findInt)
			output = currentNode;
		}
		
		if (currentNode.left != null)
		{
		    if (currentNode.left.data == findInt)
			output = currentNode;
		}
	    }
	}
	return output;
    }


    /************************************************
    Method: findSibling
    Purpose: Returns the node of a given int's sibling.
    Parameters: The integer's sibling to find.
    Return Value: null if not found, or the sibling's node
    *************************************************/

    public Node findSibling (int findInt)
    {
	Node output = null;
	Node parent = this.findBefore (findInt);
	if (parent != null)
	{
	    if (parent.left != null)
	    {
		if (parent.left.data == findInt)
		    output = parent.right;
		else
		    output = parent.left;
	    }
	    else
		output = parent.left;
	}
	return output;
    }


    /************************************************
    Method: breadthFirstOrder
    Purpose: Creates a string version of the entire tree, level by level, left to right.
    Parameters: None.
    Return Value: The string representing the entire tree.
    *************************************************/

    public String breadthFirstOrder ()
    {
	String output = "";
	if (this.root != null)
	{
	    Queue stringQueue = new Queue ();
	    stringQueue.add (this.root);
	    Node x = new Node ();
	    while (!stringQueue.isEmpty ())
	    {
		x = stringQueue.remove ();
		output = output + " " + x.data;
		if (x.left != null)
		    stringQueue.add (x.left);
		if (x.right != null)
		    stringQueue.add (x.right);
	    }
	}
	return output;
    }


    /************************************************
    Method: delete
    Purpose: Removes a node from an existing tree.
    Parameters: The integer of the node to be deleted.
    Return Value: A boolean representing if a node was deleted or not.
    *************************************************/

    public boolean delete (int deleteInt)
    {
	boolean deleted = false;
	Node parent = this.findBefore (deleteInt);
	if (parent == null)
	{
	    if (this.root != null)
	    {
		if (this.root.data == deleteInt)
		{
		    deleted = true;
		    if (this.root.left == null && this.root.right == null)
			this.root = null;
		    else if (this.root.left == null)
			this.root = this.root.right;
		    else if (this.root.right == null)
			this.root = this.root.left;
		    else
		    {
			Node currentNode = this.root.left;
			if (currentNode.right != null)
			{
			    while (currentNode.right.right != null)
				currentNode = currentNode.right;
			    Node tempPointer = currentNode.right.left;
			    currentNode.right.right = this.root.right;
			    currentNode.right.left = this.root.left;
			    this.root = currentNode.right;
			    currentNode.right = tempPointer;
			}
			else
			{
			    currentNode.right = this.root.right;
			    this.root = currentNode;
			}
		    }
		}
	    }
	}
	else
	{
	    deleted = true;
	    boolean childLeft = true;
	    Node child;

	    if (parent.right != null)
	    {
		if (parent.right.data == deleteInt)
		{
		    child = parent.right;
		    childLeft = false;
		}
		else
		    child = parent.left;
	    }
	    else
		child = parent.left;

	    if (child.left == null && child.right == null)
	    {
		if (childLeft)
		    parent.left = null;
		else
		    parent.right = null;
	    }

	    else if (child.left == null)
	    {
		if (childLeft)
		    parent.left = parent.left.right;
		else
		    parent.right = parent.right.right;
	    }

	    else if (child.right == null)
	    {
		if (childLeft)
		    parent.left = parent.left.left;
		else
		    parent.right = parent.right.left;
	    }

	    else
	    {
		Node currentNode = child.left;
		if (currentNode.right != null)
		{
		    while (currentNode.right.right != null)
			currentNode = currentNode.right;
		    Node tempPointer = currentNode.right.left;
		    currentNode.right.right = child.right;
		    currentNode.right.left = child.left;

		    if (childLeft)
			parent.left = currentNode.right;
		    else
			parent.right = currentNode.right;
		    currentNode.right = tempPointer;
		}
		else
		{
		    currentNode.right = child.right;

		    if (childLeft)
			parent.left = currentNode;
		    else
			parent.right = currentNode;
		}
	    }
	}
	return deleted;
    }
}


