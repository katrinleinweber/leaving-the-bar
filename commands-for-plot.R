################################################
# J.Goedhart | @joachimgoedhart | 2017-03-07
# j.goedhart@uva.nl | http://www.molecularcytology.nl/Joachim/
################################################
# Commands that can be executed in R/Rstudio to create graphs
# Requires the library 'ggplot2': http://ggplot2.org
################################################


################################################
# Read the data (should be modified to load data from the correct directory)

data_summary <- read.csv("Data_summary.csv")
data_tidy <- read.csv("Data_tidy.csv")

################################################
# Plot Bargraph with SEM

ggplot(data_summary, aes(x = Condition, y = mean)) +
  geom_bar(
    position = position_dodge(),
    stat = "identity",
    fill = "grey90",
    color = "black",
    size = 1,
    width = 0.6
  ) +
  geom_errorbar(aes(ymin = mean,
                    ymax = mean + sem),
                width = .4) +
  ggtitle("Barplot & SEM") +
  ylim(0, 2) +
  theme_light(base_size = 18) +
  theme(panel.border = element_rect(
    size = 0.5,
    linetype = "solid",
    colour = "black",
    fill = NA
  )) +
  theme(axis.text.y = element_text(size = 18)) +
  ylab("Value [-]") +
  theme(aspect.ratio = 6 / 3)

################################################
# Plot the mean with SEM

ggplot(data_summary, aes(x = Condition, y = mean)) +
  geom_errorbar(aes(ymin = mean,
                    ymax = mean),
                width = .6) +
  geom_errorbar(aes(ymin = mean - sem,
                    ymax = mean + sem),
                width = .4) +
  ggtitle("Mean & SEM") +
  ylim(0, 2) +
  theme_light(base_size = 18) +
  theme(panel.border = element_rect(
    size = 0.5,
    linetype = "solid",
    colour = "black",
    fill = NA
  )) +
  theme(axis.text.y = element_text(size = 18)) +
  ylab("Value [-]") +
  theme(aspect.ratio = 6 / 3)

################################################
# Plot the mean with dots

ggplot(data_summary, aes(x = Condition, y = mean)) +
  geom_errorbar(aes(ymin = mean,
                    ymax = mean),
                width = .4,
                size = 1) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    cex = 1,
    color = "grey40"
  ) +
  ggtitle("Mean & data") +
  ylim(0, 2) +
  theme_light(base_size = 18) +
  theme(panel.border = element_rect(
    size = 0.5,
    linetype = "solid",
    colour = "black",
    fill = NA
  )) +
  theme(axis.text.y = element_text(size = 18)) +
  ylab("Value [-]") +
  theme(aspect.ratio = 6 / 3)

################################################
# Plot the median with dots

ggplot(data_summary, aes(x = Condition, y = median)) +
  geom_errorbar(aes(ymin = median,
                    ymax = median),
                width = .4) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    cex = 1,
    color = "grey40"
  ) +
  ggtitle("Median & data") +
  ylim(0, 2) +
  theme_light(base_size = 18) +
  theme(panel.border = element_rect(
    size = 0.5,
    linetype = "solid",
    colour = "black",
    fill = NA
  )) +
  theme(axis.text.y = element_text(size = 18)) +
  ylab("Value [-]") +
  theme(aspect.ratio = 6 / 3)

################################################
# Plot median with dots and 95%CI

ggplot(data_summary, aes(x = Condition, y = median)) +
  geom_errorbar(
    aes(ymin = median - CImedian,
        ymax = median + CImedian),
    width = .4,
    size = 1
  ) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    cex = 1,
    color = "grey40"
  ) +
  ggtitle("95% CI (median) & data") +
  ylim(0, 2) +
  theme_light(base_size = 18) +
  theme(panel.border = element_rect(
    size = 0.5,
    linetype = "solid",
    colour = "black",
    fill = NA
  )) +
  theme(axis.text.y = element_text(size = 18)) +
  ylab("Value [-]") +
  theme(aspect.ratio = 6 / 3)

################################################
# Plot box&dotplot with notches

ggplot(data_tidy, aes(x = Condition, y = ratio)) +
  geom_boxplot(
    fill = "grey90",
    notch = TRUE,
    outlier.color = NA,
    width = 0.8,
    size = 0.6
  ) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    cex = 1,
    color = "grey40"
  ) +
  ggtitle("Boxplot & data") +
  ylim(0, 2) +
  theme_light(base_size = 18) +
  theme(panel.border = element_rect(
    size = 0.5,
    linetype = "solid",
    colour = "black",
    fill = NA
  )) +
  theme(axis.text.y = element_text(size = 18)) +
  ylab("Value [-]") +
  theme(aspect.ratio = 6 / 3)



################################################
# Alternatives (that were not used for the animated GIF)
################################################

# Plot mean with dots and 95%CI

ggplot(data_summary, aes(x = Condition, y = mean)) +
  geom_errorbar(aes(ymin = mean - CI,
                    ymax = mean + CI),
                width = .4,
                size = 1) +
  geom_jitter(
    data = data_tidy,
    aes(Condition, ratio),
    position = position_jitter(0.3),
    cex = 1,
    color = "grey40"
  ) +
  ggtitle("95% CI (mean) & data") +
  ylim(0, 2) +
  theme_light(base_size = 18) +
  theme(panel.border = element_rect(
    size = 0.5,
    linetype = "solid",
    colour = "black",
    fill = NA
  )) +
  theme(axis.text.y = element_text(size = 18)) +
  ylab("Value [-]") +
  theme(aspect.ratio = 6 / 3)
