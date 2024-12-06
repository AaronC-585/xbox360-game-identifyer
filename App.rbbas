#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim zargs() as string = args
		  zargs.remove(0)
		  dim safd as string = join(zargs," ")
		  if safd.Len < 3 then
		    StartFolder =App.ExecutableFile.Parent
		  else
		    StartFolder = GetFolderItem(safd)
		  end if
		  xexTool =app.ExecutableFile.Parent.child("xextool.exe")
		  FolderRunner StartFolder
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub FolderRunner(zDir as folderitem)
		  dim zFile, h,re, y,t as folderitem
		  dim sh as new Shell
		  dim zXML as new XmlDocument
		  dim zXMLn As XmlNode
		  dim i as int64 = 1
		  dim zcmd,m() as String
		  dim llama,titilo,zpng as string
		  
		  
		  print "Scanning - " + zDir.absolutepath
		  do
		    zFile = zDir.Item(i)
		    i = i + 1
		    print "Scanning - " + zFile.name
		    try
		      if zfile.IsReadable and zFile.Directory and not( left(zFile.name,1) = ".") Then
		        'if zFile.Directory then
		        'FolderRunner zFile
		        '
		        'i = i + 1
		        'continue
		        h = zfile.Child("default.xex")
		        y = zfile.Child("00001000").Child("default.xex")
		        t = zfile.Child("00000002").Child("default.xex")
		        if not (h = nil) then
		          if h.exists then
		            zcmd = """" + xexTool.absolutepath + """ -x=int """ + h.absolutepath + """"
		          else
		            continue
		          end if
		        elseif not (y = nil) then
		          if y.exists then
		            zcmd = """" + xexTool.absolutepath + """ -x=int """ + y.absolutepath + """"
		          else
		            continue
		          end if
		        elseif not (t = nil) then
		          if t.exists then
		            zcmd = """" + xexTool.absolutepath + """ -x=int """ + t.absolutepath + """"
		          else
		            continue
		          end if
		        else
		          continue
		        end if
		        
		        sh.Execute(zcmd)
		        m = sh.Result.Split(chr(13)+chr(10))
		        m.Remove(0)
		        
		        try
		          zXMl.LoadXml(join(m,""))
		          zxmln = zxml.child(0)
		          zpng =  zXMLn.Child(0).child(0).value
		          llama = zXMLn.Child(1).child(0).value
		          titilo =  zXMLn.Child(2).child(0).value
		        catch XmlException
		          print "odderr"
		        end try
		        
		        // Create or overwrite the file
		        dim file As folderitem = zfile.child("desktop.ini")
		        dim file2 As folderitem = zfile.child(titilo +".png")
		        if file.Exists then file.Delete
		        if file2.Exists then file2.Delete
		        dim stream As TextOutputStream = file.createtextfile()
		        dim stream2 As BinaryStream = file2.CreateBinaryFile(png.png)
		        
		        
		        // Write text to the file
		        stream.WriteLine("[.ShellClassInfo]")
		        stream.WriteLine("LocalizedResourceName=" +titilo + " [" + llama + "]" )
		        stream.WriteLine("IconFile=" +titilo + ".ico" )
		        stream.WriteLine("IconIndex=0")
		        stream.WriteLine("IconResource=" +titilo + ".ico,0" )
		        
		        //make the icon file
		        stream2.write(DecodeBase64(zpng))
		        
		        // Close the streams to save changes
		        stream.Close
		        stream2.close
		        
		        dim My_attrib as file_Attributes = Get_Attrib( zfile)
		        if not My_attrib.System then My_attrib.System = true
		        dim DidISetThem as Boolean = Set_Attrib(zFile,My_attrib)
		        
		        re =  zfile.child(titilo +".ico")
		        zcmd = "magick """ + file2.AbsolutePath + """ """ + re.AbsolutePath + """"
		        sh.Execute(zcmd)
		        doevents
		      else
		        
		      end if
		    catch NilObjectException
		      continue
		    end try
		  loop until i > zdir.Count
		End Sub
	#tag EndMethod


	#tag Note, Name = desktop . ini
		
		[.ShellClassInfo]
		LocalizedResourceName=New Folder Name
		
		[ViewState
		Logo=C:\Images\MyLogo.jpg
	#tag EndNote

	#tag Note, Name = extract - xiso v2 .7.1 ( 01.11.14 ) for win32
		
		extract-xiso v2.7.1 (01.11.14) for win32 - written by in <in@fishtank.com>
		
		Usage:
		
		extract-xiso.exe [options] [-[lrx]] <file1.xiso> [file2.xiso] ...
		extract-xiso.exe [options] -c <dir> [name] [-c <dir> [name]] ...
		
		Mutually exclusive modes:
		
		-c <dir> [name]     Create xiso from file(s) starting in <dir>.  If the
		[name] parameter is specified, the xiso will be
		created with the (path and) name given, otherwise
		the xiso will be created in the current directory
		with the name <dir>.iso.  The -c option may be
		specified multiple times to create multiple xiso
		images.
		-l                  List files in xiso(s).
		-r                  Rewrite xiso(s) as optimized xiso(s).
		-x                  Extract xiso(s) (the default mode if none is given).
		If no directory is specified with -d, a directory
		with the name of the xiso (minus the .iso portion)
		will be created in the current directory and the
		xiso will be expanded there.
		
		Options:
		
		-d <directory>      In extract mode, expand xiso in <directory>.
		In rewrite mode, rewrite xiso in <directory>.
		-D                  In rewrite mode, delete old xiso after processing.
		-h                  Print this help text and exit.
		-m                  In create or rewrite mode, disable automatic .xbe
		media enable patching (not recommended).
		-q                  Run quiet (suppress all non-error output).
		-Q                  Run silent (suppress all output).
		-s                  Skip $SystemUpdate folder.
		-v                  Print version information and exit.
	#tag EndNote

	#tag Note, Name = Folders
		000D0000    Arcade Title
		00009000    Avatar Item
		00040000    Cache File
		02000000    Community Game
		00080000    Game Demo
		00020000    Gamer Picture
		000A0000    Game Title
		000C0000    Arcade Title
		00009000    Avatar Item
		00040000    Cache File
		02000000    Community Game
		00080000    Game Demo
		00020000    Gamer Picture
		000A0000    Game Title
		000C0000    Game Trailer
		00400000    Game Video
		00004000    Installed Game
		000B0000    Installer
		00002000    IPTV Pause Buffer
		000F0000    License Store
		00000002    Marketplace Content
		00100000    Movie
		00300000    Music Video
		00500000    Podcast Video
		00010000    Profile
		00000003    Publisher
		00000001    Saved Game
		00050000    Storage Download
		00030000    Theme
		00200000    TV
		00900000    Video
		00600000    Viral Video
		00070000    Xbox Download
		00007000    Xbox GOD
		00005000    Xbox Original Game
		00060000    Xbox Saved Game
		00001000    Xbox 360 Title
		00005000    Xbox Title
		000E0000    XNAGame Trailer
		00400000    Game Video
		00004000    Installed Game
		000B0000    Installer
		00002000    IPTV Pause Buffer
		000F0000    License Store
		00000002    Marketplace Content
		00100000    Movie
		00300000    Music Video
		00500000    Podcast Video
		00010000    Profile
		00000003    Publisher
		00000001    Saved Game
		00050000    Storage Download
		00030000    Theme
		00200000    TV
		00900000    Video
		00600000    Viral Video
		00070000    Xbox Download
		00007000    Xbox GOD
		00005000    Xbox Original Game
		00060000    Xbox Saved Game
		00001000    Xbox 360 Title
		00005000    Xbox Title
		000E0000    XNA
	#tag EndNote


	#tag Property, Flags = &h0
		StartFolder As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		xexTool As folderitem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShortVersion"
			Group="Behavior"
			Type="String"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LongVersion"
			Group="Behavior"
			Type="String"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PackageInfo"
			Group="Behavior"
			Type="String"
			InheritedFrom="ConsoleApplication"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
