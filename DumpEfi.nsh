# Assumes DumpEFI launched with EFIDump as a subfolder.   
# Assumes /DMIEditEfi64\amidefix64.efi exists.
# Assumes Name for Output Directory passed on command line
# ex.  >dumpefi.nsh LBxx

:GIT https://github.com/richards-AMI/EFI_DUMP/

set -v FN AMI

# If a filename is provided by user
if  x%1 ne x  then  
	set -v FN %1
else
	echo DumpEFI.nsh LBxx
endif

echo -off
	date  
	time  
	echo "* ************************************ * ************************************ *" 
	cd EfiDump
	mkdir EfiDump_%FN%
	# built in commands
	memmap > EFIDump_%FN%\memmap.txt
	pci > EFIDump_%FN%\pci.txt
	dh > EFIDump_%FN%\dh.txt
	dh -v > EFIDump_%FN%\dh_v.txt
	drivers > EFIDump_%FN%\drivers.txt
	devices > EFIDump_%FN%\devices.txt
	devtree > EFIDump_%FN%\devtree.txt
	ver > EFIDump_%FN%\ver.txt
	smbiosview -a > EFIDump_%FN%\smbios.txt            
	dmpstore > EFIDump_%FN%\dmpstore.txt
	mem > EFIDump_%FN%\mem.txt	
	# command assumed to exist
	.\DmiEditEfi64\AMIDEEFIx64.efi /ALL   EFIDump_%FN%\dmi_all.txt
	.\DmiEditEfi64\AMIDEEFIx64.efi /DUMPALL  EFIDump_%FN%\dmi_dumpall.txt
	#    guid > EFIDump_%FN%\guids.txt   
	cd ..

:END
