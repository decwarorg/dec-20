expect "\r\n$" send "DUMPER\r"; continue
expect "DUMPER>" at tua0 -f e11 tapes/BB-5254D-BM.tap ; send "TAPE MTA0:\r"; continue

;expect "DUMPER>" send "REWIND\r"; continue
;expect "DUMPER>" send "DEN 1600\r"; continue
expect "DUMPER>" send "ACCOUNT SYS\r"; continue

expect "DUMPER>" send "REWIND\r"; continue
expect "DUMPER>" send "restore\33"; continue
expect "(TAPE FILES)" send "PS:<*>*.*.* <sys\33"; continue
expect "*.*.*" send "\r"; continue

expect "DUMPER>" send "REWIND\r"; continue
expect "DUMPER>" send "restore\33"; continue
expect "(TAPE FILES)" send "PS:<*>*.*.* <sub\33"; continue
expect "*.*.*" send "\r"; continue

expect "DUMPER>" send "REWIND\r"; continue
expect "DUMPER>" send "restore\33"; continue
expect "(TAPE FILES)" send "PS:<*>*.*.* <uetp.lib>\33"; continue
expect "*.*.*" send "\r"; continue

expect "DUMPER>" send "EXIT\r"; continue

expect "\r\n$" send "CONNECT\33"; continue
expect "(TO DIRECTORY)" send "ps:<system>\r"; continue

expect "\r\n$" send "COPY\33" ;continue
expect "(FROM)" send "AN-MONSML.EXE\33"; continue
expect "(TO)" send "MONITR.EXE\r"; continue

;expect "\r\n$" send "COPY\33"; continue
;expect "(FROM)" send "TTY:\33"; continue
;expect "(TO)" send "MONNAM.TXT\r"; continue
