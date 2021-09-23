for %i in 0 1 2 3 4 5 6 7 8 9 A B C D E F
  if exist FS%i:\EfiDump\PttDump then
    # Found PttDump folder

    FS%i:
	# We are already in FSx:/Efidump folder
	cd PttDump
	mkdir PttDump_%1
    
    dmem 0FED40000 100 > FS%i:\EfiDump\PttDump\PttDump_%1\0FED40000.txt
    FS%i:\EfiDump\AmiTcgUtilx64.efi -sb > FS%i:\EfiDump\PttDump\PttDump_%1\sb.txt
    FS%i:\EfiDump\AmiTcgUtilx64.efi -Lb > FS%i:\EfiDump\PttDump\PttDump_%1\Lb.txt
    FS%i:\EfiDump\AmiTcgUtilx64.efi -vi > FS%i:\EfiDump\PttDump\PttDump_%1\vi.txt
	
	# We are in FSx:/Efidump/PttDump folder. Go to FSx:/Efidump folder
	cd ..
    
  endif
endfor
