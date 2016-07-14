#tag Module
Protected Module Archive_Utilities
	#tag Method, Flags = &h0
		Function CleanKey(key as String) As string
		  // strip (s) from field name
		  if key.right(3) = "(s)" then
		    return key.left(key.len - 3)
		  else
		    return key
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EvaluateBoolean(expression as string, values as Dictionary, errorList() as string) As boolean
		  // Evaluates boolean expressions based on the content of values (if a value is present and non-empty, it counts as true)
		  // If passed an atomic expression (a dictionary entry name), returns true if it's present and non-empty
		  // If passed !
		  
		  dim rg as new RegEx
		  dim match as RegExMatch
		  dim result as boolean
		  dim token, key, lhs, rhs as string
		  
		  // Tokenizer
		  // Atomic value can be foobar, !foobar, or !foobar(s)
		  rg.SearchPattern = "[!]{0,1}([\w\s]+(\(s\)){0,1})|[!]{0,1}\(([^\)^(]+(\(s\)){0,1})+\)|&&|\|\|"
		  
		  while expression <> ""
		    match = rg.search( expression )
		    if match.SubExpressionStartB(0) <> 0 then
		      if errorList <> nil then
		        errorList.append "Error: bad boolean expression: " + expression + " (expected token)"
		      end if
		      return false
		    else
		      token = match.subExpressionString(0)
		      select case token
		      case "&&"
		        if not result then
		          return false
		        end if
		      case "||"
		        if result then
		          return true
		        end if
		      case else
		        if token.left(1) = "(" or token.left(2) = "!(" then
		          if token.right(1) <> ")" then
		            errorList.append "Error: ( without ): " + expression
		            return false
		          else
		            if token.left(1) = "(" then
		              result = EvaluateBoolean( token.mid( 2, token.len - 2 ), values, errorList )
		            else
		              result = not EvaluateBoolean( token.mid( 3, token.len - 3 ), values, errorList )
		            end if
		          end if
		        else
		          if token.left(1) = "!" then
		            key = CleanKey( token.mid(2) )
		            result = not(values.hasKey(key) and values.value(key) <> "")
		          else
		            key = CleanKey( token )
		            result = values.hasKey(key) and values.value(key) <> ""
		          end if
		        end if
		      end select
		    end if
		    expression = mid( expression, len( token ) + 1 )
		  wend
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PopulateTemplate(template as string, values as dictionary, error_list() as string, error_prefix as string = "Error: ", source_info as string = "Not Available", encoding_info as string = "Not Available") As string
		  dim output as string
		  dim rg as new RegEx
		  dim match as RegExMatch
		  dim command, literal as string
		  dim i, j as integer
		  dim key, insertion as string
		  dim chunks(), commands(), literals(), parts() as string
		  dim value_list() as string
		  dim params() as string
		  dim used as new Dictionary
		  dim fatal_error as boolean = false
		  dim error_message as string
		  dim missing_columns(-1) as string
		  dim first_new_error as integer
		  
		  first_new_error = ubound( error_list ) + 1
		  
		  chunks = template.lines( "{{" )
		  redim commands( chunks.ubound )
		  redim literals( chunks.ubound )
		  
		  for i = 0 to chunks.ubound
		    parts = chunks(i).lines( "}}" )
		    select case parts.ubound
		    case 0
		      if i = 0 then
		        commands(i) = ""
		        literals(i) = parts(0)
		      else
		        error_list.append error_prefix + "{{ without }}:" + chunks(i)
		        fatal_error = true
		      end if
		    case 1
		      if i = 0 then
		        error_list.append error_prefix + "}} without {{:" + chunks(i)
		        fatal_error = true
		      else
		        commands(i) = parts(0)
		        literals(i) = parts(1)
		      end if
		    case else
		      error_list.append error_prefix + "}} without {{:" + chunks(i)
		      fatal_error = true
		    end select
		  next
		  
		  if fatal_error then
		    error_list.append "Fatal Error(s): could not proceed"
		    return ""
		  end if
		  
		  // a template value can be %keyword{:parameter}% or %column_name%
		  // rg.SearchPattern = "%(([\w\s\(\)]+)(:([^:^%]*))*)%"
		  // pattern would now be "{{(([\w\s\(\)]+)(:([^:^%]*))*)}}" --  but it's no longer needed!
		  
		  for i = 0 to chunks.ubound
		    command = commands(i)
		    literal = literals(i)
		    key = ""
		    insertion = ""
		    
		    params = command.split(":")
		    if params.ubound = -1 then
		      params.append ""
		    end if
		    
		    select case params(0)
		    case ""
		    case "req"
		      key = CleanKey( params(1) )
		      if not values.hasKey(key) and values.value(key) <> "" then
		        error_list.append error_prefix + "REQUIRED value not found: " + command
		      end if
		    case "if"
		      if params.ubound < 1 then
		        error_list.append error_prefix + "IF missing condition (and value if true): " + command
		      elseif EvaluateBoolean( params(1), values, error_list ) then
		        if params.ubound < 2 then
		          error_list.append error_prefix + "IF missing value if true: " + command
		        else
		          key = CleanKey( params(2) )
		        end if
		      else
		        if params.ubound > 2 then
		          key = CleanKey( params(3) )
		        end if
		      end if
		    case "for"
		      if params.ubound < 1 then
		        error_list.append error_prefix + "FOR has no specified column: " + command
		      else
		        key = CleanKey( params(1) )
		        if used.hasKey( key ) then
		          used.value( key ) = used.value( key ) + 1
		        else
		          used.value( key ) = 1
		        end if
		        if values.hasKey( key ) and values.value( key ) <> "" then
		          values.value( "_FOR_" + key) = i // where each has to loop back to
		          value_list = split( replaceAll( values.value(key), params(2), chr(30) ), chr(30) )
		          // We don't want to iterate for empty values
		          RemoveEmptyCells( value_list )
		          values.value( "_EACH_" + key ) = value_list
		        else
		          // We skip to the NEXT
		          while i <= chunks.ubound
		            if commands(i).left(5) = "NEXT:" then
		              if CleanKey( nthField(commands(i), ":", 2) ) = key then
		                exit while
		              end if
		            end if
		            i = i + 1
		          wend
		          if i > chunks.ubound then
		            error_list.append error_prefix + "FOR without NEXT: " + command
		          else
		            literal = literals(i)
		          end if
		        end if
		        // prevent key from being counted twice
		        key = ""
		      end if
		    case "each"
		      if params.ubound < 1 then
		        error_list.append error_prefix + "EACH has no specified column: " + command
		      else
		        key = CleanKey( params(1) )
		        if values.hasKey( "_EACH_" + key ) then
		          value_list = values.value( "_EACH_" + key )
		          if value_list.ubound > -1 then
		            key = "'" + value_list(0).ReplaceXmlEntities + "'"
		          end if
		        else
		          error_list.append error_prefix + "EACH without FOR: " + command
		        end if
		      end if
		    case "next"
		      if params.ubound < 1 then
		        error_list.append error_prefix + "NEXT requires iteration parameter: " + command
		      else
		        key = CleanKey( params(1) )
		        if values.hasKey( "_FOR_" + key ) then
		          value_list = values.value("_EACH_" + key)
		          if value_list.ubound > 0 then
		            value_list.remove(0)
		            values.value( "_EACH_" + key ) = value_list // should be unnecessary
		            // loop back (note that we go to the for line
		            i = values.value( "_FOR_" + key )
		            // we do NOT want the chunk after NEXT (yet), but
		            // we DO need the chunk after the FOR
		            literal = literals(i)
		            // we'll increment before the FOR gets executed
		            // (so effectively we're heading to the next chunk after the FOR)
		          else
		            values.remove( "_FOR_" + key )
		            values.remove( "_EACH_" + key )
		          end if
		          // Now we make sure the key doesn't get overcounted
		          key = ""
		        else
		          error_list.append error_prefix + "NEXT without FOR: " + command
		        end if
		      end if
		    case else
		      if params.ubound > 0 then
		        error_list.append error_prefix + "unrecognized token: " + command
		      else
		        key = CleanKey( params(0) )
		      end if
		    end select
		    
		    if key.left(1) = """" or key.left(1) = "'" then
		      if key.left(1) = key.right(1) then
		        insertion = key.mid(2, len(key) - 2)
		      else
		        error_list.append error_prefix + "bad literal (?) in template: " + command
		      end if
		    elseif key.left(2) = "__" then
		      insertion = TemplateSystemVariable( key, values, used, error_list, first_new_error, source_info, encoding_info )
		    elseif key <> "" then
		      insertion = TemplateVariable( key, values, used, missing_columns )
		    end if
		    
		    output = output + insertion + literal
		  next
		  
		  error_message = UnusedColumns( values, used )
		  if error_message <> "" then
		    error_list.append error_prefix + "Unused Columns (" + error_message + ")"
		  end if
		  
		  if missing_columns.ubound > -1 then
		    error_message = implode( missing_columns, ", " )
		    error_list.append "Warning: Missing Columns (" + error_message + ")"
		  end if
		  
		  return output
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SpreadsheetAndTemplateToXML(data as spreadsheet, template as string, row as integer, error_list() as string, saveToFolder as folderItem, filenameField as string = "Filename", saveToExtension as string = "xml", overwrite as boolean = true) As string
		  dim d as new Dictionary
		  dim i as integer
		  dim t as string
		  dim f as folderItem
		  dim output as TextOutputStream
		  dim error_prefix as string
		  
		  if d.hasKey(filenameField) and d.value(filenameField) <> "" then
		    error_prefix = "Error (source: " + data.name + " row: " + str(row) + " dest: " + d.value(filenameField) + "): "
		  else
		    error_prefix = "Error (" + data.name + " row " + str(row) + "): "
		  end if
		  
		  for i = 0 to data.colcount - 1
		    d.value( data.cell(0, i) ) = data.cell(row, i).trim
		  next
		  
		  t = PopulateTemplate( template, d, error_list, error_prefix, data.name + " row(" + str(row) + ")", data.encoding )
		  
		  t = TrimXML( t, error_list, error_prefix )
		  
		  t = PrettierXML( t )
		  
		  t = ReplaceAll( t, chr(9), "  " )
		  
		  if saveToFolder <> nil then
		    if saveToFolder.exists and saveToFolder.directory then
		      if d.hasKey(filenameField) and d.value(filenameField) <> "" then
		        f = saveToFolder.child( d.value(filenameField) + "." + saveToExtension )
		        if f.exists and not overwrite then
		          Report "Skipped row, " + f.name + " already exists."
		        else
		          output = f.CreateTextFile
		          output.write t
		          output.close
		          Report "Saved XML to " + f.name
		        end if
		      else
		        ReportError error_prefix + "cannot save XML, filename column (" + filenameField + ") does not exist or is empty.", false, error_list
		      end if
		    else
		      ReportError error_prefix + "cannot save XML, destination folder does not exist.", true, error_list
		    end if
		  end if
		  
		  return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TemplateSystemVariable(key as string, values as dictionary, used as dictionary, error_list() as string, first_new_error as integer, source_info as String, encoding_info as string) As String
		  select case key.mid(3)
		  case "generator"
		    return app.LongVersion
		  case "source"
		    return source_info
		  case "timestamp"
		    dim d as new date
		    return d.shortdate + " " + d.shorttime
		  case "encoding"
		    return encoding_info
		  case "errors"
		    if first_new_error > ubound(error_list) then
		      return "No Errors"
		    else
		      dim i as integer
		      dim s as string = ""
		      for i = first_new_error to ubound(error_list)
		        s = s + error_list(i).replaceXmlEntities(true) + chr(10)
		      next
		      return s
		    end if
		  case "unused"
		    return UnusedColumns( values, used, chr(10), true )
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TemplateVariable(key as string, values as dictionary, used as dictionary, missing_columns() as string) As string
		  if not values.hasKey( key ) then
		    missing_columns.append( key )
		    return ""
		  else
		    // Keep track of which keys are used and how often
		    if used.hasKey( key ) then
		      used.value( key ) = used.value( key ) + 1
		    else
		      used.value( key ) = 1
		    end if
		    
		    return values.value( key ).replaceXmlEntities
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnusedColumns(values as dictionary, used as dictionary, separator as string = ", ", verbose as boolean = false) As string
		  dim unused_columns(-1) as string
		  dim i as integer
		  dim key, value as string
		  
		  for i = 0 to values.Count - 1
		    key = values.key(i)
		    if not used.hasKey( key ) then
		      if values.value(key) <> "" then
		        if verbose then
		          value = values.value(key)
		          unused_columns.append( key + " (" + value.replaceXmlEntities(true, true) + ")" )
		        else
		          unused_columns.append( key )
		        end if
		      end if
		    end if
		  next
		  
		  if unused_columns.ubound > -1 then
		    return implode( unused_columns, separator )
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule
