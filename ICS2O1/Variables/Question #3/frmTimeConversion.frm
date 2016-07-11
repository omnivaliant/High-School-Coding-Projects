VERSION 5.00
Begin VB.Form frmTimeConversion 
   Caption         =   "Time Conversion"
   ClientHeight    =   5400
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8415
   LinkTopic       =   "Form1"
   ScaleHeight     =   5400
   ScaleWidth      =   8415
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraInput 
      Caption         =   "Total Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2415
      Begin VB.TextBox txtMinutes 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Left            =   360
         TabIndex        =   12
         Top             =   4200
         Width           =   1695
      End
      Begin VB.TextBox txtHours 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Left            =   360
         TabIndex        =   10
         Top             =   2760
         Width           =   1695
      End
      Begin VB.TextBox txtDays 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Left            =   360
         TabIndex        =   8
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label lblMinutes 
         Caption         =   "Minutes"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   360
         TabIndex        =   11
         Top             =   3480
         Width           =   1815
      End
      Begin VB.Label lblHours 
         Caption         =   "Hours"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   360
         TabIndex        =   9
         Top             =   2040
         Width           =   1335
      End
      Begin VB.Label lblDays 
         Caption         =   "Days"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   360
         TabIndex        =   7
         Top             =   600
         Width           =   1455
      End
   End
   Begin VB.Frame fraOutput 
      Caption         =   "Total Minutes"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5295
      Left            =   5400
      TabIndex        =   2
      Top             =   0
      Width           =   2895
      Begin VB.TextBox txtTotalMinutes 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1215
         Left            =   240
         TabIndex        =   6
         Top             =   2520
         Width           =   2295
      End
      Begin VB.Label lblTotalMinutes 
         Caption         =   "Total Minutes"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   27.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1215
         Left            =   240
         TabIndex        =   5
         Top             =   480
         Width           =   2295
      End
   End
   Begin VB.Frame fraConversion 
      Caption         =   "Conversion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5295
      Left            =   2400
      TabIndex        =   1
      Top             =   0
      Width           =   3015
      Begin VB.CommandButton cmdMinToTime 
         Caption         =   "<--------------------------------"
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
         TabIndex        =   4
         Top             =   3240
         Width           =   2295
      End
      Begin VB.CommandButton cmdTimeToMin 
         Caption         =   "--------------------------------->"
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
         Picture         =   "frmTimeConversion.frx":0000
         TabIndex        =   3
         Top             =   1440
         Width           =   2295
      End
   End
End
Attribute VB_Name = "frmTimeConversion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Author: Mohit Patel
' Date: March 4 2014
' Purpose: To convert hours and minutes into minutes, and vice versa.
Option Explicit

Private Sub cmdMinToTime_Click()
'Declaration:
Dim intDays As Integer
Dim intHours As Integer
Dim intMinutes As Integer
Dim intTotalMinutes As Integer
'Initialization:
intDays = 0
intHours = 0
intMinutes = 0
intTotalMinutes = 0
'Input:
intTotalMinutes = Val(txtTotalMinutes.Text)
'Process
intDays = intTotalMinutes \ 1440
intHours = (intTotalMinutes - (intDays * 1440)) \ 60
intMinutes = (intTotalMinutes - (intDays * 1440)) Mod 60
'Output:
txtDays.Text = intDays
txtHours.Text = intHours
txtMinutes.Text = intMinutes

txtMinutes.Enabled = True
txtDays.Enabled = True
txtHours.Enabled = True
txtTotalMinutes.Enabled = True
cmdMinToTime.Enabled = False
cmdTimeToMin.Enabled = False


End Sub

Private Sub cmdTimeToMin_Click()

'Declaration:
Dim intDays As Integer
Dim intHours As Integer
Dim intMinutes As Integer
Dim intTotalMinutes As Integer
'Initialization:
intDays = 0
intHours = 0
intMinutes = 0
intTotalMinutes = 0
'Input:
intDays = Val(txtDays.Text)
intHours = Val(txtHours.Text)
intMinutes = Val(txtMinutes.Text)
'Process
intTotalMinutes = (intDays * 1440) + (intHours * 60) + (intMinutes)
'Output:
txtTotalMinutes.Text = intTotalMinutes

txtMinutes.Enabled = True
txtDays.Enabled = True
txtHours.Enabled = True
txtTotalMinutes.Enabled = True
cmdMinToTime.Enabled = False
cmdTimeToMin.Enabled = False

End Sub

Private Sub txtDays_Change()
txtTotalMinutes.Enabled = False
cmdTimeToMin.Enabled = True
cmdMinToTime.Enabled = False
End Sub

Private Sub txtHours_Change()
txtTotalMinutes.Enabled = False
cmdTimeToMin.Enabled = True
cmdMinToTime.Enabled = False
End Sub

Private Sub txtMinutes_Change()
txtTotalMinutes.Enabled = False
cmdTimeToMin.Enabled = True
cmdMinToTime.Enabled = False
End Sub

Private Sub txtTotalMinutes_Change()
txtDays.Enabled = False
txtMinutes.Enabled = False
txtHours.Enabled = False
cmdTimeToMin.Enabled = False
cmdMinToTime.Enabled = True
End Sub
