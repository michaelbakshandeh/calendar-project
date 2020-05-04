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

    ## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-4ea24d356b9c35a04c7f">{"x":{"data":[{"orientation":"v","width":[0.30000000000291,0.30000000000291,0.30000000000291,0.900000000001455,0.180000000000291,0.30000000000291,0.44999999999709,0.224999999998545],"base":[0,0,0,0,0,0,0,0],"x":[18359.7,18361.7,18362.7,18364,18365.64,18366.7,18370.775,18371.6625],"y":[1.5,1,1,0.75,1,3.5,2.25,1],"text":["class: Abnormal<br />date: 2020-04-08<br />total: 1.50","class: Abnormal<br />date: 2020-04-10<br />total: 1.00","class: Abnormal<br />date: 2020-04-11<br />total: 1.00","class: Abnormal<br />date: 2020-04-12<br />total: 0.75","class: Abnormal<br />date: 2020-04-14<br />total: 1.00","class: Abnormal<br />date: 2020-04-15<br />total: 3.50","class: Abnormal<br />date: 2020-04-19<br />total: 2.25","class: Abnormal<br />date: 2020-04-20<br />total: 1.00"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(68,1,84,0.6)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Abnormal","legendgroup":"Abnormal","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.30000000000291,0.30000000000291,0.30000000000291,0.30000000000291,0.224999999998545,0.180000000000291,0.30000000000291,0.224999999998545,0.30000000000291,0.224999999998545,0.224999999998545],"base":[0,0,0,0,0,0,0,0,0,0,0],"x":[18360,18360.7,18362,18363,18364.6625,18365.82,18367,18367.6625,18369.7,18371.8875,18372.6625],"y":[2,2.5,1,1,0.25,1,1,1.5,1,3.75,1],"text":["class: Data Science<br />date: 2020-04-08<br />total: 2.00","class: Data Science<br />date: 2020-04-09<br />total: 2.50","class: Data Science<br />date: 2020-04-10<br />total: 1.00","class: Data Science<br />date: 2020-04-11<br />total: 1.00","class: Data Science<br />date: 2020-04-13<br />total: 0.25","class: Data Science<br />date: 2020-04-14<br />total: 1.00","class: Data Science<br />date: 2020-04-15<br />total: 1.00","class: Data Science<br />date: 2020-04-16<br />total: 1.50","class: Data Science<br />date: 2020-04-18<br />total: 1.00","class: Data Science<br />date: 2020-04-20<br />total: 3.75","class: Data Science<br />date: 2020-04-21<br />total: 1.00"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(59,82,139,0.6)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Data Science","legendgroup":"Data Science","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.30000000000291,0.30000000000291,0.224999999998545,0.180000000000291,0.224999999998545,0.44999999999709,0.30000000000291,0.224999999998545],"base":[0,0,0,0,0,0,0,0],"x":[18361,18363.3,18364.8875,18366,18367.8875,18368.775,18370,18372.8875],"y":[1.5,2,4.5,1.5,1.5,0.5,3,2.75],"text":["class: Evolutionary<br />date: 2020-04-09<br />total: 1.50","class: Evolutionary<br />date: 2020-04-11<br />total: 2.00","class: Evolutionary<br />date: 2020-04-13<br />total: 4.50","class: Evolutionary<br />date: 2020-04-14<br />total: 1.50","class: Evolutionary<br />date: 2020-04-16<br />total: 1.50","class: Evolutionary<br />date: 2020-04-17<br />total: 0.50","class: Evolutionary<br />date: 2020-04-18<br />total: 3.00","class: Evolutionary<br />date: 2020-04-21<br />total: 2.75"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(33,144,140,0.6)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Evolutionary","legendgroup":"Evolutionary","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.30000000000291,0.30000000000291,0.30000000000291,0.224999999998545,0.180000000000291,0.30000000000291,0.224999999998545,0.44999999999709,0.30000000000291,0.44999999999709,0.224999999998545,0.224999999998545],"base":[0,0,0,0,0,0,0,0,0,0,0,0],"x":[18360.3,18361.3,18362.3,18365.1125,18366.18,18367.3,18368.1125,18369.225,18370.3,18371.225,18372.1125,18373.1125],"y":[4.5,3,0.5,1,1,3.75,3.75,1,2,1.75,3,1],"text":["class: Groups<br />date: 2020-04-08<br />total: 4.50","class: Groups<br />date: 2020-04-09<br />total: 3.00","class: Groups<br />date: 2020-04-10<br />total: 0.50","class: Groups<br />date: 2020-04-13<br />total: 1.00","class: Groups<br />date: 2020-04-14<br />total: 1.00","class: Groups<br />date: 2020-04-15<br />total: 3.75","class: Groups<br />date: 2020-04-16<br />total: 3.75","class: Groups<br />date: 2020-04-17<br />total: 1.00","class: Groups<br />date: 2020-04-18<br />total: 2.00","class: Groups<br />date: 2020-04-19<br />total: 1.75","class: Groups<br />date: 2020-04-20<br />total: 3.00","class: Groups<br />date: 2020-04-21<br />total: 1.00"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(93,200,99,0.6)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Groups","legendgroup":"Groups","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.224999999998545,0.180000000000291,0.224999999998545,0.224999999998545,0.224999999998545],"base":[0,0,0,0,0],"x":[18365.3375,18366.36,18368.3375,18372.3375,18373.3375],"y":[3,3,1,2,3.5],"text":["class: Work<br />date: 2020-04-13<br />total: 3.00","class: Work<br />date: 2020-04-14<br />total: 3.00","class: Work<br />date: 2020-04-16<br />total: 1.00","class: Work<br />date: 2020-04-20<br />total: 2.00","class: Work<br />date: 2020-04-21<br />total: 3.50"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(253,231,37,0.6)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"Work","legendgroup":"Work","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":95.7011207970112,"r":39.8505603985056,"b":147.945205479452,"l":63.2627646326277},"font":{"color":"rgba(0,0,0,1)","family":"Arial Narrow","size":15.2760481527605},"title":{"text":"<b> Time Spent on Particular Classes <br />And Job-Related Endeavors <\/b>","font":{"color":"rgba(0,0,0,1)","family":"Arial Narrow","size":23.9103362391034},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[18358.855,18374.145],"tickmode":"array","ticktext":["Tue Apr 07","Wed Apr 08","Thu Apr 09","Fri Apr 10","Sat Apr 11","Sun Apr 12","Mon Apr 13","Tue Apr 14","Wed Apr 15","Thu Apr 16","Fri Apr 17","Sat Apr 18","Sun Apr 19","Mon Apr 20","Tue Apr 21","Wed Apr 22"],"tickvals":[18359,18360,18361,18362,18363,18364,18365,18366,18367,18368,18369,18370,18371,18372,18373,18374],"categoryorder":"array","categoryarray":["Tue Apr 07","Wed Apr 08","Thu Apr 09","Fri Apr 10","Sat Apr 11","Sun Apr 12","Mon Apr 13","Tue Apr 14","Wed Apr 15","Thu Apr 16","Fri Apr 17","Sat Apr 18","Sun Apr 19","Mon Apr 20","Tue Apr 21","Wed Apr 22"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.81901203819012,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"Arial Narrow","size":15.2760481527605},"tickangle":-90,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(204,204,204,1)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"y","title":{"text":"Date","font":{"color":"rgba(0,0,0,1)","family":"Arial Narrow","size":11.9551681195517}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-0.225,4.725],"tickmode":"array","ticktext":["0","1","2","3","4"],"tickvals":[0,1,2,3,4],"categoryorder":"array","categoryarray":["0","1","2","3","4"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.81901203819012,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"Arial Narrow","size":15.2760481527605},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(204,204,204,1)","gridwidth":0.265670402656704,"zeroline":false,"anchor":"x","title":{"text":"Total Time in Hours","font":{"color":"rgba(0,0,0,1)","family":"Arial Narrow","size":11.9551681195517}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"Arial Narrow","size":12.2208385222084},"y":0.909448818897638},"annotations":[{"text":"class","x":1.02,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"Arial Narrow","size":15.2760481527605},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"left","yanchor":"bottom","legendTitle":true}],"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"5f2475807d61":{"fill":{},"x":{},"y":{},"type":"bar"}},"cur_data":"5f2475807d61","visdat":{"5f2475807d61":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
I’ve also included the streamgraph here for an alternative visual:

<!--html_preserve-->

<center>
<label style='padding-right:5px' for='htmlwidget-0beb25bf0f79c33a3754-select'></label><select id='htmlwidget-0beb25bf0f79c33a3754-select' style='visibility:hidden;'></select>
</center>

<script type="application/json" data-for="htmlwidget-0beb25bf0f79c33a3754">{"x":{"data":{"key":["Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work","Abnormal","Data Science","Evolutionary","Groups","Work"],"value":[1.5,2,0,4.5,0,0,2.5,1.5,3,0,1,1,0,0.5,0,1,1,2,0,0,0.75,0,0,0,0,0,0.25,4.5,1,3,1,1,1.5,1,3,3.5,1,0,3.75,0,0,1.5,1.5,3.75,1,0,0,0.5,1,0,0,1,3,2,0,2.25,0,0,1.75,0,1,3.75,0,3,2,0,1,2.75,1,3.5],"date":["2020-04-08","2020-04-08","2020-04-08","2020-04-08","2020-04-08","2020-04-09","2020-04-09","2020-04-09","2020-04-09","2020-04-09","2020-04-10","2020-04-10","2020-04-10","2020-04-10","2020-04-10","2020-04-11","2020-04-11","2020-04-11","2020-04-11","2020-04-11","2020-04-12","2020-04-12","2020-04-12","2020-04-12","2020-04-12","2020-04-13","2020-04-13","2020-04-13","2020-04-13","2020-04-13","2020-04-14","2020-04-14","2020-04-14","2020-04-14","2020-04-14","2020-04-15","2020-04-15","2020-04-15","2020-04-15","2020-04-15","2020-04-16","2020-04-16","2020-04-16","2020-04-16","2020-04-16","2020-04-17","2020-04-17","2020-04-17","2020-04-17","2020-04-17","2020-04-18","2020-04-18","2020-04-18","2020-04-18","2020-04-18","2020-04-19","2020-04-19","2020-04-19","2020-04-19","2020-04-19","2020-04-20","2020-04-20","2020-04-20","2020-04-20","2020-04-20","2020-04-21","2020-04-21","2020-04-21","2020-04-21","2020-04-21"]},"markers":null,"annotations":null,"offset":"silhouette","interactive":true,"interpolate":"cardinal","palette":"Pastel2","text":"black","tooltip":"black","x_tick_interval":"day","x_tick_units":1,"x_tick_format":"%a %b %d","y_tick_count":5,"y_tick_format":",g","top":20,"right":40,"bottom":30,"left":50,"legend":false,"legend_label":"","fill":"brewer","label_col":"black","x_scale":"date","sort":true,"order":"inside-out"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
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
