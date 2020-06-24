#library(BCRA)

#* Absolute Risk
#* @post /absolute.risk

#* @get /absolute.risk
function(req, age=35, biopsies=1, hyperplasia=1, menstruation=1, first_birth=1, relatives=1, race=1, Raw_Ind=1, Avg_White=1) {
    # BrCa_1_AR.rda
    # BrCa_beta.rda
    # BrCa_lambda1.rda
    # BrCa_lambda2.rda
    # exampledata.rda
    cat(" age::", age, biopsies, hyperplasia, menstruation, first_birth, relatives, race, Raw_Ind, Avg_White)
    source("../R/recode.check.R")
    source("../R/relative.risk.R")
    source("../R/absolute.risk.R")
    #attach(file.path("..","data",data))
    # Not sure how to switch the data input based on the 
    # data variable passed in
    absolute.risk(data.frame(ID=1,
                             T1=as.numeric(age),
                             T2=as.numeric(age)+5,
                             N_Biop=as.integer(biopsies),
                             HypPlas=ifelse(as.integer(biopsies) == 0 |
                                              as.integer(biopsies) == 99,
                                            99,as.integer(hyperplasia)),
                             AgeMen=as.numeric(menstruation),
                             Age1st=as.numeric(first_birth),
                             N_Rels=as.numeric(relatives),
                             Race =as.integer(race)), Raw_Ind, Avg_White
                  )
}

#* Relative Risk 
#* @param data_name The template data name
#* @param Raw_Ind 
#* @get /relative.risk
function(data="exampledata.rda", Raw_Ind=1) {
    source("../R/recode.check.R")        
    source("../R/relative.risk.R")
    attach(file.path("..","data",data))
    relative.risk(exampledata, Raw_Ind)
}

#* Check Summary
#* @param data_name The template data name
#* @param Raw_Ind 
#* @param Avg_white
#* @get /check.summary
function(data="exampledata.rda", Raw_Ind=1, Avg_White=0) {    
    source("../R/recode.check.R")
    source("../R/relative.risk.R")
    source("../R/absolute.risk.R")
    source("../R/check.summary.R")
    attach(file.path("..","data",data))
    check.summary(exampledata, Raw_Ind, Avg_White)
}

#* Risk Summary
#* @param data_name The template data name
#* @param Raw_Ind 
#* @get /risk.summary
function(data="exampledata.rda", Raw_Ind=1) {    
    source("../R/recode.check.R")
    source("../R/relative.risk.R")
    source("../R/absolute.risk.R")
    source("../R/risk.summary.R")
    attach(file.path("..","data",data))
    risk.summary(exampledata, Raw_Ind)
}


