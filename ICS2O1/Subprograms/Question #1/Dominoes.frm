VERSION 5.00
Begin VB.Form frmDominoes 
   Caption         =   "Form1"
   ClientHeight    =   8385
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6600
   LinkTopic       =   "Form1"
   ScaleHeight     =   8385
   ScaleWidth      =   6600
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picDominoes 
      Height          =   6975
      Left            =   120
      ScaleHeight     =   6915
      ScaleWidth      =   6315
      TabIndex        =   1
      Top             =   1320
      Width           =   6375
      Begin VB.Shape shpDominoTwo 
         BorderWidth     =   4
         Height          =   4575
         Left            =   3000
         Shape           =   4  'Rounded Rectangle
         Top             =   840
         Visible         =   0   'False
         Width           =   1815
      End
      Begin VB.Line lneDominoTwo 
         Visible         =   0   'False
         X1              =   3000
         X2              =   4800
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Shape shpDominoOne 
         BorderWidth     =   4
         Height          =   4575
         Left            =   720
         Shape           =   4  'Rounded Rectangle
         Top             =   840
         Visible         =   0   'False
         Width           =   1815
      End
      Begin VB.Shape shp49 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   4320
         Shape           =   3  'Circle
         Top             =   4920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp47 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   3120
         Shape           =   3  'Circle
         Top             =   4920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp45 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   3720
         Shape           =   3  'Circle
         Top             =   4200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp46 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   4320
         Shape           =   3  'Circle
         Top             =   4200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp44 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   3120
         Shape           =   3  'Circle
         Top             =   4200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp43 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   4320
         Shape           =   3  'Circle
         Top             =   3480
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp41 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   3120
         Shape           =   3  'Circle
         Top             =   3480
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp39 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   4320
         Shape           =   3  'Circle
         Top             =   2640
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp37 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   3120
         Shape           =   3  'Circle
         Top             =   2640
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp35 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   3720
         Shape           =   3  'Circle
         Top             =   1920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp36 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   4320
         Shape           =   3  'Circle
         Top             =   1920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp34 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   3120
         Shape           =   3  'Circle
         Top             =   1920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp33 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   4320
         Shape           =   3  'Circle
         Top             =   1200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp31 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   3120
         Shape           =   3  'Circle
         Top             =   1200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp29 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   2040
         Shape           =   3  'Circle
         Top             =   4920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp27 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   840
         Shape           =   3  'Circle
         Top             =   4920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp25 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   1440
         Shape           =   3  'Circle
         Top             =   4200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp26 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   2040
         Shape           =   3  'Circle
         Top             =   4200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp24 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   840
         Shape           =   3  'Circle
         Top             =   4200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp23 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   2040
         Shape           =   3  'Circle
         Top             =   3480
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp21 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   840
         Shape           =   3  'Circle
         Top             =   3480
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp19 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   2040
         Shape           =   3  'Circle
         Top             =   2640
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp17 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   840
         Shape           =   3  'Circle
         Top             =   2640
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp15 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   1440
         Shape           =   3  'Circle
         Top             =   1920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp16 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   2040
         Shape           =   3  'Circle
         Top             =   1920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp14 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   840
         Shape           =   3  'Circle
         Top             =   1920
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp13 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   2040
         Shape           =   3  'Circle
         Top             =   1200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Shape shp11 
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   840
         Shape           =   3  'Circle
         Top             =   1200
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.Line lneDominoOne 
         Visible         =   0   'False
         X1              =   720
         X2              =   2520
         Y1              =   3240
         Y2              =   3240
      End
   End
   Begin VB.CommandButton cmdGenerate 
      Caption         =   "Generate dominoes!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   3135
   End
   Begin VB.Label lblOutput 
      BackColor       =   &H80000009&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   3360
      TabIndex        =   2
      Top             =   0
      Width           =   3135
   End
End
Attribute VB_Name = "frmDominoes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 21 2014
'Purpose: To create dominoes.
Option Explicit
Private Sub cmdGenerate_Click()
'Declaration
Dim intDominoOne As Integer
Dim intOneTop As Integer
Dim intOneBottom As Integer
Dim intDominoTwo As Integer
Dim intTwoTop As Integer
Dim intTwoBottom As Integer
Dim blnCanJoin As Boolean
clearDomino
'Initialization
intDominoOne = 0
intOneTop = 0
intOneBottom = 0
intDominoTwo = 0
intTwoTop = 0
intTwoBottom = 0
blnCanJoin = False
'Process
intDominoOne = getDomino()
intOneTop = leftSide(intDominoOne)
intOneBottom = rightSide(intDominoOne)
intDominoTwo = getDomino()
intTwoTop = leftSide(intDominoTwo)
intTwoBottom = rightSide(intDominoTwo)
blnCanJoin = canJoin(intOneTop, intOneBottom, intTwoTop, intTwoBottom)
'Output
shpDominoOne.Visible = True
lneDominoOne.Visible = True
shpDominoTwo.Visible = True
lneDominoTwo.Visible = True
drawLeftTopDomino (intOneTop)
drawLeftBottomDomino (intOneBottom)
drawRightTopDomino (intTwoTop)
drawRightBottomDomino (intTwoBottom)
If blnCanJoin Then
    lblOutput.Caption = "They match!"
Else:
    lblOutput.Caption = "They don't match!"
End If
End Sub
Public Function getDomino() As Integer
Do:
    getDomino = Int(Rnd * 67)
Loop While Right(getDomino, 1) > 6
End Function
Public Function leftSide(intDomino As Integer) As Integer
leftSide = intDomino \ 10
End Function
Public Function rightSide(intDomino As Integer) As Integer
rightSide = intDomino Mod 10
End Function
Public Function canJoin(intDominoOneTop As Integer, intDominoOneBottom As Integer, _
                        intDominoTwoTop As Integer, intDominoTwoBottom As Integer) As Boolean
If intDominoOneTop = intDominoTwoTop Or intDominoOneTop = intDominoTwoBottom _
Or intDominoOneBottom = intDominoTwoTop Or intDominoOneBottom = intDominoTwoBottom Then
    canJoin = True
Else:
    canJoin = False
End If
End Function
Public Sub drawLeftTopDomino(intOneTop As Integer)
If intOneTop Mod 2 = 1 Then
    shp15.Visible = True
End If
If intOneTop > 1 Then
    shp11.Visible = True
    shp19.Visible = True
End If
If intOneTop > 3 Then
    shp13.Visible = True
    shp17.Visible = True
End If
If intOneTop = 6 Then
    shp14.Visible = True
    shp16.Visible = True
End If
End Sub
Public Sub drawLeftBottomDomino(intOneBottom As Integer)
If intOneBottom Mod 2 = 1 Then
    shp25.Visible = True
End If
If intOneBottom > 1 Then
    shp21.Visible = True
    shp29.Visible = True
End If
If intOneBottom > 3 Then
    shp23.Visible = True
    shp27.Visible = True
End If
If intOneBottom = 6 Then
    shp24.Visible = True
    shp26.Visible = True
End If
End Sub
Public Sub drawRightTopDomino(intTwoTop As Integer)
If intTwoTop Mod 2 = 1 Then
    shp35.Visible = True
End If
If intTwoTop > 1 Then
    shp31.Visible = True
    shp39.Visible = True
End If
If intTwoTop > 3 Then
    shp33.Visible = True
    shp37.Visible = True
End If
If intTwoTop = 6 Then
    shp34.Visible = True
    shp36.Visible = True
End If
End Sub
Public Sub drawRightBottomDomino(intTwoBottom As Integer)
If intTwoBottom Mod 2 = 1 Then
    shp45.Visible = True
End If
If intTwoBottom > 1 Then
    shp41.Visible = True
    shp49.Visible = True
End If
If intTwoBottom > 3 Then
    shp43.Visible = True
    shp47.Visible = True
End If
If intTwoBottom = 6 Then
    shp44.Visible = True
    shp46.Visible = True
End If
End Sub
Public Sub clearDomino()
shp11.Visible = False
shp13.Visible = False
shp14.Visible = False
shp15.Visible = False
shp16.Visible = False
shp17.Visible = False
shp19.Visible = False
shp21.Visible = False
shp23.Visible = False
shp24.Visible = False
shp25.Visible = False
shp26.Visible = False
shp27.Visible = False
shp29.Visible = False
shp31.Visible = False
shp33.Visible = False
shp34.Visible = False
shp35.Visible = False
shp36.Visible = False
shp37.Visible = False
shp39.Visible = False
shp41.Visible = False
shp43.Visible = False
shp44.Visible = False
shp45.Visible = False
shp46.Visible = False
shp47.Visible = False
shp49.Visible = False
End Sub
Private Sub Form_Load()
Randomize
End Sub
