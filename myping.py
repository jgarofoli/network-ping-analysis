import subprocess
import time
import sys

"""
IMPROVEMENTS:
    1. do the logging from here (not outside)
    2. automatically write out the file every 5 minutes
    3. when the file gets too big, close it and
    4. automatically open a new file
    5. also log things like hostname, network name, etc.

"""

host = "www.google.com"
host = "74.125.28.105"

def parse_output(out):
    lines = out.split('\n')
    keeper = None
    keeper2 = None
    output = []
    for i,l in enumerate(lines):
        if '---' in l :
            keeper = int(i+1)
        if 'round-trip' in l:
            keeper2 = int(i)
    if keeper:
        parts = lines[keeper].split(',')
        output.append(int(parts[0].split()[0]))
        output.append(int(parts[1].split()[0]))
    else:
        output.append(0)
        output.append(0)
    if keeper2:
        parts = lines[keeper2].split(' = ')[1].split('/')[1]
        output.append(parts)
    else :
        output.append(0)
    return output

while True:
    ping = subprocess.Popen(["ping","-c","10", host], stdout= subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = ping.communicate()
    n,N,avg = parse_output(out)
    print "{:0.0f} {:02.0f} {:02.0f} {:}".format(time.time(),n,N,avg)
    sys.stdout.flush()
    time.sleep(8)
