# EFI_DUMP

run   dumpefi filename

# Assumes DumpEFI launched with EFIDump as a subfolder.   
# Assumes /DMIEditEfi64/amidefix64.efi exists.
# Assumes Name for Output Directory passed on command line
# ex.  >dumpefi.nsh LBxx

\
\efi\boot
     bootx64.efi  or   shell.efi
\dumpefi
\dmieditefi64
     amidefix64.efi
  
  
 
