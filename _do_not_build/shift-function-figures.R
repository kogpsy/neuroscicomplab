

# packages:
# library(rogme)
library(ggplot2)
library(patchwork)
## ============================
source("_do_not_build/shift_function/Rallfun-v30.R")
source("_do_not_build/shift_function/wilcox_modified.R")
source("_do_not_build/shift_function/rgar_visualisation.R")
source("_do_not_build/shift_function/rgar_utils.R")


# --------------------------------
# example 1: difference in spread
# --------------------------------
set.seed(21)
g1 <- rnorm(1000) + 6
g2 <- rnorm(1000)*1.5 + 6

ks(g1,g2) # Kolmogorov-Smirnov test
# ks(cont,expt,w=T) # uses a weighted version more sensitive to differences occuring in the tails
t.test(g1,g2) # regular Welsh t-test


# make data frame
df <- mkdf2(g1,g2)

# kernel density estimate + rug plot + superimposed deciles
kde <- plot.kde_rug_dec2(df)

# compute shift function
out <- shifthd( g1, g2, nboot=200)

# plot shift function
sf <- plot.sf(data=out) # function from rgar_visualisation.txt

kde / sf
ggsave(filename = "images/shiftfun-1.png")


## example 2 ----

set.seed(21)
g1 <- rnorm(1000) + 6
g2 <- rnorm(1000) + 6.5

ks(g1,g2) # Kolmogorov-Smirnov test
t.test(g1,g2) # regular Welsh t-test

# make data frame
df <- mkdf2(g1,g2)
# kernel density estimate + rug plot + superimposed deciles
kde <- plot.kde_rug_dec2(df)
# compute shift function
out <- shifthd( g1, g2, nboot=200)
# plot shift function
sf <- plot.sf(data=out) # function from rgar_visualisation.txt
# combine KDE + SF

kde / sf
ggsave(filename = "images/shiftfun-2.png")


## example 3 ----
set.seed(21)
g1 <- rnorm(1000)
g1[g1>0] <- g1[g1>0]*2
g2 <- rnorm(1000)

ks(g1,g2) # Kolmogorov-Smirnov test
t.test(g1,g2) # regular Welsh t-test

# make data frame
df <- mkdf2(g1,g2)
# kernel density estimate + rug plot + superimposed deciles
kde <- plot.kde_rug_dec2(df)
# compute shift function
out <- shifthd( g1, g2, nboot=200)
# plot shift function
sf <- plot.sf(data=out) # function from rgar_visualisation.txt

# combine KDE + SF

kde / sf
ggsave(filename = "images/shiftfun-3.png")
