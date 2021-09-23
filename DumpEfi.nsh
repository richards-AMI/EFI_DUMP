# Assumes DumpEFI launched with EFIDump as a subfolder.   
# Assumes /DMIEditEfi64\amidefix64.efi exists.
# Assumes Name for Output Directory passed on command line
# ex.  >dumpefi.nsh LBxx

:GIT https://github.com/richards-AMI/EFI_DUMP/

echo -off
	date  
	time  
	echo "* ************************************ * ************************************ *" 
:FileNameProvided
# If a filename is provided by user   %1
if  x%1 ne x  then  
#
	echo %1
	#
	for %i in 0 1 2 3 4 5 6 7 8 9 A B C D E F
	  if exist FS%i:\EfiDump\EfiDump then
		#
		# Found EfiDump folder
		#
		FS%i:
		# We are already in FSx:/Efidump folder
		cd EfiDump
		mkdir EfiDump_%1
		# built in commands
		memmap > FS%i:\EfiDump\EfiDump_%1\memmap.txt
		pci > FS%i:\EfiDump\EfiDump_%1\pci.txt
		dh > FS%i:\EfiDump\EfiDump_%1\dh.txt
		dh -v > FS%i:\EfiDump\EfiDump_%1\dh_v.txt
		drivers > FS%i:\EfiDump\EfiDump_%1\drivers.txt
		devices > FS%i:\EfiDump\EfiDump_%1\devices.txt
		devtree > FS%i:\EfiDump\EfiDump_%1\devtree.txt
		ver > FS%i:\EfiDump\EfiDump_%1\ver.txt
		smbiosview -a > FS%i:\EfiDump\EfiDump_%1\smbios.txt            
		dmpstore > FS%i:\EfiDump\EfiDump_%1\dmpstore.txt
		mem > FS%i:\EfiDump\EfiDump_%1\EfiHeaders.txt	
		# command assumed to exist
		FS%i:\DmiEditEfi64\AMIDEEFIx64.efi /ALL   FS%i:\EfiDump\EfiDump_%1\dmi_all.txt
		FS%i:\DmiEditEfi64\AMIDEEFIx64.efi /DUMPALL  FS%i:\EfiDump\EfiDump_%1\dmi_dumpall.txt
	#    guid > FS%i:\EfiDump\EfiDump_%1\guids.txt   
		cd ..
	  endif
	endfor
else
# user did not include file name - set it to AMI 
:NoFileNameSupplied
	echo FileNameUsed = AMI
	for %i in 0 1 2 3 4 5 6 7 8 9 A B C D E F
	  if exist FS%i:\EfiDump\EfiDump then
 		FS%i:
		cd EfiDump
		mkdir EfiDump_AMI
#
		memmap > FS%i:\EfiDump\EfiDump_AMI\memmap.txt
		pci > FS%i:\EfiDump\EfiDump_AMI\pci.txt
		dh > FS%i:\EfiDump\EfiDump_AMI\dh.txt
		dh -v > FS%i:\EfiDump\EfiDump_AMI\dh_v.txt
		drivers > FS%i:\EfiDump\EfiDump_AMI\drivers.txt
		devices > FS%i:\EfiDump\EfiDump_AMI\devices.txt
		devtree > FS%i:\EfiDump\EfiDump_AMI\devtree.txt
		ver > FS%i:\EfiDump\EfiDump_AMI\ver.txt
		smbiosview -a > FS%i:\EfiDump\EfiDump_AMI\smbios.txt            
		dmpstore > FS%i:\EfiDump\EfiDump_AMI\dmpstore.txt
		mem > FS%i:\EfiDump\EfiDump_AMI\EfiHeaders.txt	
		FS%i:\DmiEditEfi64\AMIDEEFIx64.efi /ALL   FS%i:\EfiDump\EfiDump_AMI\dmi_all.txt
		FS%i:\DmiEditEfi64\AMIDEEFIx64.efi /DUMPALL  FS%i:\EfiDump\EfiDump_AMI\dmi_dumpall.txt
	#    guid > FS%i:\EfiDump\EfiDump_AMI\guids.txt
		cd ..
	  endif
	endfor
endif
:END
