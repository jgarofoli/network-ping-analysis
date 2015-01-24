mkreport <- function(fname) {
    mydata <- read.table(fname)
    x <- (mydata[,1] - mydata[1,1])/60./60.
    y <- mydata[,3]

    #pdf('figure1.pdf')
    par(mfrow=c(2,2))
    plot(y~x,ylab="pings returned (out of 10)",xlab="time (hr)",main=fname,
             pch=16,col=rgb(0,0,0,1/8))
    #dev.off()

    slices <- hist(y,plot=F)#ylab="entries [N]",xlab="number of successful pings [out of 4]", main="dist. of successful pings",plot=T)
    nsl <- c(sum(slices$density[1:7]),slices$density[8],slices$density[9],slices$density[10])
    lbls <- c("<7","8","9","10")
    pie(nsl,labels=lbls,main="fractions of\nreturned pings")

    timedelta <- lapply(mydata,diff)$V1
    hist(timedelta,plot=T,xlab='time between ping calls [sec]',ylab='entries [N]',main="distribution of time\nbetween ping requests")

}

