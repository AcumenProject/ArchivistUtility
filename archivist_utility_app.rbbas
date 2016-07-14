#tag Class
Protected Class archivist_utility_app
Inherits Application
	#tag Event
		Sub Open()
		  #if TargetMacOS
		    prefs_file = SpecialFolder.Preferences.Child("Archivist Utility.plist")
		  #else
		    prefs_file = SpecialFolder.Preferences.Child("Archivist Utility.xml")
		  #endif
		  
		  LoadPrefs
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function About() As Boolean Handles About.Action
			Msgbox app.versionstring + chr(10) + chr(10) + "Copyright ©2009 University of Alabama" + chr(10) + "Written by Tonio Loewald <taloewald@ua.edu>"
			
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewSpreadsheetXSLXMLWindow() As Boolean Handles FileNewSpreadsheetXSLXMLWindow.Action
			NewXMLGenerator
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewXMLXSLHTMLWindow() As Boolean Handles FileNewXMLXSLHTMLWindow.Action
			NewXSLEditor
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileQuit() As Boolean Handles FileQuit.Action
			SavePrefs
			
			Return False
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub LoadPrefs()
		  dim prefs as XmlDocument
		  dim t as string
		  dim input as TextInputStream
		  dim window_list as XmlNodeList
		  dim window_spec as XmlNode
		  dim w as window
		  dim i as integer
		  
		  if not prefs_file.exists then
		    Raise New RuntimeException
		  end if
		  
		  input = prefs_file.OpenAsTextFile
		  t = input.readAll
		  input.close
		  
		  prefs = new XmlDocument
		  prefs.loadXml( t )
		  
		  window_list = prefs.Child(0).Xql(".//windows/window")
		  for i = 0 to window_list.Length - 1
		    window_spec = window_list.item(i)
		    select case window_spec.GetAttribute("class")
		    case "XSL_Editor"
		      w = new XSL_Editor
		    case "XML_Generator"
		      w = new XML_Generator
		    end select
		    w.left = val( window_spec.GetAttribute("x") )
		    w.top = val( window_spec.GetAttribute("y") )
		    w.width = val( window_spec.GetAttribute("w") )
		    w.height = val( window_spec.GetAttribute("h") )
		  next
		  
		Exception
		  NewXSLEditor
		  NewXMLGenerator
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewXMLGenerator()
		  dim w as window
		  
		  w = new XML_Generator
		  w.show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewXSLEditor()
		  dim w as window
		  
		  w = new XSL_Editor
		  w.show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SavePrefs()
		  dim output as TextOutputStream
		  dim i as integer
		  dim w as window
		  dim t as string
		  
		  t = "<?xml version=""1.0"" encoding=""UTF-8""?>"
		  t = t + "<prefs>"
		  t = t + "<windows>"
		  for i = windowcount - 1 downTo 0
		    w = window(i)
		    t = t + "<window class=""" + w.className + """"
		    t = t + " x=""" + str(w.left) + """"
		    t = t + " y=""" + str(w.top) + """"
		    t = t + " w=""" + str(w.width) + """"
		    t = t + " h=""" + str(w.height) + """/>"
		  next
		  t = t + "</windows>"
		  t = t + "</prefs>"
		  
		  t = PrettierXML( t )
		  
		  output = prefs_file.CreateTextFile
		  output.write t
		  output.close
		  
		  #if DebugBuild
		    prefs_file.parent.launch
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		prefs_file As folderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return "Archivist Utility v" + app.ShortVersion + ", (built: " + app.BuildDate.shortDate + ")"
			End Get
		#tag EndGetter
		versionstring As string
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="versionstring"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
