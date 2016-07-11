VERSION 5.00
Begin VB.Form frmTemperatureConverter 
   Caption         =   "Temperature Converter"
   ClientHeight    =   8295
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7560
   LinkTopic       =   "Form1"
   ScaleHeight     =   8295
   ScaleWidth      =   7560
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraOutput 
      Caption         =   "Conversion Table"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5295
      Left            =   120
      TabIndex        =   7
      Top             =   3000
      Width           =   7335
      Begin VB.ListBox lstOutput 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3945
         ItemData        =   "frmTemperatureConverter.frx":0000
         Left            =   240
         List            =   "frmTemperatureConverter.frx":0002
         TabIndex        =   9
         Top             =   1200
         Width           =   6855
      End
      Begin VB.Label lblOutput 
         BackColor       =   &H80000005&
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
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   6855
      End
   End
   Begin VB.Frame fraConversions 
      Caption         =   "Conversions"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   4335
      Begin VB.OptionButton optCtoK 
         Caption         =   "Celsius to Kelvin (°C to K)"
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
         Left            =   120
         TabIndex        =   4
         Top             =   1320
         Width           =   3495
      End
      Begin VB.OptionButton optKtoF 
         Caption         =   "Kelvin to Fahrenheit (K to °F)"
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
         Left            =   120
         TabIndex        =   3
         Top             =   840
         Width           =   4095
      End
      Begin VB.OptionButton optCtoF 
         Caption         =   "Celsius to Fahrenheit (°C to °F)"
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
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   4095
      End
   End
   Begin VB.Label lblEnding 
      BackColor       =   &H80000005&
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
      Left            =   5880
      TabIndex        =   11
      Top             =   1920
      Width           =   1575
   End
   Begin VB.Label lblStarting 
      BackColor       =   &H80000005&
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
      Left            =   5880
      TabIndex        =   10
      Top             =   840
      Width           =   1575
   End
   Begin VB.Label lblEndingValue 
      BackColor       =   &H80000005&
      Caption         =   "Ending Value:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   4560
      TabIndex        =   6
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label lblStartingValue 
      BackColor       =   &H80000005&
      Caption         =   "Starting Value:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   4560
      TabIndex        =   5
      Top             =   840
      Width           =   1215
   End
   Begin VB.Label lblPrompt 
      BackColor       =   &H80000005&
      Caption         =   "What would you like to convert?"
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
      TabIndex        =   0
      Top             =   120
      Width           =   7335
   End
End
Attribute VB_Name = "frmTemperatureConverter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: April 28 2014
'Purpose: To convert various types of temperatures.
Option Explicit

Private Sub Form_Load()
optCtoF.Value = False
optKtoF.Value = False
optCtoK.Value = False
End Sub

Private Sub optCtoF_Click()
lstOutput.Clear
lblStarting.Caption = ""
lblEnding.Caption = ""
lblOutput.Caption = ""
'Declaration
Dim sglStarting As Single
Dim sglEnding As Single
Dim sglFahrenheit As Single
'Initialization
sglStarting = 0
sglEnding = 0
sglFahrenheit = 0
'Input & Output
Do:
sglStarting = Val(InputBox("Enter a starting value for the conversions of Celsius to Fahrenheit:", _
                           "Starting Value: Celsius To Fahrenheit"))
sglEnding = Val(InputBox("Now enter an ending value for the conversions of Celsius to Fahrenheit:", _
                         "Ending value: Celsius To Fahrenheit"))
'Process & Output
If sglStarting >= sglEnding Or sglEnding - sglStarting < 0.5 Then
    MsgBox ("You have an invalid input! Please make sure your starting number is" _
    & " less than your ending number,and there is at least a minimum of 0.5 in between.")
End If
Loop While sglStarting >= sglEnding Or sglEnding - sglStarting < 0.5
lblStarting.Caption = sglStarting & "°C"
lblEnding.Caption = sglEnding & "°C"
Do While sglStarting <= sglEnding
    sglFahrenheit = ((9 / 5) * sglStarting) + 32
    lstOutput.AddItem sglStarting & "°C is equal to " & sglFahrenheit & "°F."
    sglStarting = sglStarting + 0.5
Loop
lblOutput.Caption = "Celsius to Fahrenheit:"
End Sub

Private Sub optCtoK_Click()
lstOutput.Clear
lblStarting.Caption = ""
lblEnding.Caption = ""
lblOutput.Caption = ""
'Declaration
Dim sglStarting As Single
Dim sglEnding As Single
Dim sglKelvin As Single
'Initialization
sglStarting = 0
sglEnding = 0
sglKelvin = 0
'Input & Output
Do:
sglStarting = Val(InputBox("Enter a starting value for the conversions of Celsius to Kelvin:", _
                           "Starting Value: Celsius To Kelvin"))
sglEnding = Val(InputBox("Now enter a finishing value for the conversions of Celsius to Kelvin:", _
                         "Ending Value: Celsius To Kelvin"))
'Process & Output
If sglStarting >= sglEnding Or sglEnding - sglStarting < 0.5 Then
    MsgBox ("You have an invalid input! Please make sure your starting number is" _
    & " less than your ending number,and there is at least a minimum of 0.5 in between.")
End If
Loop While sglStarting >= sglEnding Or sglEnding - sglStarting < 0.5
lblStarting.Caption = sglStarting & "°C"
lblEnding.Caption = sglEnding & "°C"
Do While sglStarting <= sglEnding
    sglKelvin = sglStarting + 273.15
    lstOutput.AddItem sglStarting & "°C is equal to " & sglKelvin & "K."
    sglStarting = sglStarting + 0.5
Loop
lblOutput.Caption = "Celsius to Kelvin:"
End Sub

Private Sub optKtoF_Click()
lstOutput.Clear
lblStarting.Caption = ""
lblEnding.Caption = ""
lblOutput.Caption = ""
'Declaration
Dim sglStarting As Single
Dim sglEnding As Single
Dim sglFahrenheit As Single
'Initialization
sglStarting = 0
sglEnding = 0
sglFahrenheit = 0
'Input & Output
Do:
sglStarting = Val(InputBox("Enter a starting value for the conversions of Kelvin to Fahrenheit:", _
                           "Starting Value: Kelvin To Fahrenheit"))
sglEnding = Val(InputBox("Now enter a finishing value for the conversions of Kelvin to Fahrenheit:", _
                         "Ending Value: Kelvin To Fahrenheit"))
'Process & Output
If sglStarting >= sglEnding Or sglEnding - sglStarting < 0.5 Then
    MsgBox ("You have an invalid input! Please make sure your starting number is" _
    & " less than your ending number,and there is at least a minimum of 0.5 in between.")
End If
Loop While sglStarting >= sglEnding Or sglEnding - sglStarting < 0.5
lblStarting.Caption = sglStarting & "K"
lblEnding.Caption = sglEnding & "K"
Do While sglStarting <= sglEnding
    sglFahrenheit = (sglStarting * 1.8) - 459.67
    lstOutput.AddItem sglStarting & "K is equal to " & sglFahrenheit & "°F."
    sglStarting = sglStarting + 0.5
Loop
lblOutput.Caption = "Kelvin to Fahrenheit:"
End Sub
