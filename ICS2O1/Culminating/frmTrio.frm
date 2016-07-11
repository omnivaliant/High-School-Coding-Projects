VERSION 5.00
Begin VB.Form frmTrio 
   BackColor       =   &H00FFFF80&
   Caption         =   "Trio"
   ClientHeight    =   8970
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7560
   LinkTopic       =   "Form1"
   ScaleHeight     =   598
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   504
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H00C0FFFF&
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   4800
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   7680
      Width           =   2655
   End
   Begin VB.CommandButton cmdReset 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      Caption         =   "Reset!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   4800
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   6480
      Width           =   2655
   End
   Begin VB.Frame fraFirst 
      BackColor       =   &H00C0FFFF&
      Caption         =   "Which player will go first?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2655
      Left            =   4800
      TabIndex        =   1
      Top             =   1080
      Width           =   2655
      Begin VB.OptionButton optComputer 
         BackColor       =   &H00C0FFFF&
         Caption         =   "Computer"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   435
         Left            =   120
         TabIndex        =   3
         Top             =   1440
         Width           =   2175
      End
      Begin VB.OptionButton optPlayer 
         BackColor       =   &H00C0FFFF&
         Caption         =   "Player"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000D&
         Height          =   375
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   1935
      End
      Begin VB.Image imgGooglePlusLogo 
         Height          =   495
         Left            =   600
         Picture         =   "frmTrio.frx":0000
         Stretch         =   -1  'True
         Top             =   2040
         Width           =   615
      End
      Begin VB.Image imgFacebookLogo 
         Height          =   495
         Left            =   600
         Picture         =   "frmTrio.frx":1634
         Stretch         =   -1  'True
         Top             =   840
         Width           =   615
      End
   End
   Begin VB.PictureBox picGame 
      Appearance      =   0  'Flat
      BackColor       =   &H0080FF80&
      ForeColor       =   &H80000008&
      Height          =   8985
      Left            =   0
      ScaleHeight     =   597
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   310
      TabIndex        =   0
      Top             =   0
      Width           =   4680
      Begin VB.Label lblComputerScore 
         Alignment       =   2  'Center
         BackColor       =   &H8000000B&
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   2280
         TabIndex        =   9
         Top             =   8160
         Width           =   255
      End
      Begin VB.Label lblUserScore 
         Alignment       =   2  'Center
         BackColor       =   &H8000000B&
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   3960
         TabIndex        =   8
         Top             =   4680
         Width           =   255
      End
      Begin VB.Label lblComputer 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Computer"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   7
         Top             =   8160
         Width           =   1935
      End
      Begin VB.Label lblUser 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "User"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2880
         TabIndex        =   6
         Top             =   4680
         Width           =   1095
      End
      Begin VB.Line lneBottomBorder 
         X1              =   0
         X2              =   300
         Y1              =   300
         Y2              =   300
      End
      Begin VB.Line lneRightBorder 
         X1              =   300
         X2              =   300
         Y1              =   0
         Y2              =   300
      End
      Begin VB.Image imgComputer3 
         Height          =   1485
         Left            =   3000
         Picture         =   "frmTrio.frx":2008
         Stretch         =   -1  'True
         Top             =   6720
         Width           =   1485
      End
      Begin VB.Image imgComputer2 
         Height          =   1485
         Left            =   1560
         Picture         =   "frmTrio.frx":363C
         Stretch         =   -1  'True
         Top             =   6720
         Width           =   1485
      End
      Begin VB.Image imgComputer1 
         Height          =   1485
         Left            =   75
         Picture         =   "frmTrio.frx":4C70
         Stretch         =   -1  'True
         Top             =   6720
         Width           =   1485
      End
      Begin VB.Image imgUser3 
         DragMode        =   1  'Automatic
         Height          =   1485
         Left            =   3045
         Picture         =   "frmTrio.frx":62A4
         Stretch         =   -1  'True
         Top             =   5040
         Width           =   1485
      End
      Begin VB.Image imgUser2 
         DragMode        =   1  'Automatic
         Height          =   1485
         Left            =   1560
         Picture         =   "frmTrio.frx":6C78
         Stretch         =   -1  'True
         Top             =   5040
         Width           =   1485
      End
      Begin VB.Image imgUser1 
         DragMode        =   1  'Automatic
         Height          =   1485
         Left            =   75
         Picture         =   "frmTrio.frx":764C
         Stretch         =   -1  'True
         Top             =   5040
         Width           =   1485
      End
      Begin VB.Line lneY2 
         X1              =   0
         X2              =   300
         Y1              =   200
         Y2              =   200
      End
      Begin VB.Line lneY1 
         X1              =   0
         X2              =   300
         Y1              =   100
         Y2              =   100
      End
      Begin VB.Line lneX2 
         X1              =   200
         X2              =   200
         Y1              =   0
         Y2              =   300
      End
      Begin VB.Line lneX1 
         X1              =   100
         X2              =   100
         Y1              =   0
         Y2              =   300
      End
      Begin VB.Line lneMarkerDivider 
         BorderColor     =   &H80000005&
         BorderWidth     =   2
         X1              =   0
         X2              =   308
         Y1              =   443
         Y2              =   443
      End
      Begin VB.Shape shpMarkerBorder 
         BackColor       =   &H0000C000&
         BackStyle       =   1  'Opaque
         FillColor       =   &H00FFFFFF&
         Height          =   3900
         Left            =   0
         Shape           =   4  'Rounded Rectangle
         Top             =   4680
         Width           =   4620
      End
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFF80&
      Caption         =   "Trio"
      BeginProperty Font 
         Name            =   "Algerian"
         Size            =   30
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4800
      TabIndex        =   11
      Top             =   120
      Width           =   2655
   End
   Begin VB.Label lblWinningDisplay 
      BackColor       =   &H0000FFFF&
      Caption         =   "Please select the player to go first to get started!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      Left            =   4800
      TabIndex        =   5
      Top             =   3840
      Width           =   2655
   End
End
Attribute VB_Name = "frmTrio"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Authors: Mohit and Ming
'Date: June 2 2014
'Purpose: To create a game similar to Tic Tac Toe, called Trio.
Option Explicit
'Global Variables
Dim intUser1 As Integer
Dim intUser2 As Integer
Dim intUser3 As Integer
Dim intComp1 As Integer
Dim intComp2 As Integer
Dim intComp3 As Integer
'Score Tracker
Dim intUserScore As Integer
Dim intComputerScore As Integer

Private Sub cmdExit_Click()
    'Purpose: To exit the game when requested.
    End
End Sub

Private Sub cmdReset_Click()
    'Purpose: To clear the game board to be ready for the next playthough.
    lblWinningDisplay.Caption = "Please select the player to go first to get started!"
    optPlayer.Value = False
    optComputer.Value = False
    fraFirst.Enabled = True
    'Resets variables
    intUser1 = -94
    intUser2 = -95
    intUser3 = -96
    intComp1 = -97
    intComp2 = -98
    intComp3 = -99
    'Resets images to proper coordinates.
    imgUser1.Top = 336
    imgUser1.Left = 5
    imgUser2.Top = 336
    imgUser2.Left = 104
    imgUser3.Top = 336
    imgUser3.Left = 203
    imgComputer1.Top = 448
    imgComputer1.Left = 5
    imgComputer2.Top = 448
    imgComputer2.Left = 104
    imgComputer3.Top = 448
    imgComputer3.Left = 203
    'Disables ability to drag picture until user decides who goes first.
    imgUser1.DragMode = 0
    imgUser2.DragMode = 0
    imgUser3.DragMode = 0
End Sub
Private Sub Form_Activate()
    'Randomizes any random numbers used.
    Randomize
    'Initializes global variables
    intUser1 = -94
    intUser2 = -95
    intUser3 = -96
    intComp1 = -97
    intComp2 = -98
    intComp3 = -99
    intUserScore = 0
    intComputerScore = 0
    'Ensures no user can drag their pieces until they decide who goes first.
    imgUser1.DragMode = 0
    imgUser2.DragMode = 0
    imgUser3.DragMode = 0
    'Prompts user to decide who goes first.
    lblWinningDisplay.Caption = "Please select the player to go first to get started!"
End Sub
Public Function IsSquareAvailable(intSquare As Integer) As Boolean
    'Purpose: To decide if the square is available or not.
    'Parameters: The square being checked, by either the user or the computer.
    If (intSquare = intUser1 Or intSquare = intUser2 Or intSquare = intUser3 Or _
        intSquare = intComp1 Or intSquare = intComp2 Or intSquare = intComp3) Or intSquare < 0 Or intSquare > 9 Then
        IsSquareAvailable = False
    Else
        IsSquareAvailable = True
    End If
End Function
Public Function Convertxy(x As Single, Y As Single)
    'Purpose: To take the users dragged image, and decides the magic square location of the image.
    'It also prevents the user from dragging the image outside the playing board.
    'Parameters: The x and y coordinates of the dragged image.
    If x > 300 Or Y > 300 Then
    Else
        If x <= 100 And Y <= 100 Then
            Convertxy = 8
        ElseIf x > 100 And x <= 200 And Y <= 100 Then
            Convertxy = 1
        ElseIf x > 200 And x <= 300 And Y <= 100 Then
            Convertxy = 6
        ElseIf x <= 100 And Y > 100 And Y <= 200 Then
            Convertxy = 3
        ElseIf x > 100 And x <= 200 And Y > 100 And Y <= 200 Then
            Convertxy = 5
        ElseIf x > 200 And x <= 300 And Y > 100 And Y <= 200 Then
            Convertxy = 7
        ElseIf x < 100 And Y > 200 And Y <= 300 Then
            Convertxy = 4
        ElseIf x > 100 And x <= 200 And Y > 200 And Y <= 300 Then
            Convertxy = 9
        ElseIf x > 200 And x <= 300 And Y > 200 And Y <= 300 Then
            Convertxy = 2
        End If
    End If
End Function
Public Sub putImage(intSquare As Integer, x As Control)
    'Purpose: To actually move the image the user requested onto its proper magic square location.
    'Parameters: The magic square location, and the coordinates of the object being moved.
    If intSquare = 8 Or intSquare = 1 Or intSquare = 6 Then
        x.Top = 1
    ElseIf intSquare = 3 Or intSquare = 5 Or intSquare = 7 Then
        x.Top = 101
    ElseIf intSquare > 1 Then
        x.Top = 201
    End If
    
    If intSquare = 8 Or intSquare = 3 Or intSquare = 4 Then
        x.Left = 1
    ElseIf intSquare = 1 Or intSquare = 5 Or intSquare = 9 Then
        x.Left = 101
    ElseIf intSquare > 1 Then
        x.Left = 201
    End If
End Sub
Public Function IsGameOver() As Boolean
    'Purpose: To decide if the game is over or not.
    'Parameters: Uses the sum of global variables.
    If intUser1 + intUser2 + intUser3 = 15 _
    Or intComp1 + intComp2 + intComp3 = 15 Then
        IsGameOver = True
    Else
        IsGameOver = False
    End If
End Function

Private Sub optComputer_Click()
    'Allows the player to move their piece, after moving the computers piece first.
    fraFirst.Enabled = False
    picGame.Enabled = True
    MoveComputer
    imgUser1.DragMode = 1
    imgUser2.DragMode = 1
    imgUser3.DragMode = 1
    lblWinningDisplay.Caption = "Now, continue to move your Facebook pieces until someone wins!"
End Sub

Private Sub optPlayer_Click()
    'Allows the player to move their piece.
    fraFirst.Enabled = False
    picGame.Enabled = True
    imgUser1.DragMode = 1
    imgUser2.DragMode = 1
    imgUser3.DragMode = 1
    lblWinningDisplay.Caption = "Now, continue to move your Facebook pieces until someone wins!"
End Sub

Private Sub picGame_DragDrop(Source As Control, x As Single, Y As Single)
    'Purpose: To allow the user to move their image, and completes the game if it is finished.
    'Parameters: The object being moved, and the x and y coordinates of the placed object.
    Dim intSquare As Integer
    'Finds out magic square number of the placed object.
    intSquare = Convertxy(x, Y)
    If x > 300 Or Y > 300 Or (IsSquareAvailable(intSquare) = False) Then
    Else
        'Places image
        putImage intSquare, Source
        'Changes global variable according to the moved object.
        If Source = imgUser1 Then
            intUser1 = intSquare
        ElseIf Source = imgUser2 Then
            intUser2 = intSquare
        ElseIf Source = imgUser3 Then
            intUser3 = intSquare
        End If
    End If
    'Decides if the game is over, and declares the winner if so.
    If intSquare = 0 Then
    Else
        If IsGameOver() And intUser1 + intUser2 + intUser3 = 15 Then
            lblWinningDisplay.ForeColor = &H8000000D
            lblWinningDisplay.Caption = "The user has won!"
            'Disables further movement.
            imgUser1.DragMode = 0
            imgUser2.DragMode = 0
            imgUser3.DragMode = 0
            'Increases the users score.
            intUserScore = intUserScore + 1
            lblUserScore.Caption = intUserScore
        Else
            'Moves the computer, since the user did not win after their turn.
            MoveComputer
            If IsGameOver() And intComp1 + intComp2 + intComp3 = 15 Then
                lblWinningDisplay.ForeColor = &HFF&
                lblWinningDisplay.Caption = "The computer has won!"
                'Disables further gameplay.
                imgUser1.DragMode = 0
                imgUser2.DragMode = 0
                imgUser3.DragMode = 0
                'Increases the computers score.
                intComputerScore = intComputerScore + 1
                lblComputerScore.Caption = intComputerScore
            End If
        End If
    End If
End Sub
Public Sub MoveComputer()
    'Purpose: To move the computers piece, by finding an available square,
    'getting a marker, and moving it.
    doMove FindSquare(), getMarker()
End Sub
Public Function FindSquare()
    'Purpose: To find the most logical square to move to.
    'This does so by the following order of AI:
    'Seeing if it can win; if not, then
    'Preventing the user from winning.
    'If neither of the two options are available, the computer moves to a random location.
    Dim intSquare As Integer
    FindSquare = 0
    intSquare = 15 - (intComp1 + intComp2)
    
    'Attempts to play offensively to score the win.
    If intComp1 + intComp2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp1 + intComp2)
    ElseIf intComp2 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp2 + intComp3)
    ElseIf intComp1 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp1 + intComp3)
    End If
    
    intSquare = 15 - (intComp2 + intComp3)
    If intComp2 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp2 + intComp3)
    ElseIf intComp1 + intComp2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp1 + intComp2)
    ElseIf intComp1 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp1 + intComp3)
    End If
    
    intSquare = 15 - (intComp1 + intComp3)
    If intComp1 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp1 + intComp3)
    ElseIf intComp2 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp2 + intComp3)
    ElseIf intComp1 + intComp2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
        FindSquare = 15 - (intComp1 + intComp2)
    End If
    
    'If unable to win, prevents the user from winning.
    If FindSquare = 0 Then
        intSquare = 15 - (intUser1 + intUser2)
        If intUser1 + intUser2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser1 + intUser2)
        ElseIf intUser2 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser2 + intUser3)
        ElseIf intUser1 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser1 + intUser3)
        End If
        intSquare = 15 - (intUser2 + intUser3)
        If intUser2 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser2 + intUser3)
        ElseIf intUser1 + intUser2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser1 + intUser2)
        ElseIf intUser1 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser1 + intUser3)
        End If
        intSquare = 15 - (intUser1 + intUser3)
        If intUser1 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser1 + intUser3)
        ElseIf intUser2 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser2 + intUser3)
        ElseIf intUser1 + intUser2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            FindSquare = 15 - (intUser1 + intUser2)
        End If
    End If
    'If computer is unable to win and user is unable to win, computer moves to a random valid location.
    If FindSquare = 0 Then
        Do
            intSquare = Int(Rnd * 9) + 1
        Loop While IsSquareAvailable(intSquare) = False
        FindSquare = intSquare
    End If
End Function

Public Function getMarker()
    'Purpose: To get an appropriate piece to move as the computer.
    'This piece of code is very similar to the FindRandomSquare code; it only replaces the magic
    'square number with the ideal marker to use in that scenario.
    Dim intSquare As Integer
    Dim intMarker As Integer
    getMarker = 0
    'Ensures that the three pieces are placed on the playing field.
    If intComp1 < 0 Then
        getMarker = 1
    ElseIf intComp2 < 0 Then
        getMarker = 2
    ElseIf intComp3 < 0 Then
        getMarker = 3
    Else
        'Plays the correct offensive marker.
        intSquare = 15 - (intComp1 + intComp2)
        If intComp1 + intComp2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 3
        ElseIf intComp2 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 1
        ElseIf intComp1 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 2
        End If
        
        intSquare = 15 - (intComp2 + intComp3)
        If intComp2 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 1
        ElseIf intComp1 + intComp2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 3
        ElseIf intComp1 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 2
        End If
        
        intSquare = 15 - (intComp1 + intComp3)
        If intComp1 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 2
        ElseIf intComp2 + intComp3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 1
        ElseIf intComp1 + intComp2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 3
        End If
        
        'If offense does not work, then it tries to play defensive.
        intSquare = 15 - (intUser1 + intUser2)
        If intUser1 + intUser2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 3
        ElseIf intUser2 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 1
        ElseIf intUser1 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 2
        End If
        
        intSquare = 15 - (intUser2 + intUser3)
        If intUser2 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 1
        ElseIf intUser1 + intUser2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 3
        ElseIf intUser1 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 2
        End If
        
        intSquare = 15 - (intUser1 + intUser3)
        If intUser1 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 2
        ElseIf intUser2 + intUser3 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 1
        ElseIf intUser1 + intUser2 + intSquare = 15 And IsSquareAvailable(intSquare) = True Then
            getMarker = 3
        End If
        
    End If
    'If neither option is available, it looks for a random marker to use.
    If getMarker = 0 Then
            getMarker = Int(Rnd * 3) + 1
    End If
End Function
Public Sub doMove(intSquare As Integer, intMarker As Integer)
    'Purpose: To associate the correct marker with the correct image, and allows the
    'computers image to be moved.
    'Parameters: The magic square number of the computers piece, and the piece to be moved.
    If intMarker = 1 Then
        intComp1 = intSquare
        putImage intSquare, imgComputer1
    ElseIf intMarker = 2 Then
        intComp2 = intSquare
        putImage intSquare, imgComputer2
    ElseIf intMarker = 3 Then
        intComp3 = intSquare
        putImage intSquare, imgComputer3
    End If
End Sub
