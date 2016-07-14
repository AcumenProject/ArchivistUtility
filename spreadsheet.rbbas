#tag Class
Protected Class spreadsheet
	#tag Method, Flags = &h0
		Sub Constructor(file as folderitem, theEncoding as TextEncoding)
		  dim item_delim as string = chr(9)
		  dim input as TextInputStream
		  dim t as string
		  dim lines() as string
		  dim items() as string
		  dim row, col, col_count as integer
		  dim cell_count, max_cell_count as integer
		  dim msg as string
		  
		  sourceFile = file
		  sourceEncoding = theEncoding
		  
		  if file.name.right(4) = ".csv" then
		    item_delim = ","
		  end if
		  
		  input = file.OpenAsTextFile
		  t = input.readall( theEncoding )
		  input.close
		  
		  t = replaceAll(t, chr(13) + chr(10), chr(10) )
		  t = replaceAll(t, chr(13), chr(10) )
		  
		  lines = split( t, chr(10) )
		  items = split( lines(0), item_delim )
		  
		  // Remove empty rows
		  for row = lines.ubound downTo 0
		    if lines(row).trim = "" then
		      lines.remove row
		    end if
		  next
		  
		  // Remove heading rows
		  // We're assuming a heading row has only one non-empty cell
		  while lines.ubound > -1
		    items = split( lines(0), item_delim )
		    cell_count = 0
		    for each item as string in items
		      if item <> "" then cell_count = cell_count + 1
		    next
		    if cell_count > 1 then
		      exit while
		    else
		      lines.remove 0
		    end if
		  wend
		  
		  redim cell( lines.ubound, items.ubound )
		  
		  for row = 0 to lines.ubound
		    items = split( lines(row), item_delim )
		    for col = 0 to items.ubound
		      // remove leading and trailing white space
		      t = items( col )
		      if t.encoding <> encodings.utf8 then
		        t = t.ConvertEncoding( encodings.utf8 )
		      end if
		      t = trim(t)
		      // strip quotation marks from fields
		      if (t.left(1) = """" or t.left(1) = "'") and t.left(1) = t.right(1) then
		        t = t.mid(2,t.len - 2)
		        t = t.replaceAll( """""", """" )
		      end if
		      // strip (s) from column headings
		      if row = 0 then
		        t = CleanKey(t)
		      end if
		      if col > ubound( cell, 2 ) then
		        if t <> "" then
		          msg = "In """ + sourceFile.name +""", encountered (at least one) data row (" + str(row) + ") with more columns than the heading row."
		          msg = msg + chr(13) + chr(13)
		          msg = msg + "Cell Contents: """ + t + """"
		          ReportError msg, false
		          redim cell( ubound(cell, 1), col )
		        end if
		      else
		        cell( row, col ) = t
		      end if
		    next
		  next
		  
		Exception
		  ReportError "Could not load spreadsheet."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  SaveToFile sourceFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveToFile(f as FolderItem)
		  dim out as TextOutputStream
		  dim row, col as integer
		  dim s as string
		  
		  out = f.CreateTextFile
		  
		  if ubound( cell, 1 ) < 0 then
		    out.close
		    return
		  end if
		  
		  for row = 0 to ubound(cell, 1)
		    s = cell( row, 0 )
		    for col = 1 to ubound(cell, 2)
		      s = s + chr(9) + cell( row, col )
		    next
		    out.WriteLine( s )
		  next
		  
		  out.close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cell(-1,-1) As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ubound( cell, 2 ) + 1
			End Get
		#tag EndGetter
		colcount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			return sourceEncoding.internetName
		#tag EndNote
		#tag Getter
			Get
			  return sourceEncoding.internetName
			End Get
		#tag EndGetter
		encoding As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return sourceFile.name
			End Get
		#tag EndGetter
		name As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ubound( cell, 1 ) + 1
			End Get
		#tag EndGetter
		rowcount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		sourceEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h0
		sourceFile As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="colcount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="encoding"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rowcount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
