VERSION 5.00
Begin VB.Form frmVolume 
   BackColor       =   &H00FFFFC0&
   Caption         =   "Volume Calculator"
   ClientHeight    =   7215
   ClientLeft      =   675
   ClientTop       =   750
   ClientWidth     =   8535
   LinkTopic       =   "Form1"
   ScaleHeight     =   7215
   ScaleWidth      =   8535
   Begin VB.Frame fraSphere 
      Caption         =   "Sphere"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6735
      Left            =   2640
      TabIndex        =   17
      Top             =   360
      Width           =   5775
      Begin VB.TextBox txtSphereRadius 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2880
         TabIndex        =   33
         Top             =   960
         Width           =   2535
      End
      Begin VB.PictureBox picSphereSurfaceArea 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2760
         ScaleHeight     =   555
         ScaleWidth      =   2475
         TabIndex        =   32
         Top             =   5760
         Width           =   2535
      End
      Begin VB.PictureBox picSphereVolume 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2760
         ScaleHeight     =   555
         ScaleWidth      =   2475
         TabIndex        =   31
         Top             =   5040
         Width           =   2535
      End
      Begin VB.CommandButton cmdSphereCalculate 
         Caption         =   "Calculate!"
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
         Left            =   240
         TabIndex        =   28
         Top             =   3720
         Width           =   5175
      End
      Begin VB.Label lblSphereSurfaceArea 
         Caption         =   "Surface Area"
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
         Left            =   240
         TabIndex        =   30
         Top             =   5760
         Width           =   3615
      End
      Begin VB.Label lblSphereVolume 
         Caption         =   "Volume"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   29
         Top             =   5040
         Width           =   2535
      End
      Begin VB.Label lblSphereRadius 
         Caption         =   "Radius"
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
         Left            =   480
         TabIndex        =   27
         Top             =   960
         Width           =   2175
      End
   End
   Begin VB.Frame fraCylinder 
      Caption         =   "Cylinder"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6735
      Left            =   2640
      TabIndex        =   16
      Top             =   360
      Width           =   5775
      Begin VB.PictureBox picCylinderSurfaceArea 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2760
         ScaleHeight     =   555
         ScaleWidth      =   2475
         TabIndex        =   26
         Top             =   5760
         Width           =   2535
      End
      Begin VB.PictureBox picCylinderVolume 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2760
         ScaleHeight     =   555
         ScaleWidth      =   2475
         TabIndex        =   25
         Top             =   5040
         Width           =   2535
      End
      Begin VB.TextBox txtCylinderHeight 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2880
         TabIndex        =   24
         Top             =   1920
         Width           =   2535
      End
      Begin VB.TextBox txtCylinderRadius 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2880
         TabIndex        =   23
         Top             =   960
         Width           =   2535
      End
      Begin VB.CommandButton cmdCylinderCalculate 
         Caption         =   "Calculate!"
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
         Left            =   240
         TabIndex        =   20
         Top             =   3720
         Width           =   5175
      End
      Begin VB.Label lblCylinderSurfaceArea 
         Caption         =   "Surface Area"
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
         Left            =   240
         TabIndex        =   22
         Top             =   5760
         Width           =   2895
      End
      Begin VB.Label lblCylinderVolume 
         Caption         =   "Volume"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   555
         Left            =   240
         TabIndex        =   21
         Top             =   5040
         Width           =   1845
      End
      Begin VB.Label lblCylinderHeight 
         Caption         =   "Height"
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
         Left            =   480
         TabIndex        =   19
         Top             =   1920
         Width           =   2415
      End
      Begin VB.Label lblCylinderRadius 
         Caption         =   "Radius"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   480
         TabIndex        =   18
         Top             =   960
         Width           =   2175
      End
   End
   Begin VB.Frame fraBox 
      Caption         =   "Box"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6735
      Left            =   2640
      TabIndex        =   4
      Top             =   360
      Width           =   5775
      Begin VB.PictureBox picBoxSurfaceArea 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2760
         ScaleHeight     =   555
         ScaleWidth      =   2475
         TabIndex        =   15
         Top             =   5760
         Width           =   2535
      End
      Begin VB.PictureBox picBoxVolume 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2760
         ScaleHeight     =   555
         ScaleWidth      =   2475
         TabIndex        =   14
         Top             =   5040
         Width           =   2535
      End
      Begin VB.CommandButton cmdBoxCalculate 
         Caption         =   "Calculate!"
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
         Left            =   240
         TabIndex        =   11
         Top             =   3720
         Width           =   5175
      End
      Begin VB.TextBox txtBoxHeight 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2880
         TabIndex        =   10
         Top             =   2880
         Width           =   2535
      End
      Begin VB.TextBox txtBoxWidth 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2880
         TabIndex        =   9
         Top             =   1920
         Width           =   2535
      End
      Begin VB.TextBox txtBoxLength 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2880
         TabIndex        =   8
         Top             =   960
         Width           =   2535
      End
      Begin VB.Label lblBoxSurfaceArea 
         Caption         =   "Surface Area"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   13
         Top             =   5760
         Width           =   2295
      End
      Begin VB.Label lblBoxVolume 
         Caption         =   "Volume"
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
         Left            =   240
         TabIndex        =   12
         Top             =   5040
         Width           =   2655
      End
      Begin VB.Label lblBoxHeight 
         Caption         =   "Height"
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
         Left            =   480
         TabIndex        =   7
         Top             =   2880
         Width           =   1695
      End
      Begin VB.Label lblBoxWidth 
         Caption         =   "Width"
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
         Left            =   480
         TabIndex        =   6
         Top             =   1920
         Width           =   1575
      End
      Begin VB.Label lblBoxLength 
         Caption         =   "Length"
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
         Left            =   480
         TabIndex        =   5
         Top             =   960
         Width           =   2055
      End
   End
   Begin VB.Frame fraObject 
      Caption         =   "Objects"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   1935
      Begin VB.OptionButton optBox 
         Caption         =   "Box"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   720
         Width           =   1095
      End
      Begin VB.OptionButton optSphere 
         Caption         =   "Sphere"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   450
         Left            =   120
         TabIndex        =   3
         Top             =   2520
         Width           =   1575
      End
      Begin VB.OptionButton optCylinder 
         Caption         =   "Cylinder"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   675
         Left            =   120
         TabIndex        =   2
         Top             =   1440
         Width           =   1455
      End
   End
   Begin VB.Image imgDisplay 
      Height          =   2535
      Left            =   120
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   1935
   End
End
Attribute VB_Name = "frmVolume"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Author: Mohit Patel
' Date: March 3 2014
' Purpose: To show the volumes of various 3D objects.
Option Explicit


Private Sub cmdBoxCalculate_Click()
'Declaration:
Dim sglWidth As Single
Dim sglLength As Single
Dim sglHeight As Single
Dim sglRadius As Single
Dim sglSurfaceArea As Single
Dim sglVolume As Single
'Initialization:
sglWidth = 0
sglLength = 0
sglHeight = 0
sglRadius = 0
sglSurfaceArea = 0
sglVolume = 0
'Input:
sglWidth = Val(txtBoxWidth.Text)
sglLength = Val(txtBoxLength.Text)
sglHeight = Val(txtBoxHeight.Text)
'Process
sglSurfaceArea = (2 * ((sglLength * sglWidth) + (sglWidth * sglHeight) + (sglLength * sglHeight)))
sglVolume = sglLength * sglHeight * sglWidth
'Output:
picBoxVolume.Cls
picBoxSurfaceArea.Cls
picBoxVolume.Print ; sglVolume; "units cubed."
picBoxSurfaceArea.Print ; sglSurfaceArea; "units squared."
End Sub

Private Sub cmdCylinderCalculate_Click()
'Declaration:
Dim sglHeight As Single
Dim sglRadius As Single
Dim sglSurfaceArea As Single
Dim sglVolume As Single
Dim dblPi As Double
'Initialization:
sglHeight = 0
sglRadius = 0
sglSurfaceArea = 0
sglVolume = 0
dblPi = 3.14159265358
'Input:
sglHeight = Val(txtCylinderHeight.Text)
sglRadius = Val(txtCylinderRadius.Text)
'Process
sglSurfaceArea = (2 * dblPi * (sglRadius ^ 2)) + (2 * dblPi * sglRadius * sglHeight)
sglVolume = dblPi * (sglRadius ^ 2) * sglHeight
'Output:
picCylinderVolume.Cls
picCylinderSurfaceArea.Cls
picCylinderVolume.Print ; sglVolume; "units cubed."
picCylinderSurfaceArea.Print ; sglSurfaceArea; "units squared."
End Sub

Private Sub cmdSphereCalculate_Click()
'Declaration:
Dim sglRadius As Single
Dim sglSurfaceArea As Single
Dim sglVolume As Single
Dim dblPi As Double
'Initialization:
sglRadius = 0
sglSurfaceArea = 0
sglVolume = 0
dblPi = 3.14159265358
'Input:
sglRadius = Val(txtSphereRadius.Text)
'Process
sglSurfaceArea = (4 * dblPi * (sglRadius ^ 2))
sglVolume = ((4 / 3) * dblPi * (sglRadius ^ 3))
'Output:
picSphereVolume.Cls
picSphereSurfaceArea.Cls
picSphereVolume.Print ; sglVolume; "units cubed."
picSphereSurfaceArea.Print ; sglSurfaceArea; "units cubed."
End Sub

Private Sub optBox_Click()
fraBox.Visible = True
fraCylinder.Visible = False
fraSphere.Visible = False
imgDisplay.Picture = LoadPicture(App.Path & "\box.gif")

End Sub

Private Sub optCylinder_Click()
fraBox.Visible = False
fraCylinder.Visible = True
fraSphere.Visible = False
imgDisplay.Picture = LoadPicture(App.Path & "\cylinder.gif")
End Sub

Private Sub optSphere_Click()
fraBox.Visible = False
fraCylinder.Visible = False
fraSphere.Visible = True
imgDisplay.Picture = LoadPicture(App.Path & "\sphere.gif")
End Sub


