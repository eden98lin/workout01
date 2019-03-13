#---
#title: shot charts
#description: create pdf of shot charts for players
#input(s): player data in make-shot-data-script.R
#output(s): pdf of shot charts graphed for each player
#---

library(ggplot2)

iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
green <- read.csv('../data/graymond-green.csv', stringsAsFactors = FALSE)
durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)
curry <- read.csv('../data/steohen-curry.csv', stringsAsFactors = FALSE)

court_file <- '../images/nba-court.jpg'
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, 'npc'),
  height = unit(1, 'nps')
)

pdf('../imgaes/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5)
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala') +
  theme_minimal()
dev.off()

pdf('../imgaes/graymond-green-shot-chart.pdf', width = 6.5, height = 5)
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Graymond Green') +
  theme_minimal()
dev.off()

pdf('../imgaes/kevin-durant-shot-chart.pdf', width = 6.5, height = 5)
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant') +
  theme_minimal()
dev.off()

pdf('../imgaes/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson') +
  theme_minimal()
dev.off()

pdf('../imgaes/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry') +
  theme_minimal()
dev.off()

# Create one graph, using facetting, to show all the shot charts in one image.
df <- read.txt('../output/shots-data-summary.txt')
pdf('../imgaes/gsw-shot-chart.pdf', width = 8, height = 7)
gsw_shot_chart <- ggplot(data = df) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  facet_wrap(~ name) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Golden State Warriors') +
  theme_minimal()
dev.off()

png('../imgaes/gsw-shot-chart.png', width = 8, height = 7)
gsw_shot_chart <- ggplot(data = df) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  facet_wrap(~ name) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Golden State Warriors') +
  theme_minimal()
dev.off()
