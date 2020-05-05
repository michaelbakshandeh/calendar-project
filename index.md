Purpose of this Website
=======================

COVID-19 was an extremely tumultuous time for everyone, with most people
experiencing disruptions to their daily lives and routines. I wanted to
quantify the difference in routine that I experienced while
transitioning from Amherst College to home. To best express this
difference, I have created an interactive Shiny app that displays how my
routine has changed and have analyzed the big trends that I noted.

Motivating Questions
====================

My primary questions of interest were the following:

-   What classes did I spent the most time in during quarantine?
-   Is my productivity related to my sleep patterns and, if so, how?
-   What time of day am I the most productive? In other words, what time
    of day do I do the most work?
-   How has the total time spent across broad categories that define my
    daily routine (school, exercise, social, family) changed over time?
    How has the amount of time I spend in each class changed over time?
-   What is the distribution of the amount of time I spent in each
    category?

My hope was that I could glean some insights from this data about how I
structure my time when I am in a less structured environment (Amherst
College), where I had more explicitly scheduled activities and
priorities.

And, to brighten the mood during these somber times, here’s a picture of
a cute puppy:

![cute puppy](./img/cute_puppy.png)

Data collection
---------------

I collected data by recording all of the activities that I did over the
course of two weeks. I made no intentions of doing these activities at
these particular times; data was entered retroactively since the primary
objective was to figure out how I structured my time with less explicit
structure to my routine.

I explicitly recorded my data into 5 unique classes:

1.  Data Science
2.  Evolutionary (Computation, a CS class I was taking at the time)
3.  Groups (Rings and Fields, ie Abstract Algebra)
4.  Abnormal (Psychology)
5.  Work (classified as any activity that was school-related but not
    under the particular umbrella of a class)

I also tracked each category’s “description” as one of the following:

1.  Sleep (was asleep)
2.  School (one of the five classes)
3.  Exercise
4.  Family
5.  Social (eg. Zoom meetings with friends, Netflix party, …)

I also included the particular activity that I was doing. I decided not
to include activities in my Shiny app simply because most activities had
unique identifiers (eg, Groups HW9 would be different from Groups Study
for Quiz) so it would be difficult to interactively look at how I
distributed my time by activity. I also felt that was not the objective
of my study; however, this is certainly a future direction to look into.

Each activity had a time stamp (beginning and ending time) and times are
recorded in PST.

Results
=======

I made a Shiny app to display my results. Images relevant to the
analysis will be screenshotted and included here, but the link to access
the Shiny app is below. Git unfortunately does not allow for shiny apps
to be embedded in-page, so please do click the link to open the app.

[Link to Shiny app: Diary of a Wimpy
Bakshandeh](https://michaelbakshandeh.shinyapps.io/calendar-project/)

Total Time spent in Classes over Time
-------------------------------------

The graph below is presented in my Shiny app, but is reproduced here for
ease of access:

    ## Adding missing grouping variables: `class`, `date`

    ## Warning: funs() is soft deprecated as of dplyr 0.8.0
    ## Please use a list of either functions or lambdas: 
    ## 
    ##   # Simple named list: 
    ##   list(mean = mean, median = median)
    ## 
    ##   # Auto named with `tibble::lst()`: 
    ##   tibble::lst(mean, median)
    ## 
    ##   # Using lambdas
    ##   list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
    ## This warning is displayed once per session.

    ## Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.

[classes bar graph](classes_bar_graph.html)

I’ve also included the streamgraph here for an alternative visual:

&lt;&lt;insertHTML:\[classes\_streamgraph.html\]

[Evolution of Total Time Spent in Classes-
Streamgraph](classes_streamgraph.html)

From the streamgraph, it appears that the I do the most work on Mondays
and Tuesdays, and the amount of total work that I do decreases as the
week progresses. On Mondays and Tuesdays in particular, there appears to
be a spike in the amount of work I do in my “Work” class. This is likely
because I am a TA for Multivariable Calculus, so I am logging in “Work”
on these days that doesn’t exist on any other day.

Furthermore, as affirmed by the bar chart and the streamgraph, the class
that is the most “time consuming” for me is definitely Groups. There
appears to be spikes in the amount of work I do in Groups on Wednesdays
and Thursdays (for instance, on Wednesday April 8th I worked on Groups
for 4.5 hours). This is likely because we have weekly quizzes in Groups
on Thursdays and weekly homeworks due on Thursdays (at 10pm), so I spend
some time on Wednesday working through the concepts to prepare for the
quiz.

My other classes (Data Science, Evolutionary, and Abnromal) appear not
too time-consuming in comparison. There is a spike in the amount of work
I did in Evolutionary on Monday, April 13th, and there is also a spike
in the amount of work I did in Data Science one week later. Abnromal
overall appears to be the least time consuming, since it takes up the
least amount of area in the streamgraph.

Distribution of Categories
--------------------------
