### my OLD data
# 
# library(readxl)
# tiai <- as.data.frame(read_xls("~/work/kn/TrustInAI/Data&Analyses/Data/trustInAI_subjects_all_relevantVars.xls"))
# 
# library(doBy)
# summaryBy(WTP4Advisor1+WTP4AdvisorWithAI1+WTP4AI1~DelegationTrmt+InsuranceTrmt+StarsFirst, tiai)
# 
# table(tiai$DelegationTrmt, tiai$InsuranceTrmt)

rm(list = ls())

swpts <- read.csv("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data/part1data_other.csv")
swpts <- swpts[order(swpts$pid),]
fun_medSP <- function(x){
  median(as.numeric(swpts[x, 4:28]))
}
swpts$medSwPt <- sapply(1:nrow(swpts), fun_medSP)
fun_sumSP <- function(x){
  sum(as.numeric(swpts[x, 4:28]))
}
swpts$sumSwPt <- sapply(1:nrow(swpts), fun_sumSP)
aixp <- read.csv("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data/data_complete_iw.csv")
aixp <- aixp[order(aixp$pid),]
swptsp <- subset(swpts, pid %in% aixp$pid)
swptsp <- swptsp[order(swptsp$pid),]
# (swptsp$pid == aixp$pid)
aixp$medSwPt <- swptsp$medSwPt
aixp$sumSwPt <- swptsp$sumSwPt
aixp$totalAIChoices <- aixp$decision1 + aixp$decision2 + aixp$decision3 + aixp$decision4 + aixp$decision5 + aixp$decision6 + aixp$decision7 + aixp$decision8



plot.ecdf(aixp$medSwPt[aixp$decision1 == 1])
plot.ecdf(aixp$medSwPt[aixp$decision1 == 0], add = T, col = "blue")

# library(doBy)
# summaryBy(decision1~treatment, data = aixp)
summaryBy(sumSwPt~treatment, aixp)
t.test(aixp$sumSwPt[aixp$treatment == 1], aixp$sumSwPt[aixp$treatment == 2])$p.value
t.test(aixp$sumSwPt[aixp$treatment == 1], aixp$sumSwPt[aixp$treatment == 3])$p.value
t.test(aixp$sumSwPt[aixp$treatment == 1], aixp$sumSwPt[aixp$treatment == 4])$p.value
t.test(aixp$sumSwPt[aixp$treatment == 3], aixp$sumSwPt[aixp$treatment == 2])$p.value
t.test(aixp$sumSwPt[aixp$treatment == 4], aixp$sumSwPt[aixp$treatment == 2])$p.value
t.test(aixp$sumSwPt[aixp$treatment == 3], aixp$sumSwPt[aixp$treatment == 4])$p.value

aixp$avSwPt <- aixp$sumSwPt/25
aixp$EValgo <- 1*(aixp$treatment < 3)
aixp$RDUalgo <- 1*(aixp$treatment > 2)
aixp$FB <- 1*(aixp$treatment == 2) + (aixp$treatment == 4)
aixp$normAge <- (aixp$age-mean(aixp$age))/sd(aixp$age)
aixp$hhIncome[aixp$hhIncome == 0] <- NA
aixp$normIncome <- (aixp$hhIncome-mean(aixp$hhIncome, na.rm = T))/sd(aixp$hhIncome, na.rm = T)


mod1 <- summary(lm(decision1st ~ avSwPt*(RDUalgo*FB), aixp))
mod2 <- summary(lm(decision1st ~ (alpha+beta+gamma)*(RDUalgo+FB), aixp)) # adjusted R^2 clearly worse
mod3 <- summary(lm(decision1st ~ avSwPt*(RDUalgo+FB)+alpha+beta+gamma, aixp)) # adjusted R^2 clearly worse
mod4 <- summary(lm(decision1st ~ avSwPt*(RDUalgo+FB)+alpha+beta+gamma+gender+normAge+I(programming_skills == "Yes")+socioeconomic_status+I(employment == "Full-Time"), aixp)) # adjusted R^2 clearly worse
library(texreg)
texreg(list(mod1, mod2, mod3, mod4), "~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/firstDecisionRegs.txt", single.row = T, digits = 3, stars = c(0.001, 0.01, 0.05, 0.1))#, custom.columns = list("Pr(>|t|)"=c(franzl[,4])), custom.col.pos = 3)

setEPS(horizontal = FALSE, onefile = FALSE, paper = "special")
postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_byDecision1.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1]/25, main = "Switch Points", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0]/25, add = T, col = "blue")
legend("bottomright", c("chose AI", "chose themselves"), col = c("black", "blue"), lty = "solid", inset = 0.02)
dev.off()

postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_byDecision1_trmt34.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1 & aixp$treatment == 3]/25, main = "Switch Points", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0 & aixp$treatment == 3]/25, add = T, col = "blue")
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1 & aixp$treatment == 4]/25, add = T, col = "lightblue4")
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0 & aixp$treatment == 4]/25, add = T, col = "lightblue1")
legend("topleft", c("chose AI, trmt 3", "chose themselves, trmt 3","chose AI, trmt 4", "chose themselves, trmt 4"), col = c("black", "blue", "lightblue4", "lightblue1"), lty = "solid", inset = 0.02)
dev.off()

postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_byDecision1_trmt12.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1 & aixp$treatment == 1]/25, main = "Switch Points", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0 & aixp$treatment == 1]/25, add = T, col = "blue")
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1 & aixp$treatment == 2]/25, add = T, col = "lightblue4")
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0 & aixp$treatment == 2]/25, add = T, col = "lightblue1")
legend("topleft", c("chose AI, trmt 1", "chose themselves, trmt 1","chose AI, trmt 2", "chose themselves, trmt 2"), col = c("black", "blue", "lightblue4", "lightblue1"), lty = "solid", inset = 0.02)
dev.off()

# plot(jitter(aixp$totalAIChoices, 0.5),jitter(aixp$medSwPt,0.5))
# median(aixp$totalAIChoices)
aixp$frequentAIChooser <- 1*(aixp$totalAIChoices > 3)
postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_byFrequentChooser_trmt34.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1 & aixp$treatment == 3]/25, main = "Switch Points", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0 & aixp$treatment == 3]/25, add = T, col = "blue")
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1 & aixp$treatment == 4]/25, add = T, col = "lightblue4")
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0 & aixp$treatment == 4]/25, add = T, col = "lightblue1")
legend("topleft", c("frequent AI-chooser, trmt 3", "rare AI-chooser, trmt 3","frequent AI-chooser, trmt 4", "rare AI-chooser, trmt 4"), col = c("black", "blue", "lightblue4", "lightblue1"), lty = "solid", inset = 0.02)
dev.off()

postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_byFrequentChooser_trmt12.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1 & aixp$treatment == 1]/25, main = "Switch Points", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0 & aixp$treatment == 1]/25, add = T, col = "blue")
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1 & aixp$treatment == 2]/25, add = T, col = "lightblue4")
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0 & aixp$treatment == 2]/25, add = T, col = "lightblue1")
legend("topleft", c("frequent AI-chooser, trmt 1", "rare AI-chooser, trmt 1","frequent AI-chooser, trmt 2", "rare AI-chooser, trmt 2"), col = c("black", "blue", "lightblue4", "lightblue1"), lty = "solid", inset = 0.02)
dev.off()

postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_byFrequentChooser.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1]/25, main = "Switch Points", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0]/25, add = T, col = "blue")
legend("bottomright", c("frequent AI-chooser", "rare AI-chooser"), col = c("black", "blue"), lty = "solid", inset = 0.02)
dev.off()

postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_AIChoosers.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1 & aixp$treatment == 1]/25, main = "Switch Points AI-choosers", col = "brown", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1 & aixp$treatment == 2]/25, add = T, col = "red")
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1 & aixp$treatment == 3]/25, add = T, col = "orange")
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 1 & aixp$treatment == 4]/25, add = T, col = "yellow3")
legend("topleft", c("trmt 1", "trmt 2", "trmt 3", "trmt 4"), col = c("brown", "red", "orange", "yellow3"), lty = "solid", inset = 0.02)
dev.off()

postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_selfChoosers.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0 & aixp$treatment == 1]/25, main = "Switch Points Self-Choosers", col = "brown", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0 & aixp$treatment == 2]/25, add = T, col = "red")
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0 & aixp$treatment == 3]/25, add = T, col = "orange")
plot.ecdf(aixp$sumSwPt[aixp$decision1 == 0 & aixp$treatment == 4]/25, add = T, col = "yellow3")
legend("topleft", c("trmt 1", "trmt 2", "trmt 3", "trmt 4"), col = c("brown", "red", "orange", "yellow3"), lty = "solid", inset = 0.02)
dev.off()

postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_FrequentAIChoosers.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1 & aixp$treatment == 1]/25, main = "Switch Points AI-Choosers", col = "brown", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1 & aixp$treatment == 2]/25, add = T, col = "red")
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1 & aixp$treatment == 3]/25, add = T, col = "orange")
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 1 & aixp$treatment == 4]/25, add = T, col = "yellow3")
legend("topleft", c("trmt 1", "trmt 2", "trmt 3", "trmt 4"), col = c("brown", "red", "orange", "yellow3"), lty = "solid", inset = 0.02)
dev.off()

postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/MeanSwitchPts_FrequentSelfChoosers.eps")#, width=12,height=8)
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0 & aixp$treatment == 1]/25, main = "Switch Points Self-Choosers", col = "brown", xlim = c(0,20))
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0 & aixp$treatment == 2]/25, add = T, col = "red")
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0 & aixp$treatment == 3]/25, add = T, col = "orange")
plot.ecdf(aixp$sumSwPt[aixp$frequentAIChooser == 0 & aixp$treatment == 4]/25, add = T, col = "yellow3")
legend("topleft", c("trmt 1", "trmt 2", "trmt 3", "trmt 4"), col = c("brown", "red", "orange", "yellow3"), lty = "solid", inset = 0.02)
dev.off()


aixper <- read.csv("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data/data_panel_withpid.csv")
aixper <- subset(aixper, returned == 1)
fun_cp_swpt <- function(x){
  swpts$sumSwPt[swpts$pid == aixper$pid[x]]
}
aixper$swpt <- sapply(1:nrow(aixper), fun_cp_swpt)/25

# library(tidyr)
# library(dplyr)
# aixPan <- aixp %>%
#   pivot_longer(
#     cols = starts_with("decision")#,
#     # names_to = "decision"
#   )
# head(aixPan)

aix1 <- subset(aixper, round == 1)
aix28 <- subset(aixper, round > 1)
fun_prevChoice <- function(x){
  aixper$decision[aixper$pid == aix28$pid[x] & aixper$round == (aix28$round[x]-1)]
}
aix28$prevDec <- sapply(1:nrow(aix28), fun_prevChoice)
aix1 <- aix1[order(aix1$pid),]

summary(lm(decision~(rdu_algorithm+outcome_feedback)*swpt, aix1))
mod1

(aix1$pid == aixp$pid)
(aix1$swpt == aixp$avSwPt)
(aix1$decision == aixp$decision1st)
aix1$decision[c(162,169)]
aixp$decision1st[c(162,169)]
aix1$pid[c(162,169)]

# summary(lm(decision1st ~ avSwPt*(RDUalgo+FB)+alpha+beta+gamma+gender+normAge+I(programming_skills == "Yes")+socioeconomic_status+I(employment == "Full-Time"), aixp))
m1 <- summary(lm(decision1st ~ RDUalgo, aixp))
m2 <- summary(lm(decision1st ~ FB, aixp))
m3 <- summary(lm(decision1st ~ RDUalgo*FB, aixp))
m4 <- summary(lm(decision1st ~ RDUalgo*avSwPt, aixp))
m5 <- summary(lm(decision1st ~ FB*avSwPt, aixp))
m6 <- summary(lm(decision1st ~ RDUalgo*FB*avSwPt, aixp))
m7 <- summary(lm(decision1st ~ RDUalgo*(alpha+beta+gamma), aixp))
m8 <- summary(lm(decision1st ~ RDUalgo*avSwPt+gender+normAge+I(programming_skills == "Yes")+socioeconomic_status+I(employment == "Full-Time"), aixp))
m9 <- summary(lm(decision1st ~ RDUalgo*(alpha+beta+gamma)+gender+normAge+I(programming_skills == "Yes")+socioeconomic_status+I(employment == "Full-Time"), aixp))

library(texreg)
texreg(list(m1,m2,m3,m4,m5,m6), "~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/firstDecisionRegs.txt", single.row = T, digits = 3, stars = c(0.001, 0.01, 0.05, 0.1))#, custom.columns = list("Pr(>|t|)"=c(franzl[,4])), custom.col.pos = 3)
texreg(list(m4,m7,m8,m9), "~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/firstDecisionRegs2.txt", single.row = T, digits = 3, stars = c(0.001, 0.01, 0.05, 0.1))#, custom.columns = list("Pr(>|t|)"=c(franzl[,4])), custom.col.pos = 3)

aix28$switch <- abs(aix28$decision-aix28$prevDec)
aix1$normAge <- (aix1$age-mean(aix1$age))/sd(aix1$age)
fun_findNormAge <- function(x){
  aix1$normAge[aix1$pid == aix28$pid[x]]
}
aix28$normAge <- sapply(1:nrow(aix28), fun_findNormAge)
require(lmerTest)
summary(lmer(decision ~ prevDec*rdu_algorithm*outcome_feedback+swpt +gender+normAge + (1|pid),data = aix28))
summary(lmer(decision ~ (prevDec+prevsatisfaction)*rdu_algorithm*outcome_feedback+swpt +gender+normAge + (1|pid),data = aix28))

summary(mo1 <- lmer(switch ~ prevDec*prevsatisfaction + (1|pid),data = subset(aix28, treatment == 1)))
summary(mo1a <- lmer(switch ~ prevDec*prevsatisfaction+swpt+gender+normAge + (1|pid),data = subset(aix28, treatment == 1)))
summary(mo2 <- lmer(switch ~ prevDec*prevsatisfaction + (1|pid),data = subset(aix28, treatment == 2)))
summary(mo2a <- lmer(switch ~ prevDec*prevsatisfaction+swpt+gender+normAge + (1|pid),data = subset(aix28, treatment == 2)))
summary(mo3 <- lmer(switch ~ prevDec*prevsatisfaction + (1|pid),data = subset(aix28, treatment == 3)))
summary(mo3a <- lmer(switch ~ prevDec*prevsatisfaction+swpt+gender+normAge + (1|pid),data = subset(aix28, treatment == 3)))
summary(mo4 <- lmer(switch ~ prevDec*prevsatisfaction + (1|pid),data = subset(aix28, treatment == 4)))
summary(mo4a <- lmer(switch ~ prevDec*prevsatisfaction+swpt+gender+normAge + (1|pid),data = subset(aix28, treatment == 4)))
texreg(list(mo1,mo1a, mo2,mo2a, mo3,mo3a, mo4,mo4a), "~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/switchRegs.txt", single.row = T, digits = 3, stars = c(0.001, 0.01, 0.05, 0.1))#, custom.columns = list("Pr(>|t|)"=c(franzl[,4])), custom.col.pos = 3)


## evolution under satisfied customers
rd1 <- c(0.71, 0.64, 0.42, 0.49) # EV-NF, EV-F, RDU-NF, RDU-F
evnfA <- c(0.71)
fun_ar_nextRd <- function(x,arar,srsr){
  arar*x + (1-srsr)*(1-x)
}
evnfA[2] <- fun_ar_nextRd(evnfA[1], .825, .3704)
evnfA[3] <- fun_ar_nextRd(evnfA[2], .7857, .4688)
evnfA[4] <- fun_ar_nextRd(evnfA[3], .7941, .6286)
evnfA[5] <- fun_ar_nextRd(evnfA[4], .8065, .4390)
evnfA[6] <- fun_ar_nextRd(evnfA[5], .7895, .5758)
evnfA[7] <- fun_ar_nextRd(evnfA[6], .8235, .5750)
evnfA[8] <- fun_ar_nextRd(evnfA[7], .7576, .7179)

expvfA <- c(0.64)
rdunfA <- c(0.42)
rduafA <- c(0.49)
expvfA[2] <- fun_ar_nextRd(expvfA[1], .7838, .7059)
rdunfA[2] <- fun_ar_nextRd(rdunfA[1], .6667, .5273)
rduafA[2] <- fun_ar_nextRd(rduafA[1], .8000, .6875)
expvfA[3] <- fun_ar_nextRd(expvfA[2], .9310, .6750)
rdunfA[3] <- fun_ar_nextRd(rdunfA[2], .7500, .6739)
rduafA[3] <- fun_ar_nextRd(rduafA[2], .8571, .7358)
expvfA[4] <- fun_ar_nextRd(expvfA[3], .6667, .8537)
rdunfA[4] <- fun_ar_nextRd(rdunfA[3], 1.000, .8070)
rduafA[4] <- fun_ar_nextRd(rduafA[3], .5833, .7667)
expvfA[5] <- fun_ar_nextRd(expvfA[4], .6923, .7091)
rdunfA[5] <- fun_ar_nextRd(rdunfA[4], .8182, .6970)
rduafA[5] <- fun_ar_nextRd(rduafA[4], .8000, .8730)
expvfA[6] <- fun_ar_nextRd(expvfA[5], .6875, .7692)
rdunfA[6] <- fun_ar_nextRd(rdunfA[5], .6875, .7544)
rduafA[6] <- fun_ar_nextRd(rduafA[5], .6250, .8571)
expvfA[7] <- fun_ar_nextRd(expvfA[6], .8696, .8519)
rdunfA[7] <- fun_ar_nextRd(rdunfA[6], .7857, .7143)
rduafA[7] <- fun_ar_nextRd(rduafA[6], .8889, .9286)
expvfA[8] <- fun_ar_nextRd(expvfA[7], .6875, .8302)
rdunfA[8] <- fun_ar_nextRd(rdunfA[7], .7500, .7833)
rduafA[8] <- fun_ar_nextRd(rduafA[7], .8000, .9067)

evnfA
expvfA
rdunfA
rduafA
# satisSim <- data.frame(EVNF = evnfA, EVF = expvfA, RDUNF = rdunfA, RDUF = rduafA)
# write.csv(satisSim, "~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/satisfiedCustomerSim.csv")

setEPS(horizontal = FALSE, onefile = FALSE, paper = "special")
postscript("~/work/zz_nextcloud/y_AImsAndAixperience/Data&Analyses/Data_analyses/satisfiedCustomerSim.eps")#, width=12,height=8)
plot(c(1:8), evnfA, type = "l", lty = "solid", ylim = c(0,1), col = "red")
lines(expvfA, col = "purple")
lines(rdunfA, col = "lavender")
lines(rduafA, col = "lightblue1")
dev.off()

## cluster aly
library("factoextra")
# names(swptsp)[4:28]
fviz_nbclust(swptsp[,29:53], kmeans,
             method = "wss") # + geom_vline(xintercept = 3, linetype = 2) #
             # method = "silhouette")
             # method = "gap_stat")
# ## suggest to use anything between 1 and 5 clusters
# kmeans(glzB[, 2:11], 6, nstart = 20)
# # starting at 3 clusters, the analysis starts singeling out "single weirdos" (positive tcopp, pos. ccpon, neg tcopn)...
library(NbClust)
# fviz_nbclust(glzB[, 2:11], kmeans, method = "wss", k.max = 24) + theme_minimal() + ggtitle("the Elbow Method")
set.seed(1234567)
# pedro <- kmeans(swptsp[, 4:28], 7, nstart = 20) # 6/72 "gaussians"
pedro <- kmeans(swptsp[, 29:53], 5, nstart = 20) # 6/72 "gaussians"
# pedro
swptsp$bfCluster <- pedro$cluster
# pedro$centers
# table(pedro$cluster) # cluster 1
aixp$bfCluster <- swptsp$bfCluster
fun_choiceCat <- function(x, data, p, d, domp, domd){
  ifelse(data$fdec[x] == p, "P", ifelse(data$fdec[x] %in% domp, "dom-P", ifelse(data$fdec[x] == d, "D", ifelse(data$fdec[x] %in% domd, "dom-D", "NA"))))
}

sfRelier1 <- subset(aixp, decision1 == 0)
sfRelier2 <- subset(aixp, decision2 == 0)
sfRelier3 <- subset(aixp, decision3 == 0)
sfRelier4 <- subset(aixp, decision4 == 0)
sfRelier5 <- subset(aixp, decision5 == 0)
sfRelier6 <- subset(aixp, decision6 == 0)
sfRelier7 <- subset(aixp, decision7 == 0)
sfRelier8 <- subset(aixp, decision8 == 0)

sfRelier1$fdec <- sfRelier1$selection1
sfRelier1$cCat <- sapply(1:nrow(sfRelier1), fun_choiceCat, data = sfRelier1, p = 6, d = 3, domp = c(1,2,4), domd = c(5,6,7))
sfRelier2$fdec <- sfRelier2$selection2
sfRelier2$cCat <- sapply(1:nrow(sfRelier2), fun_choiceCat, data = sfRelier2, p = 4, d = 8, domp = c(2,6,7), domd = c(1,3,5))
sfRelier3$fdec <- sfRelier3$selection3
sfRelier3$cCat <- sapply(1:nrow(sfRelier3), fun_choiceCat, data = sfRelier3, p = 6, d = 5, domp = c(2,4,7), domd = c(1,3,8))
sfRelier4$fdec <- sfRelier4$selection4
sfRelier4$cCat <- sapply(1:nrow(sfRelier4), fun_choiceCat, data = sfRelier4, p = 7, d = 2, domp = c(1,3,5), domd = c(4,6,8))
sfRelier5$fdec <- sfRelier5$selection5
sfRelier5$cCat <- sapply(1:nrow(sfRelier5), fun_choiceCat, data = sfRelier5, p = 5, d = 8, domp = c(1,3,7), domd = c(2,4,6))
sfRelier6$fdec <- sfRelier6$selection6
sfRelier6$cCat <- sapply(1:nrow(sfRelier6), fun_choiceCat, data = sfRelier6, p = 7, d = 5, domp = c(2,4,6), domd = c(1,3,8))
sfRelier7$fdec <- sfRelier7$selection7
sfRelier7$cCat <- sapply(1:nrow(sfRelier7), fun_choiceCat, data = sfRelier7, p = 3, d = 4, domp = c(1,5,7), domd = c(2,6,8))
sfRelier8$fdec <- sfRelier8$selection8
sfRelier8$cCat <- sapply(1:nrow(sfRelier8), fun_choiceCat, data = sfRelier8, p = 1, d = 8, domp = c(3,5,7), domd = c(2,4,6))

table(sfRelier1$cCat, sfRelier1$bfCluster)
table(sfRelier2$cCat, sfRelier2$bfCluster)
table(sfRelier3$cCat, sfRelier3$bfCluster)
table(sfRelier4$cCat, sfRelier4$bfCluster)
table(sfRelier5$cCat, sfRelier5$bfCluster)
table(sfRelier6$cCat, sfRelier6$bfCluster)
table(sfRelier7$cCat, sfRelier7$bfCluster)
table(sfRelier8$cCat, sfRelier8$bfCluster)



table(sfRelier1$selection1, sfRelier1$bfCluster)
table(sfRelier2$selection2, sfRelier2$bfCluster)
table(sfRelier3$selection3, sfRelier3$bfCluster)
table(sfRelier4$selection4, sfRelier4$bfCluster)
table(sfRelier5$selection5, sfRelier5$bfCluster)
table(sfRelier6$selection6, sfRelier6$bfCluster)
table(sfRelier7$selection7, sfRelier7$bfCluster)
table(sfRelier8$selection8, sfRelier8$bfCluster)

