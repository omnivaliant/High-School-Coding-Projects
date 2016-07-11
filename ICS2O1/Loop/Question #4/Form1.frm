VERSION 5.00
Begin VB.Form frmAcronymGenerator 
   BackColor       =   &H8000000B&
   Caption         =   "Acronym Generator"
   ClientHeight    =   7755
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4695
   LinkTopic       =   "Form1"
   ScaleHeight     =   7755
   ScaleWidth      =   4695
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstWord 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3360
      ItemData        =   "Form1.frx":0000
      Left            =   2280
      List            =   "Form1.frx":0002
      TabIndex        =   5
      Top             =   3240
      Width           =   2295
   End
   Begin VB.ListBox lstAcronym 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3360
      ItemData        =   "Form1.frx":0004
      Left            =   120
      List            =   "Form1.frx":0006
      TabIndex        =   2
      Top             =   3240
      Width           =   1335
   End
   Begin VB.CommandButton cmdConvert 
      Caption         =   "Generate!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   1
      Top             =   1920
      Width           =   4455
   End
   Begin VB.TextBox txtInput 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   720
      Width           =   4455
   End
   Begin VB.Label lblHorizonalAcronym 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      TabIndex        =   8
      Top             =   6720
      Width           =   4455
   End
   Begin VB.Label lblWord 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Word"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   2280
      TabIndex        =   7
      Top             =   2640
      Width           =   2295
   End
   Begin VB.Label lblAcronym 
      BackColor       =   &H80000009&
      Caption         =   "Acronym"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Label lblEquals 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "="
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1560
      TabIndex        =   4
      Top             =   4080
      Width           =   615
   End
   Begin VB.Label lblPrompt 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      Caption         =   "Write your sentance here:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "frmAcronymGenerator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 1 2014
'Purpose: To create an acronym generator out of a phrase.
Option Explicit

Private Sub cmdConvert_Click()
lstAcronym.Clear
lstWord.Clear
lblHorizonalAcronym.Caption = ""
Dim strPhrase As String
Dim intSpace As Integer
Dim strOldWord As String
Dim strAcronym As String
Dim strLetter As String
strPhrase = Trim(txtInput.Text)
Do While InStr(strPhrase, " ")
    intSpace = InStr(strPhrase, " ")
    strOldWord = Mid(strPhrase, 1, intSpace - 1)
    strLetter = UCase(Mid(strOldWord, 1, 1))
    strPhrase = Mid(strPhrase, intSpace + 1)
    strPhrase = Trim(strPhrase)
    strAcronym = strAcronym & strLetter
    lblHorizonalAcronym.Caption = strAcronym
    lstAcronym.AddItem strLetter
    lstWord.AddItem strOldWord
Loop
lstAcronym.AddItem UCase(Mid(strPhrase, 1, 1))
lstWord.AddItem strPhrase
lblHorizonalAcronym.Caption = strAcronym & UCase(Mid(strPhrase, 1, 1))
End Sub

Private Sub txtInput_Change()
lstAcronym.Clear
lstWord.Clear
lblHorizonalAcronym.Caption = ""
End Sub
