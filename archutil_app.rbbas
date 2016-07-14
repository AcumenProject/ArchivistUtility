#tag Class
Protected Class archutil_app
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim i as integer
		  dim errors(-1) as string
		  dim t as string
		  dim template_text as string
		  
		  input_encoding = encodings.utf8
		  output_encoding = encodings.utf8
		  
		  // OPTIONS
		  for i = 3 to args.ubound
		    LoadOption( args(i) )
		  next
		  
		  ShowVersion
		  
		  // SHOW DOCS and quit if appropriate
		  ShowDocs args
		  
		  // SOURCE
		  src = GetFileOrQuit( args(1), "Source" )
		  
		  auto_encoding = sniffEncoding( src )
		  if auto_encoding <> "" then
		    print "Input Encoding Detected: " + auto_encoding
		    input_encoding = EncodingByName( auto_encoding )
		  end if
		  
		  Assert args.ubound > 1, "Missing argument, <template> path."
		  
		  template = GetFileOrQuit( args(2), "Template" )
		  
		  // DESTINATION
		  if args.ubound < 3 or args(3).left(1) = "-" then
		    dest = GetFolderItem("")
		  else
		    dest = GetFileOrQuit( args(3), "Destination", true )
		  end if
		  
		  print "Input Encoding: " + input_encoding.internetName
		  print "Output Encoding: " + output_encoding.internetName
		  if overwrite then
		    print "Overwrite is set to TRUE"
		  else
		    print "Overwrite is set to FALSE"
		  end if
		  if verbose then
		    print "Verbose is set to TRUE"
		  else
		    print "Verbose is set to FALSE"
		  end if
		  print "File name suffix: " + file_name_suffix
		  select case newline
		  case UnixLinefeeds
		    print "Newline format: UNIX (ASCII 10)"
		  case MacClassicLinefeeds
		    print "Newline format: Mac Class (ASCII 13)"
		  case DOSLineFeeds
		    print "Newline format: DOS (ASCII 13 + ASCII 10)"
		  end select
		  
		  
		  template_text = template.LoadAllText
		  
		  print "Template (" + template.name + ") loaded."
		  
		  ss = new Spreadsheet( src, input_encoding )
		  
		  print "Source (" + src.name + ") loaded."
		  
		  for i = 1 to ss.colcount
		    t = SpreadsheetAndTemplateToXML( ss, template_text, i, errors, dest, file_name_field, file_name_suffix, overwrite )
		  next
		  
		  if verbose and errors.ubound >= 0 then
		    print " "
		    print "Errors"
		    print "------"
		    for i = 0 to errors.ubound
		      print errors(i)
		    next
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub UnhandledException(error As RuntimeException)
		  print error.Message
		  
		  Quit
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetFileOrQuit(path as String, name as string = "", is_directory as boolean = false) As folderItem
		  dim f as folderItem
		  
		  f = GetShellFolderItem( path )
		  
		  Assert f <> nil and f.exists, path + " does not exist.", true
		  
		  if is_directory then
		    Assert f.directory, path + " is not a directory.", true
		  else
		    Assert not f.directory, path + " is a directory.", true
		  end if
		  
		  if name <> "" and verbose then
		    print name + ": " + f.ShellPath
		  end if
		  
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadOption(s as String)
		  if s.left(1) = "-" then
		    select case s.mid(2,1)
		    case "c"
		      file_name_field = s.mid(3)
		    case "e"
		      input_encoding = EncodingByName( s.mid(3) )
		    case "f"
		      output_encoding = EncodingByName( s.mid(3) )
		    case "o"
		      overwrite = true
		    case "v"
		      verbose = true
		    case "s"
		      file_name_suffix = s.mid(3)
		    case "n"
		      select case s.mid(3)
		      case "m"
		        newline = MacClassicLinefeeds
		      case "d"
		        newline = DOSLineFeeds
		      end select
		    end select
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowDocs(args() as string)
		  dim i as integer
		  
		  if args.ubound > 2 then
		    return
		  end if
		  
		  if args.ubound > 1 then
		    select case args(1)
		    case "-elist"
		      for i = 0 to encodings.Count - 1
		        print encodings.Item(i).internetName
		      next
		      quit
		    case "help"
		    case "-help"
		    case "?"
		    case "man"
		    case else
		      return
		    end select
		  end if
		  
		  print "usage: archutil <source> <template> [<dest>] [options]"
		  print "  <source> source file path"
		  print "  <template> template file path"
		  print "  <dest> destination folder path (default is app location)"
		  print "  [options]:"
		  print "  -e<encoding_string> set input encoding (default auto)"
		  print "      archutil -elist to list all encodings"
		  print "  -f<encoding_string> set output encoding (default UTF8)"
		  print "  -c<filename_column> set the filename (default Filename)"
		  print "  -o overwrite existing files (default FALSE)"
		  print "  -v verbose output (default FALSE)"
		  print "  -s<suffix> sets output file name suffix (default .xml)"
		  print "  -n(u|m|d) sets output newline to ASCII 10, 13, or 13+10"
		  print "      (default ASCII 10)"
		  quit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowVersion()
		  if verbose then
		    print "================================================"
		    print "  archutil v" + kVersion + " ©2009 University of Alabama"
		    print "  written by Tonio Loewald <taloewald@ua.edu>"
		    print "  build " + str(kBuildNumber)
		    print "================================================"
		  else
		    print "archutil v" + kVersion + " | ©2009 | build " + str(kBuildNumber)
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		auto_encoding As string
	#tag EndProperty

	#tag Property, Flags = &h0
		dest As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		file_name_field As String = "Filename"
	#tag EndProperty

	#tag Property, Flags = &h0
		file_name_suffix As String = ".xml"
	#tag EndProperty

	#tag Property, Flags = &h0
		input_encoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h0
		newline As Integer = unixlinefeeds
	#tag EndProperty

	#tag Property, Flags = &h0
		output_encoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h0
		overwrite As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		src As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		ss As spreadsheet
	#tag EndProperty

	#tag Property, Flags = &h0
		template As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		verbose As boolean
	#tag EndProperty


	#tag Constant, Name = kBuildNumber, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVersion, Type = String, Dynamic = False, Default = \"0.2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="auto_encoding"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="file_name_field"
			Group="Behavior"
			InitialValue="Filename"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="file_name_suffix"
			Group="Behavior"
			InitialValue=".xml"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="newline"
			Group="Behavior"
			InitialValue="unixlinefeeds"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="overwrite"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="verbose"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
