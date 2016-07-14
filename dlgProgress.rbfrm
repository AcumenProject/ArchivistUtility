#tag Window
Begin Window dlgProgress
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   2
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   1.5e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   4.0e+2
   Begin ProgressBar progress
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Maximum         =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   46
      Value           =   0
      Visible         =   True
      Width           =   360
   End
   Begin StaticText maintask
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   360
   End
   Begin StaticText update
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   11
      Top             =   78
      Underline       =   ""
      Visible         =   True
      Width           =   360
   End
   Begin PushButton StopButton
      AutoDeactivate  =   True
      Bold            =   ""
      Cancel          =   True
      Caption         =   "Stop"
      Default         =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   160
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   110
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events maintask
	#tag Event
		Sub Open()
		  me.caption = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events update
	#tag Event
		Sub Open()
		  me.caption = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  self.hide
		End Sub
	#tag EndEvent
#tag EndEvents
