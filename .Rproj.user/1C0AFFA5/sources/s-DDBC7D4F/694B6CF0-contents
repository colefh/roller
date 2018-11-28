# =====================================================
# Flow of Devtools
#install.packages("devtools")
#install.packages("roxygen2")
library(roxygen2)
library(devtools)
# =====================================================

devtools::document()          # generate documentation
devtools::check_man()         # check documentation
devtools::test()              # run tests
devtools::build()             # build bundle

devtools::use_vignette("Introduction")
devtools::build_vignettes()   # build vignettes
devtools::install()           # install package
