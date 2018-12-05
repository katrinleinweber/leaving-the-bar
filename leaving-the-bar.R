################################################
# J.Goedhart | @joachimgoedhart | 2017-03-07
# j.goedhart@uva.nl | http://www.molecularcytology.nl/Joachim/
# modified by Katrin Leinweber | 2018-12-05
# katrin.leinweber@tib.eu | https://github.com/katrinleinweber

library(ggplot2)

################################################
# Read the data

data_summary <-
  read.csv("https://zenodo.org/record/375944/files/Data_summary.csv?download=1")
data_tidy <-
  read.csv("https://zenodo.org/record/375944/files/Data_tidy.csv?download=1")

################################################

ggplot(data_summary, aes(x = Condition, y = mean)) +
  geom_errorbar(aes(ymin = mean,
                    ymax = mean)) +
  geom_errorbar(aes(ymin = mean - sem,
                    ymax = mean + sem),
                width = .4) +
  ggtitle("Mean & SEM") +
  ylim(0, 2) +
  theme_classic()
