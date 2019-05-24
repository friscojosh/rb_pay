###############################################
### An analysis of RB pay in the NFL over time
### Data from Overthecap.com
### https://overthecap.com/positional-spending/
###############################################

library("tidyverse")
library(theme538)

pay_by_position <- read_csv("data/rb_pay.csv")

grouped <- pay_by_position %>%
   group_by(year) %>%
   summarize(rb_pct = mean(rb_pct))

write_csv(grouped, "rb_pay_pct.csv")

grouped %>%
   ggplot(aes(x = year, y = rb_pct)) +
   geom_line(size = 1.2, alpha = .4) +
   geom_point(size = 2, alpha = .4) +
   scale_x_continuous(
      limit = c(2013, 2019),
      breaks = c(seq(
         from = 2013,
         to = 2019,
         by = 1
      )),
      minor_breaks = NULL
   ) +
   scale_y_continuous(
      limit = c(0, .08),
      breaks = c(seq(
         from = 0,
         to = .08,
         by = .02
      )),
      minor_breaks = NULL,
      labels = scales::percent
   ) +
   labs(x = "Year", y = "% of cap on RB",
        caption = "Source: overthecap.com") +
   theme_538 + theme(legend.position="none")
