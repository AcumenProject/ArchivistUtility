#tag Window
Begin Window XSL_Editor
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   425
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1770782719
   MenuBarVisible  =   True
   MinHeight       =   300
   MinimizeButton  =   True
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   True
   Title           =   "XSL Editor"
   Visible         =   True
   Width           =   918
   Begin TabPanel tabWebpreview
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   614
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Browser\rSource"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   21
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   300
      Begin HTMLViewer WebView
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   363
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabWebpreview"
         Left            =   616
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         Top             =   54
         Visible         =   True
         Width           =   294
      End
      Begin TextArea SourceView
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         BackColor       =   16777215
         Bold            =   ""
         Border          =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   363
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "tabWebpreview"
         Italic          =   ""
         Left            =   616
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   True
         LockLeft        =   ""
         LockRight       =   ""
         LockTop         =   ""
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   ""
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   11
         Top             =   54
         Underline       =   ""
         UseFocusRing    =   False
         Visible         =   True
         Width           =   294
      End
   End
   Begin TextArea XMLview
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   400
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   4
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      Top             =   21
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   300
   End
   Begin TextArea XSLview
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   400
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   308
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   ""
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11
      Top             =   21
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   300
   End
   Begin StaticText xml_heading
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
      Left            =   4
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "XML View"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   0
      Underline       =   ""
      Visible         =   True
      Width           =   300
   End
   Begin StaticText xsl_heading
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
      Left            =   308
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "XSL View"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   0
      Underline       =   ""
      Visible         =   True
      Width           =   300
   End
   Begin StaticText web_heading
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
      Left            =   614
      LockBottom      =   ""
      LockedInPosition=   True
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Web Preview"
      TextAlign       =   1
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      Top             =   0
      Underline       =   ""
      Visible         =   True
      Width           =   300
   End
   Begin XSL_Editor_Toolbar XSL_Editor_Toolbar1
      Enabled         =   True
      Height          =   71
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   63
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   480
      Visible         =   True
      Width           =   599
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim font_name as string
		  
		  font_name = GetFont("Consolas;Bitstream Vera Sans Mono;Monaco;Courier")
		  
		  XMLview.textfont = font_name
		  XSLview.TextFont = font_name
		  SourceView.TextFont = font_name
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  g.foreColor = DarkTingeColor
		  g.PenWidth = 2
		  g.drawline 0, 0, g.width, 0
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  handle_resize
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  handle_resize
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub handle_resize()
		  dim w as integer
		  dim h as integer
		  
		  w = (self.width - 18) / 3
		  h = (self.height - 25)
		  
		  xml_heading.width = w
		  XMLview.width = w
		  XMLview.height = h
		  
		  xsl_heading.left = xml_heading.left + w + 5
		  xsl_heading.width = w
		  
		  XSLview.left = XMLview.left + w + 5
		  XSLview.width = w
		  XSLview.height = h
		  
		  web_heading.left = xsl_heading.left + w + 5
		  web_heading.width = w
		  
		  tabWebpreview.left = XSLview.left + w + 5
		  tabWebpreview.width = w
		  tabWebpreview.height = h
		  WebView.width = w - 6
		  WebView.height = h - 26
		  SourceView.width = w - 6
		  SourceView.height = h - 26
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		xml_file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		xsl_file As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events XSL_Editor_Toolbar1
	#tag Event
		Sub Action(item As ToolItem)
		  dim f as FolderItem
		  dim input as TextInputStream
		  dim output as TextOutputStream
		  dim xml_doc as XmlDocument
		  dim html as string
		  
		  select case item.Name
		  case "xml_load"
		    f = getOpenFolderItem(editor_files.xml)
		    if f <> nil then
		      xml_file = f
		      input = f.OpenAsTextFile
		      XMLview.text = input.readall
		      input.close
		    end if
		  case "xml_save"
		    if xml_file <> nil then
		      f = xml_file
		    else
		      f = GetSaveFolderItem(editor_files.xml, "untitled")
		    end if
		    if f <> nil then
		      output = f.CreateTextFile
		      output.write XMLview.text
		      output.close
		    end if
		  case "xsl_load"
		    f = getOpenFolderItem(editor_files.xsl)
		    if f <> nil then
		      xsl_file = f
		      input = f.OpenAsTextFile
		      XSLview.text = input.readall
		      input.close
		    end if
		  case "xsl_save"
		    if xsl_file <> nil then
		      f = xsl_file
		    else
		      f = GetSaveFolderItem(editor_files.xsl, "untitled")
		    end if
		    if f <> nil then
		      output = f.CreateTextFile
		      output.write XSLview.text
		      output.close
		    end if
		  case "update_preview"
		    if xml_file <> nil then
		      xml_doc = new XmlDocument
		      xml_doc.loadXML( XMLview.text )
		      html = xml_doc.transform( XSLview.text )
		      SourceView.text = html
		      WebView.LoadPage ( html, xml_file )
		    else
		      msgbox "You'll need to load (or save) your XML first."
		    end if
		  end select
		  
		Exception
		  Msgbox "Something bad happened. Sorry."
		End Sub
	#tag EndEvent
#tag EndEvents
