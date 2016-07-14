#tag Module
Protected Module XML_Utilities
	#tag Method, Flags = &h0
		Function IsEmptyNode(node as XmlNode) As boolean
		  dim i as integer
		  
		  if node.Value <> "" then
		    return false
		  end if
		  
		  if node.childcount > 0 then
		    for i = 0 to node.childcount - 1
		      if not isEmptyNode( node.child(i) ) then
		        return false
		      end if
		    next
		  end if
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrettierXML(s as string) As String
		  dim indent_level as integer = 0
		  dim output as string
		  dim i as integer
		  dim rg as new regex
		  dim match as regexmatch
		  dim token as string
		  
		  // matches
		  // <!--.*?--> (comment, but incorrectly allows "--") ( the more correct <!--(-?[^-])*--> crashes! )
		  // <....> (start tag, end tag, empty tab)
		  // sequence of non-< characters (i.e. stuff inside tags)
		  
		  rg.SearchPattern = "<!--.*?-->|<[^>]+>|[^<]+"
		  
		  match = rg.search(s)
		  while match <> nil
		    token = match.subExpressionString(0)
		    select case true
		    case token.left(4) = "<!--"
		      if output.len > 0 then
		        output = output + chr(10)
		      end if
		      output = output + token
		    case token.left(2) = "</"
		      indent_level = indent_level - 1
		      if output.len > 0 and output.right(1) = ">" then
		        output = output + chr(10) + tabs(indent_level)
		      end if
		      output = output + token
		    case token.left(2) = "<?"
		      if output.len > 0 then
		        output = output + chr(10) + tabs(indent_level)
		      end if
		      output = output + token
		    case token.left(1) = "<"
		      if output.len > 0 then
		        output = output + chr(10) + tabs(indent_level)
		      end if
		      output = output + token
		      if token.right(2) <> "/>" then
		        indent_level = indent_level + 1
		      end if
		    case else
		      output = output + trim(token)
		    end select
		    s = mid( s, len(token) + 1 )
		    match = rg.search( s ) // terminates when s is empty or contains no matches
		  wend
		  
		  return output
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveEmptyChildNodes(node as XmlNode)
		  dim i as integer
		  dim child_node as XmlNode
		  
		  for i = node.ChildCount - 1 downTo 0
		    child_node = node.child(i)
		    if IsEmptyNode( child_node ) then
		      node.RemoveChild( child_node )
		    else
		      RemoveEmptyChildNodes( child_node )
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceXmlEntities(extends s as String, replaceQuotes as boolean = true, replaceEmDashes as boolean = false) As string
		  dim t as string
		  dim rg as new RegEx
		  
		  t = s
		  
		  rg.SearchPattern = "&([\w]{2,5});" // find any entities already in the string
		  rg.ReplacementPattern = "\x01@\x03$1;"
		  t = rg.replace(s)
		  
		  // First we make sure we don't double-convert ampersands in existing entities
		  t = t.replaceAll( "&", "&amp;" )
		  t = t.replaceAll( ">", "&gt;" )
		  t = t.replaceAll( "<", "&lt;" )
		  
		  // restore the entities we originally had
		  t = t.replaceAll( chr(1) + "@" + chr(3), "&" )
		  
		  ' You don't strictly need to replace single and double quote except in attributes, so
		  ' we're allowing for them to be left in tact
		  if replaceQuotes then
		    t = t.replaceAll( "'", "&apos;" )
		    t = t.replaceAll( """", "&quot;" )
		  end if
		  ' And yes, strictly speaking they're MINUTES and SECONDS symbols. Damn typewriters.
		  
		  ' Double dashes are strictly forbidden from the bodies of comments, so we allow for them
		  ' to be replaced by mdash entities
		  if replaceEmDashes then
		    t = t.replaceAll( "--", "&#8212;")
		  end if
		  
		  return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrimXML(s as String, error_list() as string = nil, error_prefix as string = "Error: ") As string
		  dim xml as new XmlDocument
		  
		  if s = "" then
		    return ""
		  end if
		  
		  xml.LoadXml(s)
		  
		  RemoveEmptyChildNodes( xml.child(0) )
		  
		  return xml.toString()
		  
		Exception e
		  if error_list <> nil then
		    error_list.append error_prefix + "invalid XML output, could not tidy output."
		  end if
		  return s
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
