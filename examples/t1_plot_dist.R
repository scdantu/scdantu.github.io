#color alpha
sAlpha<-0.4
#initialize global variables
xLimits<-c()
yLimits<-c()
#set the tick gaps
xgap <- 100
ygap <- 0.1
dt<-100
#initialize palette of colors
myCOL <- c(
	rgb(0.0,0.0,0.0,0.8),
	rgb(0.8,0.8,0.0,sAlpha),
	rgb(1.0,0.0,0.0,sAlpha),
	rgb(1.0,0.0,1.0,sAlpha),
	rgb(0.0,1.0,0.0,sAlpha),
	rgb(0.0,0.0,1.0,sAlpha)
)
#tick plotting function
plotTicks <- function(){
	xtick<-seq(xLimits[1],xLimits[2],by=xgap)
	ytick<-seq(yLimits[1],yLimits[2],by=ygap)
	axis(side=1, at=xtick, labels =T)
	axis(side=2, at=ytick, labels =T)
	#uncomment the line below if you want to draw a line at your favorite point
	#abline(h=c(1.059),col=rgb(0.0,0.0,1.0),lty=3,lwd=2)
	#how about a nice grid
	abline(h=seq(yLimits[1],yLimits[2],0.25),v=seq(xLimits[1],xLimits[2],xgap),col=rgb(0.5,0.5,0.5),lty=3)

}
#function that plots
plotD <- function(atD,colIndex){
	plot(atD$V1,atD$V2,col=myCOL[colIndex],type='l',xlim=xLimits,ylim=yLimits,xlab="Time (ns)",ylab="Distance (nm)",main="",xaxt="n",yaxt="n",cex.main=0.4)
}

manager <- function(fName){
	#read the file
	atD<-read.table(fName);
	#identify the min, max values of each axis
	max_x <- max(atD$V1);
	max_y <- max(atD$V2);
	min_y <- min(atD$V2);
 	xMax <- max_x+(max_x*0.01);
	#yMax <- max_y+(max_y*0.01);
 	#yMin <- min_y-(min_y*0.01);
	xLimits <<- c(0,xMax);
	yLimits <<- c(0,1)
	#call the plotting function
	plotD(atD,1)
	#plot the ticks
	plotTicks()
}
#set the output png parameters
png(file = "TSPlot.png", width = 10, height = 4, units = "in", res = 300)
#plotting a single graph, set the margins
par(mfrow=c(1,1),mar=c(4,6,2,2),cex.axis=1.2)
#get the input file name
args <- commandArgs(trailingOnly = TRUE)
fName = args[1]
#call the plotting function
manager(fName)
#save the image
dev.off()
