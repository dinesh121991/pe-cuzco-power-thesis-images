ConsAllEnergy<-function(F)
{
        f<-read.table(F)
        Tps<-f$V1
        Watt<-f$V2

        png(file="cr_pl.png",height=1000,width=1000)
        plot(Tps,Watt,type="l",xlab="Unix Time",ylab="Consumption [Watt]",main="Cons_res resource selection power consumption measurement for ESP banchmark's workload in 5040 virtual nodes(16 cores/node) cluster")
        dev.off()
}


ConsAllEnergy("cr_pl.compl.dat")

