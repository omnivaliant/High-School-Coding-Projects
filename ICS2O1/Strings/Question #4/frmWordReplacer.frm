VERSION 5.00
Begin VB.Form frmWordReplacer 
   Caption         =   "Word Replacer"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset."
      Height          =   495
      Left            =   2400
      TabIndex        =   7
      Top             =   2280
      Width           =   2175
   End
   Begin VB.CommandButton cmdReplace 
      Caption         =   "Replace!"
      Height          =   495
      Left            =   0
      TabIndex        =   6
      Top             =   2280
      Width           =   2175
   End
   Begin VB.TextBox txtNewWord 
      Height          =   495
      Left            =   2400
      TabIndex        =   5
      Top             =   1680
      Width           =   2175
   End
   Begin VB.TextBox txtOldWord 
      Height          =   495
      Left            =   0
      TabIndex        =   4
      Top             =   1680
      Width           =   2175
   End
   Begin VB.TextBox txtSentence 
      Height          =   495
      Left            =   0
      TabIndex        =   1
      Top             =   720
      Width           =   4575
   End
   Begin VB.Label lblNewWord 
      Caption         =   "New Word:"
      Height          =   255
      Left            =   2400
      TabIndex        =   3
      Top             =   1320
      Width           =   2175
   End
   Begin VB.Label lblOldWork 
      Caption         =   "Old Word:"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1320
      Width           =   2295
   End
   Begin VB.Label lblSentence 
      Caption         =   "Write your sentence here!"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4335
   End
End
Attribute VB_Name = "frmWordReplacer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: March 24 2014
'Purpose: To replace a sentance of an old word with a new word.
Option Explicit

Private Sub cmdReplace_Click()
cmdReset.Enabled = True
'Declaration
Dim strOldWord As String
Dim strNewWord As String
Dim strOldSentence As String
Dim intLocationOfOldWord As Integer
Dim strBeforeOldWord As String
Dim strAfterOldWord As String
Dim strNewSentence As String
'Initialization
strOldWord = ""
strNewWord = ""
strOldSentence = ""
intLocationOfOldWord = 0
strBeforeOldWord = ""
strAfterOldWord = ""
strNewSentence = ""
'Input
strOldWord = txtOldWord.Text
strNewWord = txtNewWord.Text
strOldSentence = txtSentence.Text
'Process
intLocationOfOldWord = InStr(strOldSentence, strOldWord)
strBeforeOldWord = Left(strOldSentence, intLocationOfOldWord - 1)
strAfterOldWord = Mid(strOldSentence, intLocationOfOldWord + Len(strOldWord))
strNewSentence = strBeforeOldWord & strNewWord & strAfterOldWord
'Output
txtSentence.Text = strNewSentence
End Sub

Private Sub cmdReset_Click()
txtSentence.Text = ""
txtOldWord.Text = ""
txtNewWord.Text = ""
cmdReplace.Enabled = True
cmdReset.Enabled = False
End Sub
