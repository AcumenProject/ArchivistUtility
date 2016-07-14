#tag Window
Begin Window XML_Generator Implements ThreadCaller
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.37e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1770782719
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   840
   Placement       =   0
   Resizeable      =   True
   Title           =   "XML Generator"
   Visible         =   True
   Width           =   857
   Begin XML_Generator_Toolbar XML_Generator_Toolbar1
      Enabled         =   True
      Height          =   64
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   65
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   481
      Visible         =   True
      Width           =   519
   End
   Begin PagePanel tabPreview
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   417
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   4
      Panels          =   ""
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   857
      Begin TextArea XML_output
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   392
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   0
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         ScrollbarHorizontal=   True
         ScrollbarVertical=   True
         Styled          =   ""
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   24
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   857
      End
      Begin Listbox Errors
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   False
         ColumnCount     =   1
         ColumnsResizable=   ""
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   ""
         HeadingIndex    =   -1
         Height          =   392
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         InitialValue    =   ""
         Italic          =   ""
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   24
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   857
         _ScrollWidth    =   -1
      End
      Begin StaticText spreadsheet_heading
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   189
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         Text            =   "No Data Loaded"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   2
         Underline       =   ""
         Visible         =   True
         Width           =   260
      End
      Begin StaticText template_heading
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   4
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         Text            =   "No Template is Loaded"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   2
         Underline       =   ""
         Visible         =   True
         Width           =   580
      End
      Begin StaticText preview_heading
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   4
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         Text            =   "No Output Has Been Generated"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   2
         Underline       =   ""
         Visible         =   True
         Width           =   849
      End
      Begin StaticText preview_heading1
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   4
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   4
         Text            =   "Error Log"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   2
         Underline       =   ""
         Visible         =   True
         Width           =   511
      End
      Begin StaticText spreadsheet_heading1
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   526
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         Text            =   "Row:"
         TextAlign       =   2
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   3
         Underline       =   ""
         Visible         =   True
         Width           =   37
      End
      Begin TextField tfRow
         AcceptTabs      =   ""
         Alignment       =   3
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   False
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   571
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   4
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   60
      End
      Begin StaticText spreadsheet_encoding
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   404
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   1
         Text            =   "Encoding"
         TextAlign       =   2
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   3
         Underline       =   ""
         Visible         =   True
         Width           =   117
      End
      Begin Listbox spreadsheet_view
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   False
         ColumnCount     =   2
         ColumnsResizable=   ""
         ColumnWidths    =   "200,1*"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   392
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         InitialValue    =   "Column Heading	Row Contents"
         Italic          =   ""
         Left            =   188
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   True
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   24
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   669
         _ScrollWidth    =   -1
      End
      Begin Listbox lstFiles
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   False
         ColumnCount     =   1
         ColumnsResizable=   ""
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   392
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         InitialValue    =   "File Name"
         Italic          =   ""
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollBarVertical=   True
         SelectionType   =   1
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   24
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   180
         _ScrollWidth    =   -1
      End
      Begin StaticText file_list_head
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   4
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   1
         Text            =   "Files"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   2
         Underline       =   ""
         Visible         =   True
         Width           =   66
      End
      Begin StaticText total_rows
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   791
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   1
         Text            =   0
         TextAlign       =   1
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   2
         Underline       =   ""
         Visible         =   True
         Width           =   60
      End
      Begin PopupMenu popDefaultEncoding
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         InitialValue    =   ""
         Italic          =   ""
         Left            =   82
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   3
         Underline       =   ""
         Visible         =   True
         Width           =   98
      End
      Begin TextArea Template
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   392
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   0
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   True
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   ""
         Scope           =   0
         ScrollbarHorizontal=   True
         ScrollbarVertical=   True
         Styled          =   ""
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   24
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   857
      End
      Begin BevelButton SaveLog
         AcceptFocus     =   False
         AutoDeactivate  =   True
         BackColor       =   ""
         Bevel           =   0
         Bold            =   False
         ButtonType      =   0
         Caption         =   "Save Log..."
         CaptionAlign    =   3
         CaptionDelta    =   0
         CaptionPlacement=   1
         Enabled         =   False
         HasBackColor    =   ""
         HasMenu         =   0
         Height          =   20
         HelpTag         =   ""
         Icon            =   ""
         IconAlign       =   0
         IconDX          =   0
         IconDY          =   0
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   False
         Left            =   773
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   True
         MenuValue       =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   4
         TabStop         =   True
         TextColor       =   ""
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   ""
         Top             =   3
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   80
      End
      Begin TextField Extension
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   False
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   773
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "mods.xml"
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   4
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   80
      End
      Begin StaticText StaticText1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   596
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         Text            =   "Output File Name Extension:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   3
         Underline       =   ""
         Visible         =   True
         Width           =   175
      End
      Begin Slider row_selector
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Left            =   643
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Minimum         =   1
         PageStep        =   1
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TickStyle       =   0
         Top             =   3
         Value           =   1
         Visible         =   True
         Width           =   144
      End
      Begin TextField ErrorFilter
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   False
         CueText         =   "filter text"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   18
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   545
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   4
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   160
      End
      Begin StaticText FilterCaption
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   ""
         Left            =   471
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   4
         Text            =   "Filter:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   0
         Top             =   3
         Underline       =   ""
         Visible         =   True
         Width           =   62
      End
      Begin BevelButton ErrorRefresh
         AcceptFocus     =   False
         AutoDeactivate  =   True
         BackColor       =   ""
         Bevel           =   0
         Bold            =   False
         ButtonType      =   0
         Caption         =   "Refresh"
         CaptionAlign    =   3
         CaptionDelta    =   0
         CaptionPlacement=   1
         Enabled         =   True
         HasBackColor    =   ""
         HasMenu         =   0
         Height          =   20
         HelpTag         =   ""
         Icon            =   ""
         IconAlign       =   0
         IconDX          =   0
         IconDY          =   0
         Index           =   -2147483648
         InitialParent   =   "tabPreview"
         Italic          =   False
         Left            =   708
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   True
         LockTop         =   True
         MenuValue       =   0
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   4
         TabStop         =   True
         TextColor       =   ""
         TextFont        =   "System"
         TextSize        =   11
         TextUnit        =   ""
         Top             =   3
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   60
      End
   End
   Begin StaticText Statusbar
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
      Left            =   4
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   11
      TextUnit        =   0
      Top             =   417
      Underline       =   ""
      Visible         =   True
      Width           =   833
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim font_name as string
		  
		  font_name = GetFont("Consolas;Bitstream Vera Sans Mono;Monaco;Courier")
		  
		  template.TextFont = font_name
		  XML_output.TextFont = font_name
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  g.foreColor = DarkTingeColor
		  g.PenWidth = 2
		  g.drawline 0, 0, g.width, 0
		  
		  g.penWidth = 1
		  g.drawLine 0, g.height - 21, g.width, g.height - 21
		  g.drawLine 0, g.height - 1, g.width, g.height - 1
		  g.foreColor = LightTingeColor
		  g.drawLine 0, g.height - 20, g.width, g.height - 20
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function BatchAddFile() As Boolean Handles BatchAddFile.Action
			PerformBatchlistCommand "Add File..."
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function BatchAddFolder() As Boolean Handles BatchAddFolder.Action
			PerformBatchlistCommand "Add Folder..."
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function BatchBatchProcessAll() As Boolean Handles BatchBatchProcessAll.Action
			PerformBatchlistCommand "Batch Process All..."
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function BatchBatchProcessSelected() As Boolean Handles BatchBatchProcessSelected.Action
			PerformBatchlistCommand "Batch Process Selected..."
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function BatchClearList() As Boolean Handles BatchClearList.Action
			PerformBatchlistCommand "Clear List"
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function BatchRemoveSelected() As Boolean Handles BatchRemoveSelected.Action
			PerformBatchlistCommand "Remove Selected"
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AddToList(f as FolderItem, list as Listbox)
		  dim i as integer
		  
		  if f = nil or not f.exists then
		    ReportError "Cannot add null item to list.", false
		    return
		  end if
		  
		  if f.name.left(1) = "." or not f.visible then
		    return
		  end if
		  
		  if f.directory then
		    for i = 1 to f.count
		      AddToList f.item(i), list
		    next
		  else
		    list.AddRow f.name
		    list.CellTag( list.LastIndex, 0 ) = f
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BatchProcess(fileList() as folderitem, dest as folderitem = nil)
		  dim t as BatchSpreadsheetToXML
		  
		  redim errorList(-1)
		  
		  if BatchThread <> nil then
		    if BatchThread.state <> Thread.NotRunning then
		      ReportError "Somehow, an old thread was still running. It is dead now.", false
		    end if
		    BatchThread.Kill
		  end if
		  
		  if not VerifySpreadsheetAndTemplate( true ) then
		    return
		  end if
		  
		  BatchThread = new BatchSpreadsheetToXML( fileList, template.text, dest, errorList, popDefaultEncoding.text, me, extension.text )
		  BatchThread.run
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListLaunch(list as Listbox)
		  dim f as folderitem
		  
		  if list.listindex > -1 then
		    f = folderitem( list.celltag(list.listindex, 0) )
		    
		    if f <> nil and f.exists then
		      f.launch
		    end if
		  else
		    ReportError "Cannot open file (nothing is selected).", false
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadFile(f as FolderItem)
		  if f = nil or not f.exists then
		    ReportError "Cannot load null or non-existent file.", false
		  end if
		  
		  data = new spreadsheet( f, AutoEncoding(f, popDefaultEncoding.text) )
		  spreadsheet_heading.caption = data.name
		  spreadsheet_encoding.caption = data.encoding
		  show_row 1
		  if data.rowcount > 0 then
		    row_selector.Maximum = data.rowcount
		    total_rows.caption = str( data.rowcount )
		    row_selector.enabled = true
		  else
		    total_rows.caption = "0"
		    row_selector.enabled = false
		  end if
		  
		  currentFile = f
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadTemplatefile(f as folderItem)
		  dim t as string
		  
		  t = f.LoadAllText
		  template_heading.caption = f.name
		  t = replaceAll( t, chr(9), "  " )
		  template.text = t
		  
		Exception
		  Msgbox "Error: could not load template file."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub lstFilesUpdate()
		  if lstFiles.listindex > -1 then
		    LoadFile FolderItem(lstFiles.cellTag(lstFiles.listindex, 0 ))
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformBatchlistCommand(command as String)
		  dim f as folderitem
		  dim i as integer
		  dim fileList(-1) as folderItem
		  
		  select case command
		  case "Add File..."
		    f = GetOpenFolderItem( editor_files.txt )
		    
		    if f <> nil then
		      AddToList f, lstFiles
		    end if
		  case "Add Folder..."
		    f = SelectFolder()
		    
		    if f <> nil then
		      AddToList f, lstFiles
		    end if
		  case "Remove Selected"
		    for i = lstFiles.ListCount - 1 downTo 0
		      if lstFiles.Selected(i) then
		        lstFiles.RemoveRow(i)
		      end if
		    next
		  case "Clear List"
		    lstFiles.DeleteAllRows
		  case "Open"
		    ListLaunch lstFiles
		  case "Batch Process Selected..."
		    for i = 0 to lstFiles.ListCount - 1
		      if lstFiles.selected(i) then
		        fileList.append folderitem( lstFiles.cellTag(i, 0) )
		      end if
		    next
		    if fileList.ubound > -1 then
		      BatchProcess fileList
		    end if
		  case "Batch Process All..."
		    for i = 0 to lstFiles.ListCount - 1
		      fileList.append folderitem( lstFiles.cellTag(i, 0) )
		    next
		    if fileList.ubound > -1 then
		      BatchProcess fileList
		    end if
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub show_row(row as integer)
		  dim col as integer
		  
		  if row < 0 then
		    ReportError "Cannot show row: " + str(row), false
		    return
		  end if
		  
		  if tfRow.text <> str(row) then
		    tfRow.text = str(row)
		    tfRow.SelectAll
		  end if
		  
		  spreadsheet_view.DeleteAllRows
		  
		  spreadsheet_view.heading(1) = "Row " + str(row) + " Contents"
		  
		  if row < data.rowcount then
		    for col = 0 to data.colcount - 1
		      if data.cell(row, col) <> "" then
		        spreadsheet_view.addrow data.cell(0, col)
		        spreadsheet_view.cell( spreadsheet_view.lastindex, 1 ) = data.cell(row, col)
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ThreadDone()
		  // Part of the ThreadCaller interface.
		  
		  UpdateErrors
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateErrors()
		  dim i as integer
		  
		  errors.DeleteAllRows
		  if errorList.ubound = -1 then
		    Statusbar.caption = "No Errors"
		    SaveLog.enabled = false
		  else
		    for i = 0 to errorList.ubound
		      if ErrorFilter.text = "" or instr(errorList(i), ErrorFilter.text) > 0 then
		        Errors.addrow errorList(i)
		      end if
		    next
		    SaveLog.enabled = true
		    Statusbar.caption = "Errors (" + str(errors.listcount) + "/" + str(errorList.ubound + 1) + ")"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateXMLOutput()
		  redim errorList(-1)
		  
		  xml_output.text = SpreadsheetAndTemplateToXML( data, template.text, row_selector.value, errorList, nil )
		  preview_heading.caption = "Output from file “" + currentFile.name + "” row " + str(row_selector.Value) + " inserted into template “" + template_heading.caption + "”."
		  
		  UpdateErrors
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VerifySpreadsheetAndTemplate(dontNeedSpreadsheet as boolean = false) As boolean
		  if data = nil and not dontNeedSpreadsheet then
		    msgbox "Please load a spreadsheet first."
		    return false
		  end if
		  if template.text = "" then
		    msgbox "Please load a template."
		    return false
		  end if
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BatchThread As BatchSpreadsheetToXML
	#tag EndProperty

	#tag Property, Flags = &h0
		currentFile As folderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		data As spreadsheet
	#tag EndProperty

	#tag Property, Flags = &h0
		errorList() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplateMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		template_folder As folderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events XML_Generator_Toolbar1
	#tag Event
		Sub Action(item As ToolItem)
		  dim f as folderItem
		  dim batchList(-1) as folderItem
		  dim i as integer
		  dim t as string
		  
		  select case item.Name
		  case "tab0"
		    tabPreview.Value = 0
		  case "tab1"
		    tabPreview.Value = 1
		  case "tab2"
		    tabPreview.Value = 2
		  case "tab3"
		    tabPreview.Value = 3
		  case "LoadSpreadsheet"
		    f = GetOpenFolderItem( editor_files.txt )
		    if f <> nil then
		      LoadFile f
		    end if
		    tabPreview.Value = 0
		  case "LoadTemplate"
		    ' See DropDownMenuAction
		  case "UpdateOutput"
		    if not VerifySpreadsheetAndTemplate() then
		      return
		    end if
		    UpdateXMLOutput
		    tabPreview.Value = 2
		  case "ExportRows"
		    batchList.append currentFile
		    BatchProcess batchList
		  case "ProcessSelected"
		    PerformBatchlistCommand "Batch Process Selected..."
		  case "ProcessAll"
		    PerformBatchlistCommand "Batch Process All..."
		  end select
		  
		Exception
		  MsgBox "Error: " + item.Name + " failed."
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  dim f as folderItem
		  dim i as integer
		  dim b as ToolButton
		  dim menu, m as menuItem
		  
		  menu = new menuitem
		  template_folder = GetFolderItem( "Metadata Templates" )
		  
		  if not template_folder.exists then
		    template_folder.CreateAsFolder
		  end if
		  
		  if not template_folder.directory then
		    MsgBox "Error: cannot find or create Metadata Templates folder."
		    template_folder = nil
		    return
		  end if
		  
		  b = me.AddButton( "Load XML Template", "LoadXMLTemplate", loadxmltemplate, Toolbutton.ToolStyleDropDown )
		  
		  m = menu.AddItem("Load Template...")
		  m = menu.AddItem("-")
		  
		  for i = 1 to template_folder.count
		    f = template_folder.item(i)
		    if f.visible and f.name.left(1) <> "." and f.name.right(4) = ".xml" then
		      m = menu.AddItem(f.name)
		    end if
		  next
		  b.DropDownMenu = menu
		  TemplateMenu = menu
		  
		  b = me.AddButton( "Update Output", "UpdateOutput", previewxml )
		  me.AddSeparator( Toolbutton.ToolStyleFlexibleSpace )
		  b = me.AddButton( "Export All Rows", "ExportRows", batch )
		  me.AddSeparator
		  b = me.AddButton( "Process Selected", "ProcessSelected", batchselected )
		  b = me.AddButton( "Process All", "ProcessAll", batchall )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropDownMenuAction(item As ToolItem, hitItem As MenuItem)
		  dim i as integer
		  dim f as folderItem
		  dim input as TextInputStream
		  dim m as menuItem
		  
		  for i = 0 to TemplateMenu.Count - 1
		    TemplateMenu.Item(i).checked = false
		  next
		  
		  select case hitItem.text
		  case "Load Template..."
		    f = GetOpenFolderItem( editor_files.xml )
		    if f <> nil then
		      LoadTemplateFile f
		      tabPreview.Value = 1
		      if template_folder <> nil then
		        f.CopyFileTo template_folder
		        m = TemplateMenu.addItem(f.name, true, true)
		      end if
		    end if
		  case else
		    f = GetFolderItem( "Metadata Templates" )
		    hitItem.checked = true
		    LoadTemplateFile f.child(hitItem.text)
		    tabPreview.Value = 1
		  end select
		  
		Exception
		  MsgBox "Sorry, there was a problem."
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Errors
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if row < me.listcount and row >= 0 then
		    if me.cell(row, 0).left(5) = "Error" then
		      g.foreColor = rgb(255,192,192)
		      g.fillrect 0, 0, g.width, g.height
		    elseif me.cell(row, 0).left(7) = "Warning" then
		      g.foreColor = rgb(255,255,192)
		      g.fillrect 0, 0, g.width, g.height
		    end if
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tfRow
	#tag Event
		Sub TextChange()
		  dim i as integer
		  
		  i = val(me.text)
		  
		  if i >= row_selector.Minimum and i <= row_selector.Maximum then
		    row_selector.value = i
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  dim i as integer
		  
		  i = val(me.text)
		  
		  if i < row_selector.Minimum then
		    me.text = str(row_selector.Minimum)
		  elseif i > row_selector.Maximum then
		    me.text = str(row_selector.Maximum)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events spreadsheet_encoding
	#tag Event
		Sub Open()
		  me.caption = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events spreadsheet_view
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  if row >=0 and me.selected(row) then
		    if column = 0 then
		      g.drawpicture sidebar_selection, 0, 0, g.width, g.height, 0, 0, sidebar_selection.width, sidebar_selection.height
		    else
		      g.foreColor = &c404040
		      g.fillRect 0, 0, g.width, g.height
		    end if
		  else
		    if column = 0 then
		      g.foreColor = &cd1d7e2
		    else
		      g.foreColor = &cffffff
		    end if
		    g.fillRect 0, 0, g.width, g.height
		  end if
		  
		  if column = 0 then
		    g.foreColor = &c676a71
		    g.drawLine g.width - 1, 0, g.width - 1, g.height
		  end if
		  
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events lstFiles
	#tag Event
		Sub Open()
		  dim f as folderitem
		  
		  f = GetFolderItem("")
		  f = f.child("Spreadsheets")
		  
		  if f.exists and f.directory then
		    AddToList f, me
		  end if
		  
		  me.AcceptFileDrop( "????" )
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  do
		    if obj.FolderItemAvailable then
		      AddToList obj.FolderItem, me
		    end if
		  loop until not obj.nextItem
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  ListLaunch me
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  dim m as MenuItem
		  
		  m = base.addItem( "Add File..." )
		  m = base.addItem( "Add Folder..." )
		  m = base.addItem( "-" )
		  m = base.addItem( "Remove Selected" )
		  m = base.addItem( "Clear List" )
		  m = base.addItem( "-" )
		  m = base.addItem( "Open" )
		  m = base.addItem( "-" )
		  m = base.addItem( "Batch Process Selected..." )
		  m = base.addItem( "Batch Process All..." )
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  PerformBatchlistCommand hitItem.text
		End Function
	#tag EndEvent
	#tag Event
		Sub KeyUp(Key As String)
		  select case key
		  case chr(13)
		    PerformBatchlistCommand "Open"
		  case chr(8)
		    PerformBatchlistCommand "Remove Selected"
		  end select
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  lstFilesUpdate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popDefaultEncoding
	#tag Event
		Sub Open()
		  dim i as integer
		  dim s as string
		  
		  for i = 0 to encodings.Count - 1
		    s = encodings.item(i).internetName
		    select case s.nthField("-", 1)
		    case "UTF"
		      me.addRow s
		      if encodings.item(i).internetName = "UTF-8" then
		        me.listindex = i
		      end if
		    case "ISO"
		      me.addRow s
		    case "Windows"
		      me.addRow s
		    end select
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  lstFilesUpdate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveLog
	#tag Event
		Sub Action()
		  dim f as folderItem
		  dim d as new date
		  dim out as TextOutputStream
		  dim i as integer
		  
		  f = GetSaveFolderItem( editor_files.txt, "log " + d.ShortDate + " " + d.ShortTime + ".txt" )
		  
		  if f <> nil then
		    out = f.CreateTextFile
		    for i = 0 to errors.listcount - 1
		      out.WriteLine errors.list(i)
		    next
		    out.close
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events row_selector
	#tag Event
		Sub ValueChanged()
		  show_row me.value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ErrorRefresh
	#tag Event
		Sub Action()
		  UpdateErrors
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Statusbar
	#tag Event
		Sub Open()
		  me.caption = ""
		End Sub
	#tag EndEvent
#tag EndEvents
