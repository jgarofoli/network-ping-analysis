data <- read.table('~/Dropbox/Online/Dunster/log4.txt')

x <- (data[,1] - data[1,1])/60./60.
y <- data[,3]

#pdf('figure1.pdf')
plot(y~x,ylab="pings returned (out of 4)",xlab="time (hr)",
         pch=16,col=rgb(0,0,0,1/8))
#dev.off()

timedelta <- lapply(data,diff)$V1
