ConsAllEnergy<-function(F)
{
        f<-read.table(F)
        Tps<-f$V1
        Watt<-f$V2

        png(file="cr_pl-2.png",height=1000,width=1000)
        plot(Tps,Watt,type="l",xlab="Unix Time",ylab="Consumption [Watt]",main="Cons_res_layout_power's Cluster power consumption measurement for ESP banchmark's workload in 5040 nodes(16 cores/node)")
        dev.off()
}


ConsAllEnergy("cr_pl-2.compl.dat")

