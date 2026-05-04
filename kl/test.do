expect "\r\n$" send "\r"; continue 
expect "\r\n$" send "DUMPER\r"; continue
expect "DUMPER>" at -f tua0 E11 BB-5254D-BM.tap ; send "TAPE MTA0:\r"; continue
expect "DUMPER>" send "REWIND\r"; continue
expect "DUMPER>" send "DEN 1600\r"; continue
expect "DUMPER>" send "ACCOUNT SYS\r"; continue
;expect "DUMPER>" send "RESTORE PS:<*>*.*.* <NEW-SYSTEM>*.*.*\r"; continue
;expect "DUMPER>" send "EXIT\r"; continue
;expect "\r\n$" send "COPY <NEW-SYSTEM>*.HLP HLP:*.*\r"; continue

