# Graphs

##########survival curve with truncated x-axis#########
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
