expect "\r\n$" send "DUMPER\r"; continue
;expect "DUMPER>" at tua0 -f e11 tapes/BB-5254D-BM.tap ; send "TAPE MTA0:\r"; continue

expect "DUMPER>" at tua0 -r tapes/BB-4157F-BM_1983.tap ; send "TAPE MTA0:\r"; continue
expect "DUMPER>" send "REWIND\r"; continue
expect "DUMPER>" send "DEN 1600\r"; continue
expect "DUMPER>" send "ACCOUNT SYS\r"; continue
expect "DUMPER>" send "RESTORE PS:<*>*.*.* <FORTRAN.DOCUMENTATION>*.*.*\r"; continue

;expect "DUMPER>" send "REWIND\r"; continue
;expect "DUMPER>" send "DEN 1600\r"; continue
;expect "DUMPER>" send "ACCOUNT SYS\r"; continue

;expect "DUMPER>" send "restore\33"; continue
;expect "(TAPE FILES)" send "PS:<*>*.*.* <*>*.*.*"; continue
;expect "*.*.*" send "\r"; continue

expect "DUMPER>" send "EXIT\r"; continue
expect "\r\n$" send "DIR\r"; continue
