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
# Plot Bargraph with SEM

ggplot(data_summary, aes(x = Condition, y = mean)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean,
                    ymax = mean + sem),
                width = .4) +
  ggtitle("Barplot & SEM") +
  ylim(0, 2) +
  theme_classic()

################################################
# Plot the mean with SEM

ggplot(data_summary, aes(x = Condition, y = mean)) +
  geom_errorbar(aes(ymin = mean,
                    ymax = mean)) +
  geom_errorbar(aes(ymin = mean - sem,
                    ymax = mean + sem),
                width = .4) +
  ggtitle("Mean & SEM") +
  ylim(0, 2) +
  theme_classic()

################################################
# Plot the mean with dots

ggplot(data_summary, aes(x = Condition, y = mean)) +
  geom_errorbar(aes(ymin = mean,
                    ymax = mean)) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    color = "grey40"
  ) +
  ggtitle("Mean & data") +
  ylim(0, 2) +
  theme_classic()

################################################
# Plot the median with dots

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

################################################
# Plot median with dots and 95%CI

ggplot(data_summary, aes(x = Condition, y = median)) +
  geom_errorbar(aes(ymin = median - CImedian,
                    ymax = median + CImedian)) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    color = "grey40"
  ) +
  ggtitle("95% CI (median) & data") +
  ylim(0, 2) +
  theme_classic()

################################################
# Plot box&dotplot with notches

ggplot(data_tidy, aes(x = Condition, y = ratio)) +
  geom_boxplot(fill = "grey90",
               notch = TRUE,
               outlier.color = NA) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    color = "grey40"
  ) +
  ggtitle("Boxplot & data") +
  ylim(0, 2) +
  theme_classic()
