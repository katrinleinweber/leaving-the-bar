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

ggplot(data_summary, aes(x = Condition, y = median)) +
  geom_errorbar(aes(ymin = median,
                    ymax = median)) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    color = "grey40"
  ) +
  ggtitle("Median & data") +
  ylim(0, 2) +
  theme_classic()
