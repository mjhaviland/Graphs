#this code can be used for all survival curves. The xlim option here is what makes this important as we wanted the x-axis to start 
# at 20 weeks gestational age. Nothing happened prior to that point.#

#more information can be found here#
#https://cran.r-project.org/web/packages/survminer/vignettes/Informative_Survival_Plots.html#

library(survminer)

#establish the basic survival curve. #
#time scale=final_ga_deliv_d#
#exposure=ivf_d#
#outcome=ipd_d#
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

