import os
for line in open('filenames.txt', 'rt'):
    filename = line.strip().split('>')[1]
    os.system(f'./back10mac -f ./t20v4/tapes/BB-5254D-BM.tap -T e11 -x {filename}')
    if 'system' in line: os.system(f'mv ps\:\<new-system\>{filename} ./t20anv4/system/{filename}')
    elif 'subsys' in line: os.system(f'mv ps\:\<new-subsys\>{filename} ./t20anv4/subsys/{filename}')
    elif 'uetp' in line: os.system(f'mv ps\:\<uetp.lib\>{filename} ./t20anv4/uetp/{filename}')
    pass
