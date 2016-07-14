#tag Menu
Begin Menu AU_Menubar
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin AppleMenuItem About
         SpecialMenu = 0
         Text = "About Archivist Utility"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FileNewXMLXSLHTMLWindow
         SpecialMenu = 0
         Text = "New XML > XSL > HTML Window"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FileNewSpreadsheetXSLXMLWindow
         SpecialMenu = 0
         Text = "New Spreadsheet > XSL > XML Window"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "Quit"
         Index = -2147483648
         ShortcutKey = "Q"
         Shortcut = "Cmd+Q"
         MenuModifier = True
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "Clear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
   End
   Begin MenuItem BatchMenu
      SpecialMenu = 0
      Text = "Batch"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem BatchAddFile
         SpecialMenu = 0
         Text = "Add File..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem BatchAddFolder
         SpecialMenu = 0
         Text = "Add Folder..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem BatchRemoveSelected
         SpecialMenu = 0
         Text = "Remove Selected"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem BatchClearList
         SpecialMenu = 0
         Text = "Clear List"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem BatchOpen
         SpecialMenu = 0
         Text = "Open"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator2
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem BatchBatchProcessSelected
         SpecialMenu = 0
         Text = "Process Selected"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem BatchBatchProcessAll
         SpecialMenu = 0
         Text = "Process All"
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu
