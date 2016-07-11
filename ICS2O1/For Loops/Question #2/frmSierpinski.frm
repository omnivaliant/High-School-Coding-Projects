VERSION 5.00
Begin VB.Form frmSierpinski 
   Caption         =   "Sierpinski's Triangles"
   ClientHeight    =   7440
   ClientLeft      =   60
   ClientTop       =   555
   ClientWidth     =   15120
   DrawWidth       =   9
   LinkTopic       =   "Form1"
   ScaleHeight     =   7440
   ScaleWidth      =   15120
   Begin VB.CommandButton cmdClear 
      BackColor       =   &H8000000E&
      Caption         =   "Clear!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   9120
      TabIndex        =   8
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox txtPercent 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   765
      Left            =   13560
      TabIndex        =   5
      Text            =   "50"
      Top             =   90
      Width           =   1455
   End
   Begin VB.PictureBox picTriangle 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      DrawStyle       =   2  'Dot
      FillStyle       =   0  'Solid
      ForeColor       =   &H80000008&
      Height          =   6375
      Left            =   120
      ScaleHeight     =   6345
      ScaleWidth      =   14865
      TabIndex        =   4
      Top             =   960
      Width           =   14895
   End
   Begin VB.Frame fraInputs 
      Caption         =   "Vertices"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2175
      Begin VB.OptionButton opt5 
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1560
         TabIndex        =   3
         Top             =   360
         Width           =   495
      End
      Begin VB.OptionButton opt4 
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   840
         TabIndex        =   2
         Top             =   360
         Width           =   615
      End
      Begin VB.OptionButton opt3 
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Label lblPrompt 
      BackColor       =   &H8000000E&
      Caption         =   "Please choose the amount of vertices, percentage distance, and click in the box until an image appears!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   2400
      TabIndex        =   7
      Top             =   120
      Width           =   6615
   End
   Begin VB.Label lblPercent 
      BackColor       =   &H8000000E&
      Caption         =   "Distance from each point: (%)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   10680
      TabIndex        =   6
      Top             =   120
      Width           =   2775
   End
End
Attribute VB_Name = "frmSierpinski"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 12 2014
'Purpose: To create Sierpinski's Triangles.
Option Explicit
'Global Variables
Dim sglX1, sglY1 As Single
Dim sglX2, sglY2 As Single
Dim sglX3, sglY3 As Single
Dim sglX4, sglY4 As Single
Dim sglX5, sglY5 As Single
Dim sglStartingX, sglStartingY As Single
Dim intMouseClick As Integer
Dim intClick As Integer
Dim sglRed As Single
Dim sglBlue As Single
Dim sglGreen As Single

Private Sub cmdClear_Click()
picTriangle.Cls
picTriangle.Enabled = True
intMouseClick = 3
opt3.Value = True
intClick = 0
End Sub

Private Sub Form_Load()
sglX1 = 0
sglY1 = 0
sglX2 = 0
sglY2 = 0
sglX3 = 0
sglY3 = 0
sglX4 = 0
sglY4 = 0
sglX5 = 0
sglY5 = 0
sglStartingX = 0
sglStartingY = 0
intMouseClick = 0
intClick = 0
sglRed = 0
sglBlue = 0
sglGreen = 0
End Sub

Private Sub opt3_Click()
picTriangle.Cls
picTriangle.Enabled = True
intMouseClick = 3
intClick = 0
End Sub

Private Sub opt4_Click()
picTriangle.Cls
picTriangle.Enabled = True
intMouseClick = 4
intClick = 0
End Sub

Private Sub opt5_Click()
picTriangle.Cls
picTriangle.Enabled = True
intMouseClick = 5
intClick = 0
End Sub

Private Sub picTriangle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim intRandom As Integer
Dim lngCount As Long
Dim sglFirstPercent As Single
Dim sglSecondPercent As Single
sglFirstPercent = Val(txtPercent.Text) / 100
sglSecondPercent = 1 - sglFirstPercent
intClick = intClick + 1
If intClick = 1 Then
    sglX1 = X
    sglY1 = Y
    picTriangle.PSet (X, Y)
    picTriangle.Circle (X, Y), 1, vbBlue
ElseIf intClick = 2 Then
    sglX2 = X
    sglY2 = Y
    picTriangle.PSet (X, Y)
    picTriangle.Circle (X, Y), 1, vbBlue
ElseIf intClick = 3 Then
    sglX3 = X
    sglY3 = Y
    picTriangle.PSet (X, Y)
    picTriangle.Circle (X, Y), 1, vbBlue
ElseIf intClick = 4 And intMouseClick = 3 Then
    sglStartingX = X
    sglStartingY = Y
    picTriangle.PSet (X, Y)
    picTriangle.Circle (X, Y), 1, vbBlue
    picTriangle.Enabled = False
    For lngCount = 1 To 500000:
        intRandom = Int(Rnd * 3) + 1
        If intRandom = 1 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX1 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY1 * sglSecondPercent)
            sglRed = (255 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (0 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (0 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        ElseIf intRandom = 2 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX2 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY2 * sglSecondPercent)
            sglRed = (0 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (255 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (0 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        Else:
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX3 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY3 * sglSecondPercent)
            sglRed = (0 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (0 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (255 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        End If
    Next lngCount
ElseIf intClick = 4 Then
    sglX4 = X
    sglY4 = Y
    picTriangle.PSet (X, Y)
    picTriangle.Circle (X, Y), 1, vbBlue
ElseIf intClick = 5 And intMouseClick = 4 Then
    sglStartingX = X
    sglStartingY = Y
    picTriangle.PSet (X, Y)
    picTriangle.Circle (X, Y), 1, vbBlue
    picTriangle.Enabled = False
    For lngCount = 1 To 500000:
        intRandom = Int(Rnd * 4) + 1
        If intRandom = 1 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX1 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY1 * sglSecondPercent)
            sglRed = (255 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (0 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (0 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        ElseIf intRandom = 2 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX2 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY2 * sglSecondPercent)
            sglRed = (0 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (255 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (0 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        ElseIf intRandom = 3 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX3 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY3 * sglSecondPercent)
            sglRed = (0 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (0 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (255 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        Else:
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX4 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY4 * sglSecondPercent)
            sglRed = (255 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (0 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (255 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        End If
    Next lngCount
ElseIf intClick = 5 Then
    sglX5 = X
    sglY5 = Y
    picTriangle.PSet (X, Y)
    picTriangle.Circle (X, Y), 1, vbBlue
ElseIf intClick = 6 And intMouseClick = 5 Then
    sglStartingX = X
    sglStartingY = Y
    picTriangle.PSet (X, Y)
    picTriangle.Circle (X, Y), 1, vbBlue
    picTriangle.Enabled = False
    For lngCount = 1 To 500000:
        intRandom = Int(Rnd * 5) + 1
        If intRandom = 1 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX1 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY1 * sglSecondPercent)
            sglRed = (255 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (0 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (0 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        ElseIf intRandom = 2 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX2 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY2 * sglSecondPercent)
            sglRed = (0 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (255 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (0 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        ElseIf intRandom = 3 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX3 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY3 * sglSecondPercent)
            sglRed = (0 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (0 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (255 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        ElseIf intRandom = 4 Then
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX4 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY4 * sglSecondPercent)
            sglRed = (255 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (0 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (255 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        Else:
            sglStartingX = (sglStartingX * sglFirstPercent) + (sglX5 * sglSecondPercent)
            sglStartingY = (sglStartingY * sglFirstPercent) + (sglY5 * sglSecondPercent)
            sglRed = (0 * sglFirstPercent) + (sglRed * sglSecondPercent)
            sglGreen = (255 * sglFirstPercent) + (sglGreen * sglSecondPercent)
            sglBlue = (255 * sglFirstPercent) + (sglBlue * sglSecondPercent)
            picTriangle.PSet (sglStartingX, sglStartingY), RGB(sglRed, sglGreen, sglBlue)
        End If
    Next lngCount
End If
End Sub

