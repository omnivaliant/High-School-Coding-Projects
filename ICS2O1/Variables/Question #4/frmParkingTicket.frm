VERSION 5.00
Begin VB.Form frmParkingTicket 
   Caption         =   "Parking Garage"
   ClientHeight    =   6540
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4980
   LinkTopic       =   "Form1"
   ScaleHeight     =   6540
   ScaleWidth      =   4980
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraCost 
      Caption         =   "Cost"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   360
      TabIndex        =   3
      Top             =   5040
      Width           =   3975
      Begin VB.PictureBox picCost 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   1320
         ScaleHeight     =   675
         ScaleWidth      =   2355
         TabIndex        =   16
         Top             =   240
         Width           =   2415
      End
   End
   Begin VB.Frame fraDuration 
      Caption         =   "Duration of Parking"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   360
      TabIndex        =   2
      Top             =   3720
      Width           =   3975
      Begin VB.TextBox txtTotalMins 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2040
         TabIndex        =   15
         Top             =   480
         Width           =   1695
      End
      Begin VB.Label lblTotalMins 
         Caption         =   "Total Minutes"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   14
         Top             =   480
         Width           =   1575
      End
   End
   Begin VB.Frame fraArrivalTime 
      Caption         =   "Arrival Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2415
      Left            =   360
      TabIndex        =   1
      Top             =   1200
      Width           =   3975
      Begin VB.OptionButton optAfter6 
         Caption         =   "After 6pm"
         Height          =   255
         Left            =   240
         TabIndex        =   10
         Top             =   1440
         Width           =   255
      End
      Begin VB.OptionButton optDuring 
         Caption         =   "8am to 6pm"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   960
         Width           =   255
      End
      Begin VB.OptionButton optBefore8 
         Caption         =   "Before 8am"
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   480
         Width           =   255
      End
      Begin VB.Label lblAfter6 
         Caption         =   "After 6pm"
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
         Left            =   720
         TabIndex        =   13
         Top             =   1440
         Width           =   2535
      End
      Begin VB.Label lblDuring 
         Caption         =   "8am to 6pm"
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
         Left            =   720
         TabIndex        =   12
         Top             =   960
         Width           =   2295
      End
      Begin VB.Label lblBefore8 
         Caption         =   "Before 8am"
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
         Left            =   720
         TabIndex        =   11
         Top             =   480
         Width           =   2535
      End
   End
   Begin VB.Frame fraDay 
      Caption         =   "Day"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   3975
      Begin VB.OptionButton optWeekend 
         Caption         =   "Weekend"
         Height          =   255
         Left            =   1680
         TabIndex        =   6
         Top             =   360
         Width           =   255
      End
      Begin VB.OptionButton optWeekday 
         Caption         =   "Weekday"
         Height          =   195
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   255
      End
      Begin VB.Label lblWeekend 
         Caption         =   "Weekend"
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
         Left            =   2160
         TabIndex        =   7
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label lblWeekday 
         Caption         =   "Weekday"
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
         Left            =   600
         TabIndex        =   5
         Top             =   360
         Width           =   855
      End
   End
End
Attribute VB_Name = "frmParkingTicket"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Author: Mohit Patel
' Date: March 4 2014
' Purpose: To calculate the costs of parking at a downtown underground parking lot.
Option Explicit


Private Sub optAfter6_Click()
picCost.Cls
picCost.Print Format(8, "$0.00")
txtTotalMins.Enabled = False
txtTotalMins.BackColor = &H8000000F
End Sub

Private Sub optBefore8_Click()
picCost.Cls
picCost.Print Format(15, "$0.00")
txtTotalMins.Enabled = False
txtTotalMins.BackColor = &H8000000F
End Sub

Private Sub optDuring_Click()
picCost.Cls
txtTotalMins.Enabled = True
txtTotalMins.BackColor = &H80000005
End Sub

Private Sub optWeekday_Click()
picCost.Cls
fraArrivalTime.Visible = True
fraDuration.Visible = True
End Sub


Private Sub optWeekend_Click()
picCost.Cls
fraArrivalTime.Visible = False
fraDuration.Visible = False
picCost.Print Format(5, "$0.00")

End Sub

Private Sub Form_Load()
fraArrivalTime.Visible = True
fraDuration.Visible = True
fraCost.Visible = True
fraDay.Visible = True
txtTotalMins.Enabled = False
txtTotalMins.BackColor = &H8000000F

End Sub

Private Sub txtTotalMins_Change()
'Declaration:
Dim intTotalMinutes As Integer
Dim intExtra As Integer
Dim dblCost As Double
'Initialization:
intTotalMinutes = 0
intExtra = 0
dblCost = 0
'Input:
intTotalMinutes = Val(txtTotalMins.Text)
'Process
dblCost = 2.75 * (intTotalMinutes \ 30)
intExtra = (intTotalMinutes / 30) - Int(intTotalMinutes / 30) + 0.5
dblCost = dblCost + 2.75 * intExtra
'Output:
picCost.Cls
picCost.Print Format(dblCost, "$0.00")

End Sub
