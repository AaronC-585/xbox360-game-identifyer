#tag Module
Protected Module My_FolderItem
	#tag Method, Flags = &h0
		Function Get_Attrib(file as folderItem) As file_Attributes
		  Declare Function GetFileAttributesW Lib "Kernel32" (lpFileName As WString) As uint32
		  dim dlfds as string = file.AbsolutePath
		  dlfds = left(dlfds,len(dlfds) -1)
		  dim value as new memoryblock(32)
		  value.UInt32Value(0) =  GetFileAttributesW(dlfds)
		  dim j as file_Attributes
		  j.ReadOnly = value.BooleanValue(0)           // 0x1: The file is read-only.
		  j.Hidden = value.BooleanValue(1)            // 0x2: The file is hidden from normal directory views.
		  j.System =  value.BooleanValue(2)          // 0x4: The file is a system file.
		  j.not_used_0 = value.BooleanValue(3)       // 0X8
		  j.Directory = value.BooleanValue(4)          // 0x10: The file is a directory.
		  j.Archive =  value.BooleanValue(5)          // 0x20: The file is marked for backup or removal.
		  j.Device =  value.BooleanValue(6)             // 0x40: Reserved for system use (rarely used).
		  j.Normal = value.BooleanValue(7)             // 0x80: A file that does not have other attributes set.
		  j.Temporary =  value.BooleanValue(8)        // 0x100: The file is used for temporary storage.
		  j.SparseFile =  value.BooleanValue(9)        // 0x200: The file is a sparse file.
		  j.ReparsePoint = value.BooleanValue(10)       // 0x400: The file or directory has a reparse point.
		  j.Compressed = value.BooleanValue(11)       // 0x800: The file or directory is compressed.
		  j.Offline =  value.BooleanValue(12)          // 0x1000: The file is offline or in remote storage.
		  j.NotContentIndexed =  value.BooleanValue(13)  // 0x2000: The file or directory is excluded from indexing.
		  j.Encrypted =  value.BooleanValue(14)          // 0x4000: The file or directory is encrypted.
		  j.IntegrityStream = value.BooleanValue(15)    // 0x8000: The file or directory includes integrity support.
		  j.Virtural = value.BooleanValue(16)        // 0x10000: Reserved for future use.
		  j.NoScrubData = value.BooleanValue(17)        // 0x20000: The file or directory is excluded from integrity scanning.
		  j.RecallOnOpen =value.BooleanValue(18)       // 0x40000: The file is recalled from remote storage on open.
		  j.not_used_1 =value.BooleanValue(19)       // 0X80000
		  j.not_used_2 = value.BooleanValue(20)         // 0X100000
		  j.not_used_3 =value.BooleanValue(21)         // 0X200000
		  j.RecallOnDataAccess  =value.BooleanValue(22)        // 0x400000: The file is recalled on data access.
		  return j
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Set_Attrib(file as folderitem, attributes as file_Attributes) As boolean
		  Declare Function SetFileAttributesW Lib "Kernel32" (lpFileName As WString, dwFileAttributes As uint32) As Boolean
		  dim dlfds as string = file.AbsolutePath
		  dlfds = left(dlfds,len(dlfds) -1)
		  dim outvalue as new memoryblock(32)
		  outvalue.booleanvalue(0) = attributes.ReadOnly          // 0x1: The file is read-only.
		  outvalue.booleanvalue(1) = attributes.Hidden           // 0x2: The file is hidden from normal directory views.
		  outvalue.booleanvalue(2) = attributes.System          // 0x4: The file is a system file.
		  outvalue.booleanvalue(3) = attributes.not_used_0      // 0X8
		  outvalue.booleanvalue(4) = attributes.Directory         // 0x10: The file is a directory.
		  outvalue.booleanvalue(5) = attributes.Archive         // 0x20: The file is marked for backup or removal.
		  outvalue.booleanvalue(6) = attributes.Device            // 0x40: Reserved for system use (rarely used).
		  outvalue.booleanvalue(7) = attributes.Normal            // 0x80: A file that does not have other attributes set.
		  outvalue.booleanvalue(8) = attributes.Temporary       // 0x100: The file is used for temporary storage.
		  outvalue.booleanvalue(9) = attributes.SparseFile         // 0x200: The file is a sparse file.
		  outvalue.booleanvalue(10) = attributes.ReparsePoint      // 0x400: The file or directory has a reparse point.
		  outvalue.booleanvalue(11) = attributes.Compressed      // 0x800: The file or directory is compressed.
		  outvalue.booleanvalue(12) = attributes.Offline         // 0x1000: The file is offline or in remote storage.
		  outvalue.booleanvalue(13) = attributes.NotContentIndexed // 0x2000: The file or directory is excluded from indexing.
		  outvalue.booleanvalue(14) = attributes.Encrypted         // 0x4000: The file or directory is encrypted.
		  outvalue.booleanvalue(15) = attributes.IntegrityStream   // 0x8000: The file or directory includes integrity support.
		  outvalue.booleanvalue(16) = attributes.Virtural       // 0x10000: Reserved for future use.
		  outvalue.booleanvalue(17) = attributes.NoScrubData       // 0x20000: The file or directory is excluded from integrity scanning.
		  outvalue.booleanvalue(18) = attributes.RecallOnOpen     // 0x40000: The file is recalled from remote storage on open.
		  outvalue.booleanvalue(19) = attributes.not_used_1     // 0X80000
		  outvalue.booleanvalue(20) = attributes.not_used_2        // 0X100000
		  outvalue.booleanvalue(21) = attributes.not_used_3       // 0X200000
		  outvalue.booleanvalue(22) = attributes.RecallOnDataAccess       // 0x400000: The file is recalled on data access.
		  return SetFileAttributesW(dlfds,outvalue.UInt32value(0))
		End Function
	#tag EndMethod


	#tag Note, Name = Read Me
		In the Windows API, file attributes are represented as a set of flags that define the properties or characteristics of a file or directory. These attributes are typically retrieved using functions like GetFileAttributes or GetFileAttributesEx. Below are the common file attribute constants and their meanings:
		
		File Attributes
		FILE_ATTRIBUTE_ARCHIVE (0x20)
		The file is marked for backup or removal.
		
		FILE_ATTRIBUTE_COMPRESSED (0x800)
		The file or directory is compressed.
		
		FILE_ATTRIBUTE_DEVICE (0x40)
		Reserved for system use. Not used in modern contexts.
		
		FILE_ATTRIBUTE_DIRECTORY (0x10)
		The file is a directory.
		
		FILE_ATTRIBUTE_ENCRYPTED (0x4000)
		The file or directory is encrypted.
		
		FILE_ATTRIBUTE_HIDDEN (0x2)
		The file is hidden, meaning it is not included in an ordinary directory listing.
		
		FILE_ATTRIBUTE_INTEGRITY_STREAM (0x8000)
		The file or directory includes integrity support.
		
		FILE_ATTRIBUTE_NORMAL (0x80)
		A file that does not have other attributes set. This is the default attribute.
		
		FILE_ATTRIBUTE_NOT_CONTENT_INDEXED (0x2000)
		The file or directory is not indexed by the content indexing service.
		
		FILE_ATTRIBUTE_NO_SCRUB_DATA (0x20000)
		The file or directory is excluded from data integrity scanning.
		
		FILE_ATTRIBUTE_OFFLINE (0x1000)
		The file is not available immediately (e.g., stored on remote or offline storage).
		
		FILE_ATTRIBUTE_READONLY (0x1)
		The file is read-only.
		
		FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS (0x400000)
		The file is configured to be recalled on data access.
		
		FILE_ATTRIBUTE_RECALL_ON_OPEN (0x40000)
		The file is recalled from remote storage when opened.
		
		FILE_ATTRIBUTE_REPARSE_POINT (0x400)
		The file or directory has an associated reparse point, such as a symbolic link or mount point.
		
		FILE_ATTRIBUTE_SPARSE_FILE (0x200)
		The file is a sparse file.
		
		FILE_ATTRIBUTE_SYSTEM (0x4)
		The file is part of the operating system or used exclusively by it.
		
		FILE_ATTRIBUTE_TEMPORARY (0x100)
		The file is used for temporary storage.
		
		FILE_ATTRIBUTE_VIRTUAL (0x10000)
		Reserved for future use.
		
		Additional Information
		Symbolic Links and Junctions: You can detect them using FILE_ATTRIBUTE_REPARSE_POINT and querying the reparse tag.
		Timestamps: Functions like GetFileAttributesEx can also retrieve timestamps (creation, last access, last write) alongside file attributes.
		These attributes are often combined using bitwise operations to represent multiple states for a single file.
		
	#tag EndNote


	#tag Structure, Name = file_Attributes, Flags = &h0
		ReadOnly As Boolean            // 0x1: The file is read-only.
		  Hidden As Boolean              // 0x2: The file is hidden from normal directory views.
		  System As Boolean              // 0x4: The file is a system file.
		  not_used_0 as boolean          // 0X8
		  Directory As Boolean           // 0x10: The file is a directory.
		  Archive As Boolean             // 0x20: The file is marked for backup or removal.
		  Device As Boolean              // 0x40: Reserved for system use (rarely used).
		  Normal As Boolean              // 0x80: A file that does not have other attributes set.
		  Temporary As Boolean           // 0x100: The file is used for temporary storage.
		  SparseFile As Boolean          // 0x200: The file is a sparse file.
		  ReparsePoint As Boolean        // 0x400: The file or directory has a reparse point.
		  Compressed As Boolean          // 0x800: The file or directory is compressed.
		  Offline As Boolean             // 0x1000: The file is offline or in remote storage.
		  NotContentIndexed As Boolean   // 0x2000: The file or directory is excluded from indexing.
		  Encrypted As Boolean           // 0x4000: The file or directory is encrypted.
		  IntegrityStream As Boolean     // 0x8000: The file or directory includes integrity support.
		  Virtural As Boolean             // 0x10000: Reserved for future use.
		  NoScrubData As Boolean         // 0x20000: The file or directory is excluded from integrity scanning.
		  RecallOnOpen As Boolean        // 0x40000: The file is recalled from remote storage on open.
		  not_used_1 as boolean          // 0X80000
		  not_used_2 as boolean          // 0X100000
		  not_used_3 as boolean          // 0X200000
		RecallOnDataAccess As Boolean  // 0x400000: The file is recalled on data access.
	#tag EndStructure


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
	#tag EndViewBehavior
End Module
#tag EndModule
