#tag Class
Protected Class BatchSpreadsheetToXML
Inherits thread
	#tag Event
		Sub Run()
		  dim file_index, row_index as integer
		  dim f as folderitem
		  dim data as spreadsheet
		  dim t as string
		  dim d as dlgProgress
		  
		  if dest = nil then
		    dest = SelectFolder()
		    if dest = nil then
		      return
		    end if
		  end if
		  
		  if not dest.IsWriteable or not dest.directory or not dest.exists then
		    ReportError "Cannot write files to " + dest.name, false
		    return
		  end if
		  
		  d = new dlgProgress
		  d.progress.Maximum = fileList.ubound + 1
		  d.maintask.caption = "Processing"
		  d.left = (caller.width - d.width) * 0.5 + caller.left
		  d.top = (caller.height - d.Height) * 0.5 + caller.top
		  d.Show
		  for file_index = 0 to fileList.ubound
		    f = fileList(file_index)
		    d.maintask.caption = "Processing " + f.name
		    d.progress.value = file_index
		    data = new spreadsheet( f, AutoEncoding(f, defaultEncoding) )
		    for row_index = 1 to data.rowcount - 1
		      d.Update.Caption = "Row " + str(row_index) + " of " + str( data.rowcount - 1 )
		      d.refresh
		      t = SpreadsheetAndTemplateToXML( data, template, row_index, errorList, dest, "Filename", output_filename_extension, true )
		      if not d.visible then
		        exit for
		      end if
		    next
		    
		    if not d.visible then
		      exit for
		    end if
		  next
		  d.close
		  
		  if Caller isA ThreadCaller then
		    ThreadCaller(Caller).ThreadDone
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(theFileList() as folderItem, theTemplate as string, theDestination as FolderItem, theErrorList() as string, theDefaultEncoding as string, theCaller as Window, filename_extension as string = "xml")
		  fileList = theFileList
		  template = theTemplate
		  theDestination = theDestination
		  errorList = theErrorList
		  defaultEncoding = theDefaultEncoding
		  caller = theCaller
		  output_filename_extension = filename_extension
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		caller As Window
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultEncoding As string
	#tag EndProperty

	#tag Property, Flags = &h0
		dest As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		errorList() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		fileList() As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		output_filename_extension As String = "xml"
	#tag EndProperty

	#tag Property, Flags = &h0
		template As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			InheritedFrom="thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="caller"
			Group="Behavior"
			InitialValue="0"
			Type="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultEncoding"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="template"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
