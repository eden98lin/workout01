Workout 1
================
Eden Lin

The Higher the Effective Shotting Rate, the Higher the Salary?
==============================================================

For those who are not particularily interested in basketball, the game generally makes little sense. One may think it is not much than throwing the ball into the basket. With this concept in mind, be able to throw the ball accurately seems like the most import skill for a basketball player to have. Therefore it may make sense for some people, that higher effective shotting percentage, means higer value, thus higher salary, of a basketball player. Is thi really true? Let's show it with some statistics.

Before getting into the data, here are some basics one may need to know about the game to understand this article. First, points in basketball are used to keep track of the score in a game. Points can be accumulated by making field goals (two or three points) or free throws (one point). If a player makes a field goal from within the three-point line, the player socres two points. If the player makes a field goal from beyong the three-point line, the player scores three points. Secondly, in a game, there are five players on court, and each of them has different positions. Shooting guard's job is to score points for his team and steal the ball on defense. A Point Guard is expected to run the team's offense by controlling the ball and making sure that it gets to the right player at the right time. Small Forward is considered to e the most versatile of the main five basketball positions, he is responsible for scoring points, defending and often as secondary or tertiary rebounders behind the power forward and center, although a few have considerable passing responsibilities. Power Forward has also been referred to as the "post" position. He typically plays offensively with their backs towards the basket and position themselves defensively uder the basket in a zone defense or against the opposing power forward in man-to-man defense. Last but not least, the center. Center usually plays near the baseline or close to the basket, they are usually the tallest players on the floor.

After this brief introduction, let's consider a example of five players from the Golden State Warriors: Andre Iguodala(SG/SF), Draymond Green(PF), Kevin Durant(SF), Klay Thompson(SG), and Stephen Curry(PG). From this example, we want to examine whether whether there is a relationship between a player's shooting skill and his salary. Notice that because of the different position on court, not everyone's main responsibility is to shoot, so it will be unfair and makes no sense to compare just how many points has a player won, or how many ball has he shot. If we have to compare their their shooting skill, a more reasonable way would be to compare each's ratio of successful attempts to attempts. If a player's value depends on how many balls he can get in to the basket, then higher success rate should mean higher salary. As given by the website Basketball Reference, these players' salaries in 2018-2019, ranked descendingly, are Stephen Curry, $37,457,154; Kevin Durant, $30,000,000; Klay Thompson, $18,988,725; Draymond Green, $17,469,565; and Andre Iguodala, $16,000,000.

All the data about these five players are downloaded from Github,<https://github.com/ucb-stat133/stat133-hws>. With some data manipulations using R, we can tidy up the data and perform some calculations to examine the question.

Like we mentioned earlier, we are going to compare these player's effective shooting percentage. We are going to do this in three different groups: the 2 points, 3 points, and overall.

Before getting into the calculation, here we provide shot charts that visulize the positions on court they shot, and how frequent they shot compare to others. Notice that there are two colors of dots, red and blue, they are colored to differentiate the successful and failed shooting attempt. <embed src="C:/Users/Eden/Desktop/UCB/Stat 133 Spring 2019/workout01/images/gsw-shot-chart.pdf" width="80%" style="display: block; margin: auto;" type="application/pdf" />

Here is the table of 2 point effective shooting percentage, rows are placed in the order from the highest 2 point effective shooting percentage to the lowest. The first column is each player'a name, the second column is the total 2 point they attempted, the third column is the number they made in, then the last column is the ratio of made-in and attempted.

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

From this table, we see that the player with the higest 2 point effective shooting percentage is Andre Iguodala, who ranked the least in salary in 2018-2019. However, despite the high effective shooting percentage, from the shot charts we can see that he is the one that shot the least. So why is there such big difference in his numbers? Well, we have to consider his position in the game, as a SG/SF, he has a versatile rolse, which sometimes may gave him good shooting chances that players of other positions do not have. In other words, his shots are more likely to be spontaneous than other players, which might be the reason for him to be the one that shoot the least but also have the highest 2 point shooting pecentage.

Moving on, below is the tbale of 3 point effective shooting percentage, calculated using the same method as 2 point.

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

Here we have the most effective shooter as Klay Thompson, who also does not rank the first in salary. Compare to Andre Iguodala, we can see from the shot charts that he shot a lot more and all over the court. Considering his role as SG, looks like he has been very responsible on court. The second most effective 2 point shooter is Stephen Curry, who ranks the first, by a lot more than the second place, in salary. He also ran around the court a lot and make a lot of shooting attempts.

Lastly, let's look at the overall effective shooting percentage.

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

Followed from the 2 point and 3 point, ther result here is not surprising, that the rank of percentage differentiate from the rank of salary.
