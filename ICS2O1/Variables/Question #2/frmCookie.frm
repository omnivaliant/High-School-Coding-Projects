VERSION 5.00
Begin VB.Form frmCookie 
   Caption         =   "Cookie Calculator"
   ClientHeight    =   6540
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8655
   LinkTopic       =   "Form1"
   ScaleHeight     =   6540
   ScaleWidth      =   8655
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdClear 
      BackColor       =   &H80000000&
      Caption         =   "Clear!"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4920
      MaskColor       =   &H80000000&
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   5160
      Width           =   2655
   End
   Begin VB.PictureBox picLeftOverCookies 
      BackColor       =   &H80000000&
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6240
      ScaleHeight     =   435
      ScaleWidth      =   1395
      TabIndex        =   20
      Top             =   4200
      Width           =   1455
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "Calculate!"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   840
      TabIndex        =   18
      Top             =   5160
      Width           =   2655
   End
   Begin VB.PictureBox picTotalValue 
      BackColor       =   &H80000000&
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6240
      ScaleHeight     =   435
      ScaleWidth      =   1395
      TabIndex        =   17
      Top             =   3480
      Width           =   1455
   End
   Begin VB.PictureBox picLeftOverBoxes 
      BackColor       =   &H80000000&
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6240
      ScaleHeight     =   435
      ScaleWidth      =   1395
      TabIndex        =   16
      Top             =   2760
      Width           =   1455
   End
   Begin VB.PictureBox picNumberOfCartons 
      BackColor       =   &H80000000&
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6240
      ScaleHeight     =   435
      ScaleWidth      =   1395
      TabIndex        =   15
      Top             =   2040
      Width           =   1455
   End
   Begin VB.PictureBox picNumberOfBoxes 
      BackColor       =   &H80000000&
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6240
      ScaleHeight     =   435
      ScaleWidth      =   1395
      TabIndex        =   14
      Top             =   1440
      Width           =   1455
   End
   Begin VB.TextBox txtPricePerLooseBox 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   9
      Top             =   4200
      Width           =   1455
   End
   Begin VB.TextBox txtBoxesPerCarton 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   8
      Top             =   3480
      Width           =   1455
   End
   Begin VB.TextBox txtPricePerBox 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   7
      Top             =   2760
      Width           =   1455
   End
   Begin VB.TextBox txtCookiesPerBox 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   6
      Top             =   2040
      Width           =   1455
   End
   Begin VB.TextBox txtCookiesProduced 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   5
      Top             =   1440
      Width           =   1455
   End
   Begin VB.Label lblLeftOverCookeis 
      BackColor       =   &H000080FF&
      Caption         =   "Left Over Cookies"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   19
      Top             =   4200
      Width           =   1815
   End
   Begin VB.Label lblTotalValue 
      BackColor       =   &H000080FF&
      Caption         =   "Total Value"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   13
      Top             =   3480
      Width           =   1815
   End
   Begin VB.Label lblLeftOverBoxes 
      BackColor       =   &H000080FF&
      Caption         =   "Left Over Boxes"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   12
      Top             =   2760
      Width           =   1815
   End
   Begin VB.Label lblNumberOfCartons 
      BackColor       =   &H000080FF&
      Caption         =   "Number Of Cartons"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   11
      Top             =   2040
      Width           =   1815
   End
   Begin VB.Label lblNumberOfBoxes 
      BackColor       =   &H000080FF&
      Caption         =   "Number Of Boxes"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   10
      Top             =   1440
      Width           =   1815
   End
   Begin VB.Label lblPricePerLooseBox 
      BackColor       =   &H000080FF&
      Caption         =   "Price Per Loose Box"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   4200
      Width           =   1815
   End
   Begin VB.Label lblBoxesPerCarton 
      BackColor       =   &H000080FF&
      Caption         =   "Boxes Per Carton"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   3480
      Width           =   1815
   End
   Begin VB.Label lblPricePerBox 
      BackColor       =   &H000080FF&
      Caption         =   "Price Per Box"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   2760
      Width           =   1815
   End
   Begin VB.Label lblCookiesPerBox 
      BackColor       =   &H000080FF&
      Caption         =   "Cookies Per Box"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   2040
      Width           =   1815
   End
   Begin VB.Label lblCookiesProduced 
      BackColor       =   &H000080FF&
      Caption         =   "Cookies Produced"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   240
      TabIndex        =   0
      Top             =   1440
      Width           =   1875
   End
   Begin VB.Image imgCookies 
      Height          =   12750
      Left            =   0
      Picture         =   "frmCookie.frx":0000
      Stretch         =   -1  'True
      Top             =   -2760
      Width           =   19200
   End
End
Attribute VB_Name = "frmCookie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Author: Mohit Patel
' Date: March 3 2014
' Purpose: To calculate the various cookie related costs at ACME Cookie Company.

Option Explicit
Private Sub cmdCalculate_Click()

cmdClear.BackColor = &H80000005
cmdClear.Enabled = True
cmdCalculate.BackColor = &H80000000
cmdCalculate.Enabled = False
picNumberOfBoxes.BackColor = &H80000005
picNumberOfCartons.BackColor = &H80000005
picLeftOverBoxes.BackColor = &H80000005
picTotalValue.BackColor = &H80000005
picLeftOverCookies.BackColor = &H80000005
txtCookiesProduced.BackColor = &H80000000
txtCookiesProduced.Enabled = False
txtCookiesPerBox.BackColor = &H80000000
txtCookiesPerBox.Enabled = False
txtPricePerBox.BackColor = &H80000000
txtPricePerBox.Enabled = False
txtBoxesPerCarton.BackColor = &H80000000
txtBoxesPerCarton.Enabled = False
txtPricePerLooseBox.BackColor = &H80000000
txtPricePerLooseBox.Enabled = False
'Declaration:
Dim intCookiesProduced As Integer
Dim intCookiesPerBox As Integer
Dim sglPricePerBox As Single
Dim intBoxesPerCarton As Integer
Dim sglPricePerLooseBox As Single
Dim intNumberOfBoxes As Integer
Dim intNumberOfCartons As Integer
Dim intLeftOverBoxes As Integer
Dim sglTotalValue As Single
Dim intLeftOverCookies As Integer
'Initialization:
intCookiesProduced = 0
intCookiesPerBox = 0
sglPricePerBox = 0
intBoxesPerCarton = 0
sglPricePerLooseBox = 0
intNumberOfBoxes = 0
intNumberOfCartons = 0
intLeftOverBoxes = 0
sglTotalValue = 0
intLeftOverCookies = 0
'Input:
intCookiesProduced = Val(txtCookiesProduced.Text)
intCookiesPerBox = Val(txtCookiesPerBox.Text)
sglPricePerBox = Val(txtPricePerBox.Text)
intBoxesPerCarton = Val(txtBoxesPerCarton.Text)
sglPricePerLooseBox = Val(txtPricePerLooseBox.Text)
'Process
intNumberOfBoxes = intCookiesProduced \ intCookiesPerBox
intNumberOfCartons = intNumberOfBoxes \ intBoxesPerCarton
intLeftOverBoxes = intNumberOfBoxes Mod intBoxesPerCarton
sglTotalValue = ((intNumberOfBoxes - intLeftOverBoxes) * sglPricePerBox) + (intLeftOverBoxes * _
                                                                             sglPricePerLooseBox)
intLeftOverCookies = intCookiesProduced Mod intCookiesPerBox
'Output:
picNumberOfBoxes.Cls
picNumberOfCartons.Cls
picLeftOverBoxes.Cls
picTotalValue.Cls
picLeftOverCookies.Cls
picNumberOfBoxes.Print intNumberOfBoxes
picNumberOfCartons.Print intNumberOfCartons
picLeftOverBoxes.Print intLeftOverBoxes
picTotalValue.Print Format(sglTotalValue, "$0.00")
picLeftOverCookies.Print intLeftOverCookies
End Sub

Private Sub frmCookies_Load()
cmdClear.BackColor = &H80000000
cmdClear.Enabled = False
picNumberOfBoxes.BackColor = &H80000000
picNumberOfCartons.BackColor = &H80000000
picLeftOverBoxes.BackColor = &H80000000
picTotalValue.BackColor = &H80000000
picLeftOverCookies.BackColor = &H80000000

End Sub

Private Sub cmdClear_Click()
cmdClear.BackColor = &H80000000
cmdClear.Enabled = False
cmdCalculate.BackColor = &H80000005
cmdCalculate.Enabled = True
picNumberOfBoxes.BackColor = &H80000000
picNumberOfCartons.BackColor = &H80000000
picLeftOverBoxes.BackColor = &H80000000
picTotalValue.BackColor = &H80000000
picLeftOverCookies.BackColor = &H80000000
txtCookiesProduced.BackColor = &H80000005
txtCookiesProduced.Enabled = True
txtCookiesPerBox.BackColor = &H80000005
txtCookiesPerBox.Enabled = True
txtPricePerBox.BackColor = &H80000005
txtPricePerBox.Enabled = True
txtBoxesPerCarton.BackColor = &H80000005
txtBoxesPerCarton.Enabled = True
txtPricePerLooseBox.BackColor = &H80000005
txtPricePerLooseBox.Enabled = True
End Sub
