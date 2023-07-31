import delimited "C:\...\Data_2018.csv", case(preserve) encoding(UTF-8) 

gen log_GNI = ln(GNI)

oprobit frontier HE log_GNI Edu_gm
estat ic

ologit frontier HE log_GNI Edu_gm
estat ic

*smaller AIC and BIC show better fit of the model

ologit frontier HE log_GNI Edu_gm
predict myHDI, xb

gsort -frontier -myHDI

egen myHDI_frontier_rank = rank(-myHDI), by(frontier) unique


gsort -myHDI

egen myHDI_rank = rank(-myHDI)

export delimited using "C:\...\DataAndResults_2018.csv", replace

clear
drop _all

*to visualise the scores of the proposed index, please follow the code presented in the Step3 .ipynb code