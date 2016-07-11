VERSION 5.00
Begin VB.Form frmTicketCounter 
   Caption         =   "Ticket Counter"
   ClientHeight    =   3840
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   4185
   LinkTopic       =   "Form1"
   ScaleHeight     =   3840
   ScaleWidth      =   4185
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstTicket 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1980
      ItemData        =   "frmTicketCounter.frx":0000
      Left            =   120
      List            =   "frmTicketCounter.frx":0002
      TabIndex        =   5
      Top             =   1800
      Width           =   1815
   End
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
      Height          =   855
      Left            =   2040
      TabIndex        =   4
      Top             =   840
      Width           =   1935
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   1815
   End
   Begin VB.ComboBox cboTicket 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "frmTicketCounter.frx":0004
      Left            =   120
      List            =   "frmTicketCounter.frx":0017
      TabIndex        =   0
      Text            =   "Adult"
      Top             =   480
      Width           =   1815
   End
   Begin VB.Label lblNumberOfTickets 
      BackColor       =   &H8000000E&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2040
      TabIndex        =   8
      Top             =   3360
      Width           =   1935
   End
   Begin VB.Label lblTicketPrompt 
      BackColor       =   &H8000000E&
      Caption         =   "Tickets purchased:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2040
      TabIndex        =   7
      Top             =   2760
      Width           =   1935
   End
   Begin VB.Label lblCost 
      BackColor       =   &H8000000E&
      Caption         =   "$0.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2040
      TabIndex        =   6
      Top             =   2160
      Width           =   1935
   End
   Begin VB.Label lblTicketCost 
      Caption         =   "That will be: $11.00"
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
      Left            =   2040
      TabIndex        =   2
      Top             =   480
      Width           =   1935
   End
   Begin VB.Label lblPrompt 
      Caption         =   "Please select a ticket type to be purchased."
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
      Top             =   120
      Width           =   3855
   End
   Begin VB.Label lblTicketCostPrompt 
      BackColor       =   &H8000000E&
      Caption         =   "Your total cost is:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2040
      TabIndex        =   9
      Top             =   1800
      Width           =   1935
   End
End
Attribute VB_Name = "frmTicketCounter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: April 18 2014
'Purpose: To create a program which allows you to purchase tickets.
Option Explicit
Dim sglCost As Single
Dim intTickets As Integer
Private Sub cboTicket_Click()
If cboTicket.Text = "Adult" Then
    lblTicketCost.Caption = "That will be: $11.00"
ElseIf cboTicket.Text = "Senior" Then
    lblTicketCost.Caption = "That will be: $8.00"
ElseIf cboTicket.Text = "Student" Then
    lblTicketCost.Caption = "That will be: $6.50"
ElseIf cboTicket.Text = "Child" Then
    lblTicketCost.Caption = "That will be: $4.75"
ElseIf cboTicket.Text = "Coupon" Then
    lblTicketCost.Caption = "That will be: Free!"
Else:
    lblTicketCost.Caption = "That is an invalid ticket type."
End If
End Sub

Private Sub cmdAdd_Click()
If cboTicket.Text = "Adult" Then
    lstTicket.AddItem "Adult"
    sglCost = sglCost + 11
ElseIf cboTicket.Text = "Senior" Then
    lstTicket.AddItem "Senior"
    sglCost = sglCost + 8
ElseIf cboTicket.Text = "Student" Then
    lstTicket.AddItem "Student"
    sglCost = sglCost + 6.5
ElseIf cboTicket.Text = "Child" Then
    lstTicket.AddItem "Child"
    sglCost = sglCost + 4.75
ElseIf cboTicket.Text = "Coupon" Then
    lstTicket.AddItem "Coupon"
End If

intTickets = intTickets + 1
lblCost.Caption = "$" & Format(sglCost, "0.00")
lblNumberOfTickets.Caption = intTickets
    
End Sub

Private Sub cmdReset_Click()
sglCost = 0
intTickets = 0
lblCost.Caption = "$0.00"
lblNumberOfTickets.Caption = "0"
cboTicket.Text = "Adult"
lblTicketCost.Caption = "That will be: $11.00"
lstTicket.Clear
End Sub

Private Sub Form_Load()
sglCost = 0
intTickets = 0
End Sub

