Workout 1
================
Eden Lin

``` r
library(ggplot2)
library(dplyr)
library(grid)
library(jpeg)
library(plotly)
```

``` r
iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
iguodala <- mutate(iguodala, name = 'Andre Iguodala')
green <- read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE)
green <- mutate(green, name = 'Draymond Green')
durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
durant <- mutate(durant, name = 'Kevin Durant')
thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)
thompson <- mutate(thompson, name = 'Klay Thompson')
curry <- read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE)
curry <- mutate(curry, name = 'Stephen Curry')
```

``` r
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] <- 'shot_no'
green$shot_made_flag[green$shot_made_flag == 'y'] <- 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- 'shot_no'
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- 'shot_no'
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- 'shot_yes'
```

``` r
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
```

    ##   team_name          game_date             season         period     
    ##  Length:371         Length:371         Min.   :2016   Min.   :1.000  
    ##  Class :character   Class :character   1st Qu.:2016   1st Qu.:2.000  
    ##  Mode  :character   Mode  :character   Median :2016   Median :2.000  
    ##                                        Mean   :2016   Mean   :2.518  
    ##                                        3rd Qu.:2016   3rd Qu.:4.000  
    ##                                        Max.   :2016   Max.   :4.000  
    ##  minutes_remaining seconds_remaining shot_made_flag     action_type       
    ##  Min.   : 0.000    Min.   : 0.00     Length:371         Length:371        
    ##  1st Qu.: 1.000    1st Qu.:10.00     Class :character   Class :character  
    ##  Median : 4.000    Median :27.00     Mode  :character   Mode  :character  
    ##  Mean   : 4.582    Mean   :26.75                                          
    ##  3rd Qu.: 8.000    3rd Qu.:41.00                                          
    ##  Max.   :11.000    Max.   :59.00                                          
    ##   shot_type         shot_distance     opponent               x         
    ##  Length:371         Min.   : 0.00   Length:371         Min.   :-245.0  
    ##  Class :character   1st Qu.: 1.00   Class :character   1st Qu.: -65.5  
    ##  Mode  :character   Median :18.00   Mode  :character   Median :   0.0  
    ##                     Mean   :13.69                      Mean   :   3.9  
    ##                     3rd Qu.:24.00                      3rd Qu.: 101.5  
    ##                     Max.   :49.00                      Max.   : 238.0  
    ##        y              name          
    ##  Min.   :-31.00   Length:371        
    ##  1st Qu.:  2.00   Class :character  
    ##  Median : 23.00   Mode  :character  
    ##  Mean   : 73.62                     
    ##  3rd Qu.:150.00                     
    ##  Max.   :497.00

``` r
sink()
sink(file = '../output/draymond-green-summary.txt')
summary(green)
```

    ##   team_name          game_date             season         period     
    ##  Length:578         Length:578         Min.   :2016   Min.   :1.000  
    ##  Class :character   Class :character   1st Qu.:2016   1st Qu.:1.000  
    ##  Mode  :character   Mode  :character   Median :2016   Median :2.000  
    ##                                        Mean   :2016   Mean   :2.327  
    ##                                        3rd Qu.:2016   3rd Qu.:3.000  
    ##                                        Max.   :2016   Max.   :4.000  
    ##  minutes_remaining seconds_remaining shot_made_flag     action_type       
    ##  Min.   : 0.000    Min.   : 0.00     Length:578         Length:578        
    ##  1st Qu.: 2.000    1st Qu.:15.25     Class :character   Class :character  
    ##  Median : 6.000    Median :31.00     Mode  :character   Mode  :character  
    ##  Mean   : 5.536    Mean   :29.59                                          
    ##  3rd Qu.: 9.000    3rd Qu.:44.00                                          
    ##  Max.   :11.000    Max.   :59.00                                          
    ##   shot_type         shot_distance     opponent               x          
    ##  Length:578         Min.   : 0.00   Length:578         Min.   :-248.00  
    ##  Class :character   1st Qu.: 1.00   Class :character   1st Qu.: -27.00  
    ##  Mode  :character   Median : 6.00   Mode  :character   Median :   0.00  
    ##                     Mean   :12.17                      Mean   :  -7.17  
    ##                     3rd Qu.:25.00                      3rd Qu.:  18.75  
    ##                     Max.   :55.00                      Max.   : 240.00  
    ##        y             name          
    ##  Min.   :-31.0   Length:578        
    ##  1st Qu.:  8.0   Class :character  
    ##  Median : 36.0   Mode  :character  
    ##  Mean   :100.6                     
    ##  3rd Qu.:217.0                     
    ##  Max.   :535.0

``` r
sink()
sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
```

    ##   team_name          game_date             season         period    
    ##  Length:915         Length:915         Min.   :2016   Min.   :1.00  
    ##  Class :character   Class :character   1st Qu.:2016   1st Qu.:1.00  
    ##  Mode  :character   Mode  :character   Median :2016   Median :2.00  
    ##                                        Mean   :2016   Mean   :2.34  
    ##                                        3rd Qu.:2016   3rd Qu.:3.00  
    ##                                        Max.   :2016   Max.   :4.00  
    ##  minutes_remaining seconds_remaining shot_made_flag     action_type       
    ##  Min.   : 0.000    Min.   : 0.00     Length:915         Length:915        
    ##  1st Qu.: 2.000    1st Qu.:13.00     Class :character   Class :character  
    ##  Median : 6.000    Median :27.00     Mode  :character   Mode  :character  
    ##  Mean   : 5.833    Mean   :28.02                                          
    ##  3rd Qu.: 9.000    3rd Qu.:43.00                                          
    ##  Max.   :11.000    Max.   :59.00                                          
    ##   shot_type         shot_distance     opponent               x          
    ##  Length:915         Min.   : 0.00   Length:915         Min.   :-246.00  
    ##  Class :character   1st Qu.: 2.00   Class :character   1st Qu.: -29.00  
    ##  Mode  :character   Median :14.00   Mode  :character   Median :   0.00  
    ##                     Mean   :13.12                      Mean   :  11.43  
    ##                     3rd Qu.:24.00                      3rd Qu.:  73.50  
    ##                     Max.   :58.00                      Max.   : 240.00  
    ##        y              name          
    ##  Min.   :-39.00   Length:915        
    ##  1st Qu.: 11.00   Class :character  
    ##  Median : 80.00   Mode  :character  
    ##  Mean   : 98.54                     
    ##  3rd Qu.:173.50                     
    ##  Max.   :572.00

``` r
sink()
sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
```

    ##   team_name          game_date             season         period     
    ##  Length:1220        Length:1220        Min.   :2016   Min.   :1.000  
    ##  Class :character   Class :character   1st Qu.:2016   1st Qu.:1.000  
    ##  Mode  :character   Mode  :character   Median :2016   Median :2.000  
    ##                                        Mean   :2016   Mean   :2.369  
    ##                                        3rd Qu.:2016   3rd Qu.:3.000  
    ##                                        Max.   :2016   Max.   :4.000  
    ##  minutes_remaining seconds_remaining shot_made_flag     action_type       
    ##  Min.   : 0.000    Min.   : 0.00     Length:1220        Length:1220       
    ##  1st Qu.: 4.000    1st Qu.:14.00     Class :character   Class :character  
    ##  Median : 7.000    Median :29.50     Mode  :character   Mode  :character  
    ##  Mean   : 6.511    Mean   :29.19                                          
    ##  3rd Qu.: 9.000    3rd Qu.:44.00                                          
    ##  Max.   :11.000    Max.   :59.00                                          
    ##   shot_type         shot_distance     opponent               x          
    ##  Length:1220        Min.   : 0.00   Length:1220        Min.   :-248.00  
    ##  Class :character   1st Qu.:12.00   Class :character   1st Qu.: -68.00  
    ##  Mode  :character   Median :20.00   Mode  :character   Median :  14.50  
    ##                     Mean   :17.16                      Mean   :  24.89  
    ##                     3rd Qu.:25.00                      3rd Qu.: 145.25  
    ##                     Max.   :32.00                      Max.   : 246.00  
    ##        y             name          
    ##  Min.   :-29.0   Length:1220       
    ##  1st Qu.: 16.0   Class :character  
    ##  Median :105.0   Mode  :character  
    ##  Mean   :106.0                     
    ##  3rd Qu.:179.2                     
    ##  Max.   :311.0

``` r
sink()
sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
```

    ##   team_name          game_date             season         period     
    ##  Length:1250        Length:1250        Min.   :2016   Min.   :1.000  
    ##  Class :character   Class :character   1st Qu.:2016   1st Qu.:1.000  
    ##  Mode  :character   Mode  :character   Median :2016   Median :2.000  
    ##                                        Mean   :2016   Mean   :2.305  
    ##                                        3rd Qu.:2016   3rd Qu.:3.000  
    ##                                        Max.   :2016   Max.   :4.000  
    ##  minutes_remaining seconds_remaining shot_made_flag     action_type       
    ##  Min.   : 0.000    Min.   : 0.00     Length:1250        Length:1250       
    ##  1st Qu.: 1.000    1st Qu.:13.00     Class :character   Class :character  
    ##  Median : 4.000    Median :29.00     Mode  :character   Mode  :character  
    ##  Mean   : 4.221    Mean   :28.53                                          
    ##  3rd Qu.: 7.000    3rd Qu.:44.00                                          
    ##  Max.   :11.000    Max.   :59.00                                          
    ##   shot_type         shot_distance     opponent               x           
    ##  Length:1250        Min.   : 0.00   Length:1250        Min.   :-246.000  
    ##  Class :character   1st Qu.: 5.00   Class :character   1st Qu.: -96.500  
    ##  Mode  :character   Median :23.00   Mode  :character   Median :   0.500  
    ##                     Mean   :17.99                      Mean   :  -3.642  
    ##                     3rd Qu.:26.00                      3rd Qu.:  91.000  
    ##                     Max.   :71.00                      Max.   : 240.000  
    ##        y             name          
    ##  Min.   :-36.0   Length:1250       
    ##  1st Qu.: 18.0   Class :character  
    ##  Median :144.0   Mode  :character  
    ##  Mean   :135.4                     
    ##  3rd Qu.:228.0                     
    ##  Max.   :717.0

``` r
sink()
```

``` r
df <- rbind(iguodala, green, durant, thompson, curry)

write.csv(
  x = df,
  file = '../data/shots-data.csv'
)

sink(file = '../output/shots-data-summary.txt')
summary(df)
```

    ##   team_name          game_date             season         period     
    ##  Length:4334        Length:4334        Min.   :2016   Min.   :1.000  
    ##  Class :character   Class :character   1st Qu.:2016   1st Qu.:1.000  
    ##  Mode  :character   Mode  :character   Median :2016   Median :2.000  
    ##                                        Mean   :2016   Mean   :2.351  
    ##                                        3rd Qu.:2016   3rd Qu.:3.000  
    ##                                        Max.   :2016   Max.   :4.000  
    ##  minutes_remaining seconds_remaining shot_made_flag     action_type       
    ##  Min.   : 0.000    Min.   : 0.00     Length:4334        Length:4334       
    ##  1st Qu.: 2.000    1st Qu.:13.00     Class :character   Class :character  
    ##  Median : 5.000    Median :29.00     Mode  :character   Mode  :character  
    ##  Mean   : 5.412    Mean   :28.60                                          
    ##  3rd Qu.: 8.000    3rd Qu.:43.75                                          
    ##  Max.   :11.000    Max.   :59.00                                          
    ##   shot_type         shot_distance     opponent               x           
    ##  Length:4334        Min.   : 0.00   Length:4334        Min.   :-248.000  
    ##  Class :character   1st Qu.: 2.25   Class :character   1st Qu.: -56.000  
    ##  Mode  :character   Median :19.00   Mode  :character   Median :   1.000  
    ##                     Mean   :15.58                      Mean   :   7.746  
    ##                     3rd Qu.:25.00                      3rd Qu.:  95.500  
    ##                     Max.   :71.00                      Max.   : 246.000  
    ##        y             name          
    ##  Min.   :-39.0   Length:4334       
    ##  1st Qu.: 13.0   Class :character  
    ##  Median : 95.0   Mode  :character  
    ##  Mean   :109.4                     
    ##  3rd Qu.:198.0                     
    ##  Max.   :717.0

``` r
sink()
```

``` r
#length(curry$shot_type[curry$shot_type == '2PT Field Goal'])
#length(curry$shot_made_flag[curry$shot_made_flag == '2PT Field Goal'])
table_2pt <- arrange(
  summarise(
    group_by(df, name),
    total = length(shot_type[shot_type == '2PT Field Goal']),
    made = length(shot_made_flag[shot_made_flag == 'shot_yes' & shot_type == '2PT Field Goal']),
    perc_made = made/total
  ),
  desc(perc_made)
)
table_2pt
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

``` r
table_3pt <- arrange(
  summarise(
    group_by(df, name),
    total = length(shot_type[shot_type == '3PT Field Goal']),
    made = length(shot_made_flag[shot_made_flag == 'shot_yes' & shot_type == '3PT Field Goal']),
    perc_made = made/total
  ),
  desc(perc_made)
)
table_3pt
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Draymond Green   232    74     0.319

``` r
table_total <- arrange(
  summarise(
    group_by(df, name),
    total = length(shot_type),
    made = length(shot_made_flag[shot_made_flag == 'shot_yes']),
    perc_made = made/total
  ),
  desc(perc_made)
)
table_total
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

``` r
court_file <- '../images/nba-court.jpg'
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, 'npc'),
  height = unit(1, 'npc')
)

pdf('../images/gsw-shot-chart.pdf', width = 8, height = 7)
ggplot(data = df) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  facet_wrap(~ name) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Golden State Warriors') +
  theme_minimal()
```

    ## Warning: Removed 22 rows containing missing values (geom_point).

``` r
dev.off()
```

    ## png 
    ##   2

``` r
knitr::include_graphics('../images/gsw-shot-chart.pdf')
```

<embed src="../images/gsw-shot-chart.pdf" width="80%" style="display: block; margin: auto;" type="application/pdf" />
