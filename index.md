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

**\[Link to Shiny
app\]**(<a href="https://michaelbakshandeh.shinyapps.io/calendar-project/" class="uri">https://michaelbakshandeh.shinyapps.io/calendar-project/</a>)
