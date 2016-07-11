VERSION 5.00
Begin VB.Form frmWordSort 
   Caption         =   "Word Sorter"
   ClientHeight    =   4545
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5040
   LinkTopic       =   "Form1"
   ScaleHeight     =   4545
   ScaleWidth      =   5040
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset."
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
      Left            =   2520
      TabIndex        =   5
      Top             =   2280
      Width           =   2415
   End
   Begin VB.CommandButton cmdSort 
      Caption         =   "Sort!"
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
      Left            =   0
      TabIndex        =   4
      Top             =   3000
      Width           =   4935
   End
   Begin VB.TextBox txtWord3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   0
      TabIndex        =   3
      Top             =   2280
      Width           =   2415
   End
   Begin VB.CheckBox chkWord3 
      BackColor       =   &H80000005&
      Caption         =   "I would like to sort 3 words."
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
      Left            =   0
      TabIndex        =   2
      Top             =   1680
      Width           =   4935
   End
   Begin VB.TextBox txtWord1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   0
      TabIndex        =   1
      Top             =   960
      Width           =   2415
   End
   Begin VB.TextBox txtWord2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2520
      TabIndex        =   0
      Top             =   960
      Width           =   2415
   End
   Begin VB.Label lblInstructions 
      BackColor       =   &H80000005&
      Caption         =   "Please enter two or three words to be sorted ascending."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   0
      TabIndex        =   7
      Top             =   120
      Width           =   4935
   End
   Begin VB.Label lblOutput 
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   0
      TabIndex        =   6
      Top             =   3720
      Width           =   4935
   End
End
Attribute VB_Name = "frmWordSort"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: April 18 2014
'Purpose: To sort three words alphabetically.
Option Explicit

Private Sub chkWord3_Click()
If chkWord3.Value = vbUnchecked Then
    txtWord3.Enabled = False
    txtWord3.Visible = False
    txtWord3.Text = ""
ElseIf chkWord3.Value = vbChecked Then
    txtWord3.Enabled = True
    txtWord3.Visible = True
End If
End Sub

Private Sub cmdReset_Click()
lblOutput.Caption = ""
lblOutput.Visible = False
cmdReset.Enabled = False
cmdSort.Enabled = True
chkWord3.Value = vbUnchecked
chkWord3.Enabled = True
txtWord3.Visible = False
txtWord1.Text = ""
txtWord2.Text = ""
txtWord3.Text = ""
txtWord1.Enabled = True
txtWord2.Enabled = True
txtWord3.Enabled = True
End Sub

Private Sub cmdSort_Click()
lblOutput.Visible = True
cmdReset.Enabled = True
cmdSort.Enabled = False
txtWord1.Enabled = False
txtWord2.Enabled = False
txtWord3.Enabled = False
chkWord3.Enabled = False
'Declaration
Dim strWord1 As String
Dim strWord2 As String
Dim strWord3 As String
Dim strOutput As String
'Initialization
strWord1 = ""
strWord2 = ""
strWord3 = ""
'Input
strWord1 = LCase(txtWord1.Text)
strWord2 = LCase(txtWord2.Text)
strWord3 = LCase(txtWord3.Text)
'Process
If strWord1 > strWord2 And strWord2 > strWord3 Then
    strOutput = strWord3 & ", " & strWord2 & ", & " & strWord1 & "."
ElseIf strWord1 > strWord3 And strWord3 > strWord2 Then
    strOutput = strWord2 & ", " & strWord3 & ", & " & strWord1 & "."
ElseIf strWord2 > strWord1 And strWord1 > strWord3 Then
    strOutput = strWord3 & ", " & strWord1 & ", & " & strWord2 & "."
ElseIf strWord2 > strWord3 And strWord3 > strWord1 Then
    strOutput = strWord1 & ", " & strWord3 & ", & " & strWord2 & "."
ElseIf strWord3 > strWord1 And strWord1 > strWord2 Then
    strOutput = strWord2 & ", " & strWord1 & ", & " & strWord3 & "."
ElseIf strWord3 > strWord2 And strWord2 > strWord1 Then
    strOutput = strWord1 & ", " & strWord2 & ", & " & strWord3 & "."
Else:
    strOutput = "invalid. Do you have two or more of the same words?"
End If
'Output
lblOutput.Caption = "Your words are " & strOutput

End Sub

Private Sub Form_Load()
txtWord3.Visible = False
lblOutput.Visible = False
cmdReset.Enabled = False
End Sub
