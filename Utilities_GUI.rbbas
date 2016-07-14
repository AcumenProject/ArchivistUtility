#tag ModuleProtected Module Utilities_GUI	#tag Method, Flags = &h0		Function AddButton(extends t as toolbar, caption as String, name as string, icon as picture, style as integer = ToolButton.ToolStylePushButton) As ToolButton		  dim b as new ToolButton		  b.Caption = caption		  b.name = name		  b.icon = icon		  b.style = style		  		  t.append b		  return b		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function AddItem(extends m as MenuItem, caption as string, enabled as boolean = true, checked as boolean = false) As Menuitem		  dim it as new menuitem		  it.Text = caption		  it.Checked = checked		  it.Enabled = enabled		  m.Append it		  		  return it		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub AddSeparator(extends t as Toolbar, style as integer = toolbutton.ToolStyleSeparator)		  dim b as new Toolbutton		  b.style = style		  		  t.append b		End Sub	#tag EndMethod	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule