# ArchivistUtility
[no longer maintained] Helps automate parts of the workflow for creating and maintaining metadata files

This program was originally written by [Tonio Lowald](https://github.com/tonioloewald) for the University of Alabama Libraries in 2011.
MACR Utility is no longer maintained and may be used on an "AS IS" basis in accordance with the ECL-2.0 License.

### The following is from the [legacy Acumen project page](http://acumen.lib.ua.edu/project/):

Archivist Utility v0.2
======================

Archivist Utility is a component of the Acumen project.

It is intended to ease and/or automate parts of the workflow for __creating and maintaining metadata files__ (particularly automating the conversion
of data from flat spreadsheets to valid XML by use of templates) and __creating and maintaining XSL__ files to summarize and render metadata.

Archivist Utility offers two main windows. One is for dealing with XML metadata the other with XSL transformations -- although the two may be merged in future.

As of now, the XML window is in a much more advanced state than the XSL window (ironic, since the latter is much more useful to me).

[Fix] Pretty Printer no longer adds whitespace to the content of tags.

Archivist Utility is also available for Mac OS X and Linux on request. There is also a command-line version which offers some of the functionality.

Downloads
---------
* <a href="downloads/archivist_utility.win.zip">Archivist Utility for Windows</a> (zip archive)
* <a href="downloads/archivist_utility.osx.zip">Archivist Utility for Mac OS X</a> (zip archive)
* <a href="downloads/archivist_utility.linux.zip">Archivist Utility for Linux</a> (zip archive)

BOM-Skipping
------------

Archivist Utility now skips leading bytes that have a value of 0, or >127. In effect this
skips over [Byte Order Marks](http://en.wikipedia.org/wiki/Byte_order_mark) that some programs
(apparently a lot of Microsoft programs for example) store at the beginning of plain text files
to indicate their encoding. The problem fiels I was sent had a 3-byte UTF-8 BOM prepended
which was being treated as part of the first data column's name.

Improved XSL Tool
-----------------

I've completely rewritten the XSL window so it works as a live preview as you edit. Load XML and XSL files and preview the results. 
Save changes and the preview updates immediately.

__Note__ (for Shawn): it uses the XSLT engine built into Real Studio so, for now, that's not XSLT2 or whatever Black Magic you use.
I really ought to look into bundling something better into it.

I've just posted (as of 5/5/11) a new version of Archivist Utility. If you don't use the XSL preview tool then it probably
won't affect you at all, but if you do then things are very different.

I don't know how (or even if) anyone else used the XSL preview tool but I use it a lot for working on XSL. The way it works now
is that you load an XML file into the XML pane, the XSL file into the XSL pane, and you can preview the output in the preview panes (raw output or web preview).
Instead of assuming you'll want to edit the inputs (XML and XSL) inside the panels -- which is ridiculous since I am obviously not going to write a nice XML Editor
from scratch in any recent time frame -- it assumes you'll edit them in your favorite editor&trade; and when you save changes the tool detects them and updates the
preview.

Drag-and-drop are supported too, so you should be able to drag XML and XSL files to the window (it doesn't matter which pane is active) 
and they'll be loaded into the correct panel automagically.

Template Language
-----------------

Both utilities take spreadsheets and convert each row into an output (text) file (assumed to be XML for now)
using the top row as a set of column identifiers. We've created a simple templating language to determine which
bit of the spreadsheet row ends up where in the template, and also to identify errors in the spreadsheet
or template. All template inserts are surrounded by matching {{ }}. Note that this means you can't put {{ and }}
inside a template -- but this shouldn't be a huge problem.

__Note__: template commands are not case-sensitive, so {{for:foo}} and {{FOR:FOO}} and {{FoR:fOo}} are the same thing.

### {{column_name}}

Inserts the contents of the column named __column_name__.

### {{req:column_name}}

Inserts the contents of the column named __column_name__. Generates an __error__ message if the column is absent or empty.

### {{if:condition:value_if_true:value_if_false}}

Evaluates __condition__ (a boolean expression) and inserts __value_if_true__ if the __condition__ is true, and __value_if_false__ otherwise.

__condition__ is a boolean expression composed of column names, parentheses, and logical operators (&& and ||).
If you're familiar with C-style boolean operations this will make sense, otherwise not. A column name evaluates to TRUE 
if the column is presented and non-empty, and false otherwise.

__value_if_true__ and __value_if_false__ may be column names (in which case the appropriate value is substituted) or string
literals if quoted (e.g. {{if:foo:bar}} inserts the contents of column bar if foo is present and non-empty and nothing otherwise,
{{if:foo:"hello":'good-bye'}} inserts the word "hello" (no quotes) if foo is present and non-empty, and "good-bye" otherwise. Note
that there's no difference (for now!) between double and single quotes, but we may turn double-quotes into __interpolated strings__
in the future (i.e. allow variable substitution into strings).

### {{for:column_name:separator}} {{each:column_name}} {{next:column_name}}

The contents of __column name__ (if present) are split into pieces by separator, and then the stuff between the __for__ and 
__next__ are repeated once for each piece.

Any occurence of __each__ (with the same column_name) in the loop body (i.e. the stuff between for and next) will be replaced by the piece.

e.g. if the column named foo contains This--is--a--test, then 

{{for:foo:--}}&lt;bar&gt;{{each:foo}}&lt;/bar&gt;{{next:foo}} 

would generate

&lt;bar&gt;This&lt;/bar&gt;&lt;bar&gt;is&lt;/bar&gt;&lt;bar&gt;a&lt;/bar&gt;&lt;bar&gt;test&lt;/bar&gt;

### System Variables

__Note__: column names which begin with double underscore "__" are henceforth considered to be internal system variables, so don't use
them in your spreadsheets!

There are some system variables available for use in templates to aid in maintenance. They work just like regular column names. These are:

<b>__generator</b> inserts the name, version, and build date of the program that created the file.
<b>__timestamp</b> inserts the date and time when the file was created.
<b>__source</b> inserts the name of the file and the row within that file from which the file was generated.
<b>__encoding</b> inserts the internet name of the text encoding used to read the source data file.
<b>__unused</b> lists the unused columns* (if any) and their contents
<b>__errors</b> lists any errors* that occurred while creating the file

__Note__: * only those errors and omissions thus far will be inserted, so these variables work best in the tail of the template.

To Do
-----

[ ] Make comments and log consistent (unused columns should be a WARNING not an error or whatever)
[ ] Improve UTF8 vs. ASCII vs. 8-bit encoding sniffing using the algorithm described towards the bottom of [this page](http://codesnipers.com/?q=node/68):

Without going into the full algorithm, just perform UTF-8 decoding on the file looking for an invalid UTF-8 sequence. The correct UTF-8 sequences look like this:

* 0xxxxxxx  ASCII < 0x80 (128)
* 110xxxxx 10xxxxxx  2-byte >= 0x80
* 1110xxxx 10xxxxxx 10xxxxxx  3-byte >= 0x400
* 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx  4-byte >= 0x10000

If the file is all ASCII, you cannot know if it was meant to be UTF-8 or any other character set compatible with ASCII in the lower 128. 

[ ] {{map:column_name:map_list_id}} and {{map:column_name:map_list:separator}} to validate vocabulary
[ ] {{map_strict:...}} as above but generates an error if element is not in the map
[ ] {{req:expression:regular_expression}} as per req but requires that the column fulfilling the condition match the expression
[ ] {{skip:on_error|on_warning}} skip export of this file

> Example

> `{{req:Filename:^[a-z]{1}\d4_\d{7}_\d{7}(_\d{4}(_\d{3})?)?$}}`

> `{{skip:on_error}}`  

> would cause an error for non-matching entries and then prevent the resulting file from being created.

[ ] {{halt:on_error|on_warning}} stop batch process
[ ] map list entries are in the following format: each line starts with a valid vocab term, and then is followed by a tab-delimited list of terms that get converted into that term. E.g. a line might contain "still image<tab>photograph<tab>image, still" indicating that "photograph" and "image, still" all get mapped to "still image". The map will try to guess the mapping for unlisted terms by (a) looking for a listed term containing the unmapped term (e.g. "photo" is contained in "photograph"), then (b) looking for a listed term that is contained by the unlisted term (e.g. "photographs" contains "photograph"); if either scores a hit, it will use that term BUT generate a warning. If it can't find a match this way it will generate an ERROR message, but pass the term through unmolested.
[ ] UI for viewing and modifying map lists (possibly allow automatic matches to be "sucked in" to a map list, e.g. if "photo" were guessed as a synonym of "still image" then it would be added to that term's list of mapped terms and no longer generate warnings).
[ ] update archutil
[ ] build archutil testing into Archivist Utility (i.e. when you do something in Archivist Utility in debug mode it should try to do the same thing in archutil via the shell and verify it behaves as expected).

Ideas
-----
* If we need __complex mapping rules__ {{map:column_name:/regular_expression/:map_list_id_1:map_list_id_2:...}} for really complex validation (basically the regex outputs would be matched against map_lists (empty entries would be skipped) -- e.g. {{map:foo:/([\w]+);[\s]*([\w]+)/:bar:baz}} would expect two words separated by a semicolon (with optional whitespace after the semicolon) in foo, and generate an error if it didn't match this, or if the first word weren't in the map list named "bar", or if the second word weren't in the map list named "baz".
* Similarly we could do regex processing on column contents with something like {{grep:column_name:regular_expression:replacement_expression}}.
* {{FOR:column_name:separator:REQ}} -- exactly like {{FOR:column_name:separator}} but reports an error if __column_name__ is missing or empty
* GUI for spreadsheet creation. Allow the spreadsheet view component to allow editing and adding new rows to spreadsheets. It would also use the currently loaded template (if any) to map fields (providing a popup menu or combox box)

Changes
-------

### All Tools

* More sophisticated template features
* Commands are now {{foo}} instead of %foo%
* Strip quotation marks from cell contents in spreadsheet constructor (was LoadSpreadsheet)
* "System Variables" now allow reporting of conversion details into output files

### Archivist Utility

* Automatic sniffing of files encoding (will respect files named *.utf8, but only if a contradictory BOM is not found)
* Auto sniffing is the default
* Spreadsheet class transparently implements trimming of cell contents, verification of row sizes, etc.
* Provide UI for setting encoding options in Archivist Utility
* Batch Processing Implemented
* improved error reporting to show row that is the source of a problem
* Can now filter and save error logs
* huge amounts of testing done -- can now process entire data set with no major issues

### Console Tools

* archutil refactored for greater compatibility with Archivist Utility codebase and stability
* Standalone encoding sniffer tool (it's now called <b>uenc</b>)
* Documentation for Template Language (see below)

History
-------

###v0.2

*	Modified the template engine to (a) simply replace all tags (%foo%) with column contents, and then (b) recursively strip empty nodes from the output. This should make
	converting a "mockup" into a template as simple as replacing template content with %column_name%.
*	All the relevant code has been nicely refactored so implementing batch processing should be easier.
*	Added an XML prettifier which correctly indents XML output to make viewing output easier.

###v0.1

*	Initial Release

__Archivist Utility__ is a desktop application for batch-production of metadata XML files from spreadsheet (tab- or comma- delimited) text files using simple templates 
and also for the editing and testing of XML metadata files and XSL transformations.

The goal of Archivist Utility is to allow seamless previewing of results from given input. Eventually you should be able to edit files at any stage of the content pipeline and see
the results instantly, i.e.

Spreadsheet (TXT/CSV) -> Metadata Template (XML) -> Metadata (XML) -> XSL Transformation (XSL) -> Final Output (XML/HTML)

At the moment this is broken into two windows:

__XML Generator__: Spreadsheet (TXT/CSV) -> Metadata Template (XML) -> Metadata (XML)

The assumed user for this is an archivist producing XML from spreadsheets wishing to verify that everything is working as expected.

__XSL Editor__: Metadata (XML) -> XSL Transformation (XSL) -> Final Output (XML/HTML)

The assumed user for this is either an XSL developer wishing to test XSL transforms on different input files, or an archivist trying to determine if XML metadata is being correctly transformed (e.g. into summary XML files or end-user HTML for rendering in a web browser).

It will be possible in future to see the entire workflow in a single window or perhaps to simply link the output of an XML Generator window to the input of an XSL Editor window, so that you can load a spreadsheet, select a row, and see it transformed into XML via template, and then XML or HTML via XSL -- live.

General Features
----------------

The program remembers its window layout (i.e. which windows were open, how they were positioned and sized, etc.) between sessions.

XML Templates
-------------

The templates are simply XML files with "%"-decorated tags indicating where a column value should be inserted, e.g.

`<foo>%bar%</foo>` indicates that the value in the column headed "bar" should be inserted in the `<foo></foo>` tag.

The template engine simply:

1.	Looks for all the tags in the template, replacing them with corresponding column data if found (or nothing otherwise)
2.	If a column is missing from the input data, a __warning__ is flagged*
3.	If a column is used more than once, a __warning__ is flagged*
4.	If a column in the source data is not used, an __error__ is flagged (since this would result in data loss during conversion)*
5.	The resulting XML is then parsed and any empty nodes are stripped (an empty node is defined as having no text content and no non-empty children).
6.	And finally this XML is "prettified" (indented and cleaned up) and displayed*

__Note__: * these steps will be skipped during batch-processing when implemented.
