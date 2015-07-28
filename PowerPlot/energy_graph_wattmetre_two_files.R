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
	postscript("cr_crl_power.eps",width=10,height=10,onefile = TRUE, horizontal = FALSE,paper="special")
        plot(Tps_f,Watt_f,type="l",xlab="Time (sec)",col="blue",ylim=c(0,max(Watt_f,Watt_p)),ylab="Instant Power Consumption [Watt]",main="Power consumption comparison of two policies cons_res and cons_res_power")
#	axis(4,col="blue",col.axis="blue")

	mtext("Cons_res_power Power Consumption [Watt]",side=2,col="blue")
	#	postscript("ec-GREEN-OAR-SLURM-89.62.eps",width=10,height=10,onefile = TRUE, horizontal = FALSE,paper="special")
	par(new=T)
	plot(Tps_p,Watt_p,type="l",xlab="Time (sec)",col="red",lty=c(2),ylim=c(0,max(Watt_f,Watt_p)),ylab="")
#	axis(4,col="red",col.axis="red")
	mtext("Cons_res Power Consumption [Watt]",side=4,col="red")
#	legend("topright",pch=22,col=c("black","red"),c("External Wattmeter","SLURM inband IPMI"),inset=0.04)
#	  legend("center",title="Type of collection - Calculated Energy Consumption",c(paste("External Wattmeter - ",surf_f,"Joules"),paste("SLURM inband IPMI - ",surf_p,"Joules"),col=c("red","blue"),lty=c(1,2),inset=0.001))
        dev.off()
}


ConsAllEnergy("crl_pl.compl.dat","cr_pl.compl.dat")

