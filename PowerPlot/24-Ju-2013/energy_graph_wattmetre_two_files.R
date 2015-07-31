ConsAllEnergy<-function(F,P)
{
        f<-read.table(F)
	p<-read.table(P)
        Tps_f<-f$V1
        Watt_f<-f$V2
        Tps_p<-p$V1
        Watt_p<-p$V2
	surf_f <- (sum(Watt_f))
	surf_p <- (sum(Watt_p))

#        png(file="Power_consumption_wattmeter.png",height=1000,width=1000)
	postscript("cr_crl_31_ju.eps",width=20,height=10,onefile = TRUE, horizontal = FALSE,paper="special")
        plot(Tps_f,Watt_f,type="l",xlab="Time (sec)",col="blue",ylim=c(0,max(Watt_f,Watt_p)),ylab="Instant Power Consumption [Watt]",main="Power consumption comparison of two policies cons_res and cons_res_layout_power")
#	axis(4,col="blue",col.axis="blue")

	mtext("Cons_res Power Consumption [Watt]",side=2,col="blue")
	#	postscript("ec-GREEN-OAR-SLURM-89.62.eps",width=10,height=10,onefile = TRUE, horizontal = FALSE,paper="special")
	par(new=T)
	plot(Tps_p,Watt_p,type="l",xlab="Time (sec)",col="red",lty=c(2),ylim=c(0,max(Watt_f,Watt_p)),ylab="")
#	axis(4,col="red",col.axis="red")
	mtext("Cons_res_layout_power Power Consumption [Watt]",side=4,col="red")
	legend("topright",pch=22,col=c("blue","red"),c("cons_res","cons_res_layout_power"),inset=0.04)
	  legend("bottomleft",title="Type of collection - Calculated Energy Consumption",c(paste("cons_res - ",surf_f,"Joules"),paste("cons_res_layout_power - ",surf_p,"Joules"),col=c("blue","red"),lty=c(1,2),inset=0.001))
        dev.off()
}


ConsAllEnergy("cr_31_ju.compl.dat","crl_pl_ju_31.compl.dat")

