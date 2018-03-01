library(haven)
library(survminer)

#import dataset#
ivf<-ivf_ipd_20180220 <- read_dta("S:/OBGYN Research 2/Fellow Research MFM/Katie Johnson/IVF and IPD/SMFM/Preterm IPD/Analysis/ivf_ipd_20180220.dta")

#establish the basic survival curve for IPD#
require(survival)
ipd <- survfit(Surv(final_ga_deliv_d, ipd_d) ~ ivf_d, data = ivf)

ggsurvplot(ipd,
          data=ivf,
          censor.shape="",
          xlim=c(20,45),
          break.time.by=5,
          xlab='Gestational age at delivery (weeks)',
          ylab="Probability of IPD",
          legend.labs=c('No IVF', "IVF"))


#model for pec#
pec <- survfit(Surv(final_ga_deliv_d, final_pec) ~ ivf_d, data = ivf)

ggsurvplot(pec,
           data=ivf,
           censor.shape="",
           xlim=c(20,45),
           break.time.by=5,
           xlab='Gestational age at delivery (weeks)',
           ylab="Probability of PEC",
           legend.labs=c('No IVF', "IVF"))

#model for abruption#
abruption <- survfit(Surv(final_ga_deliv_d, final_abruption) ~ ivf_d, data = ivf)

ggsurvplot(abruption,
           data=ivf,
           censor.shape="",
           xlim=c(20,45),
           break.time.by=5,
           xlab='Gestational age at delivery (weeks)',
           ylab="Probability of abruption",
           legend.labs=c('No IVF', "IVF"))

#model for sga#
sga <- survfit(Surv(final_ga_deliv_d, final_sga) ~ ivf_d, data = ivf)

ggsurvplot(sga,
           data=ivf,
           censor.shape="",
           xlim=c(20,45),
           break.time.by=5,
           xlab='Gestational age at delivery (weeks)',
           ylab="Probability of SGA",
           legend.labs=c('No IVF', "IVF"))

#model for IUGR#
iugr <- survfit(Surv(final_ga_deliv_d, sak_iugr_d) ~ ivf_d, data = ivf)

ggsurvplot(iugr,
           data=ivf,
           censor.shape="",
           xlim=c(20,45),
           break.time.by=5,
           xlab='Gestational age at delivery (weeks)',
           ylab="Probability of IUGR",
           legend.labs=c('No IVF', "IVF"))

#model for IPD with IUGR#
ipd_iugr <- survfit(Surv(final_ga_deliv_d, ipd_iugr_d) ~ ivf_d, data = ivf)

ggsurvplot(ipd_iugr,
           data=ivf,
           censor.shape="",
           xlim=c(20,45),
           break.time.by=5,
           xlab='Gestational age at delivery (weeks)',
           ylab="Probability of IPD with IUGR",
           legend.labs=c('No IVF', "IVF"))

