# network-ping-analysis

* Monitor network connectivity to the outside world with ping.
* Produces a log file and a graph of data in the log file.
* 

## myping.py

This file uses a loop to call ping and then extracts some information from the results of ping
and emits them.  They are best stored in a log file.

### improvements (to do/ideas)

* instead of emitting them, use the logging module to print to screen and file
* also log, in a seperate file, the raw ping results (or slightly modified so that they are on one line)
* make it more of a function so that ping delay and host can be set
* is there a ping url? at the moment it pings a commercial site (maybe change to 8.8.8.8 as described here http://etherealmind.com/what-is-the-best-ip-address-to-ping-to-test-my-internet-connection/)
* more things?

## plotit.r

This file loads the log file and produces a chart.
At some point it should do a more in depth analysis of the log file
and produce a report.

### improvements (to do/ideas)

* find the periodicity of failures
* plot the round trip time, too
* make a pie chart of the various number of pings that come back
* more things!

