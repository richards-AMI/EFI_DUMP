for %i in 0 1 2 3 4 5 6 7 8 9 A B C D E F
  if exist FS%i:\EfiDump\EfiDump then
    #
    # Found EfiDump folder
    #
    FS%i:
	# We are already in FSx:/Efidump folder
	cd EfiDump
	mkdir EfiDump_%1
    
    memmap > FS%i:\EfiDump\EfiDump\EfiDump_%1\memmap.txt
    pci > FS%i:\EfiDump\EfiDump\EfiDump_%1\pci.txt
    dh > FS%i:\EfiDump\EfiDump\EfiDump_%1\dh.txt
    dh -v > FS%i:\EfiDump\EfiDump\EfiDump_%1\dh_v.txt
    drivers > FS%i:\EfiDump\EfiDump\EfiDump_%1\drivers.txt
    guid > FS%i:\EfiDump\EfiDump\EfiDump_%1\guids.txt
    ver > FS%i:\EfiDump\EfiDump\EfiDump_%1\ver.txt
    smbiosview -a > FS%i:\EfiDump\EfiDump\EfiDump_%1\smbios.txt            
    dmpstore > FS%i:\EfiDump\EfiDump\EfiDump_%1\dmpstore.txt
    mem > FS%i:\EfiDump\EfiDump\EfiDump_%1\EfiHeaders.txt
	
    FS%i:\EfiDump\PrintDevPathApp.efi > FS%i:\EfiDump\EfiDump\EfiDump_%1\DevicePath.txt


	# EfiSce don't like sub-paths in output filename
	cd EfiDump_%1
    FS%i:\EfiDump\SceEfi64.efi /o /s Setup.txt /h hii /v
	
	# We are in FSx:/Efidump/EfiDump/Efidump_%1 folder. Go to FSx:/Efidump/St7xx folder
	cd ..
	cd ..
	cd St7105
	efidc64.efi -o FS%i:\EfiDump\EfiDump\EfiDump_%1\SelfTest_EfiShell.stx
	
	
	# We are in FSx:/Efidump/St7xx folder. Go to FSx:/Efidump folder
    cd ..
  endif
endfor
