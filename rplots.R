library(haven)
library(survminer)


#import dataset#
ivf<-ivf_ipd_20180220 <- read_dta("S:/OBGYN Research 2/Fellow Research MFM/Katie Johnson/IVF and IPD/SMFM/Preterm IPD/Analysis/ivf_ipd_20180220.dta")

#establish the basic survival curve#
require(survival)
ipd <- survfit(Surv(final_ga_deliv_d, ipd_d) ~ ivf_d, data = ivf)

ggsurvplot(ipd,
          data=ivf,
          censor.shape="",
          xlim=c(20,45),
          break.time.by=5,
          xlab='Gestational age at delivery (weeks)',
          title='IPD',
          legend.labs=c('No IVF', "IVF"),
          pval=TRUE)
  
  
  
