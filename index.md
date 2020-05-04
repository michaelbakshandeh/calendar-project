You can include section headers like this
=========================================

Or section subheaders like this
-------------------------------

### How do I spend my time?

Motivation + primary questions of interest

blah blah blah

I can include an image (not created in R) like this:

![cute puppy](./img/cute_puppy.png)

Create a “img” folder within your calendar-project repo and store the
image files there.

Data collection
===============

I collected data by . . .

I can write a bulleted list like this:

-   here’s the first thing I want to say
-   and I also want to say this
-   lastly, this

And a numbered list like this:

1.  First thing
2.  Second thing
3.  Third thing

Results
=======

I made a Shiny app to display my results. Images relevant to the
analysis will be screenshotted and included here, but the link to access
the Shiny app is below. I have also embedded the app in-page for
convenience, but *please do open the link as many of the graphs are
interactive.*

[Link to Shiny
app](https://michaelbakshandeh.shinyapps.io/calendar-project/)

    ## Loading required package: lattice

    ## Loading required package: ggformula

    ## Loading required package: ggstance

    ## 
    ## Attaching package: 'ggstance'

    ## The following objects are masked from 'package:ggplot2':
    ## 
    ##     geom_errorbarh, GeomErrorbarh

    ## 
    ## New to ggformula?  Try the tutorials: 
    ##  learnr::run_tutorial("introduction", package = "ggformula")
    ##  learnr::run_tutorial("refining", package = "ggformula")

    ## Loading required package: mosaicData

    ## Loading required package: Matrix

    ## 
    ## Attaching package: 'Matrix'

    ## The following objects are masked from 'package:tidyr':
    ## 
    ##     expand, pack, unpack

    ## Registered S3 method overwritten by 'mosaic':
    ##   method                           from   
    ##   fortify.SpatialPolygonsDataFrame ggplot2

    ## 
    ## The 'mosaic' package masks several functions from core packages in order to add 
    ## additional features.  The original behavior of these functions should not be affected by this.
    ## 
    ## Note: If you use the Matrix package, be sure to load it BEFORE loading mosaic.

    ## 
    ## Attaching package: 'mosaic'

    ## The following object is masked from 'package:Matrix':
    ## 
    ##     mean

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     count, do, tally

    ## The following object is masked from 'package:purrr':
    ## 
    ##     cross

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     stat

    ## The following objects are masked from 'package:stats':
    ## 
    ##     binom.test, cor, cor.test, cov, fivenum, IQR, median, prop.test,
    ##     quantile, sd, t.test, var

    ## The following objects are masked from 'package:base':
    ## 
    ##     max, mean, min, prod, range, sample, sum

    ## Registered S3 method overwritten by 'quantmod':
    ##   method            from
    ##   as.zoo.data.frame zoo

    ## 
    ## Attaching package: 'plotly'

    ## The following object is masked from 'package:mosaic':
    ## 
    ##     do

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     last_plot

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

    ## The following object is masked from 'package:graphics':
    ## 
    ##     layout

    ## ------------------------------------------------------------------------------

    ## You have loaded plyr after dplyr - this is likely to cause problems.
    ## If you need functions from both plyr and dplyr, please load plyr first, then dplyr:
    ## library(plyr); library(dplyr)

    ## ------------------------------------------------------------------------------

    ## 
    ## Attaching package: 'plyr'

    ## The following objects are masked from 'package:plotly':
    ## 
    ##     arrange, mutate, rename, summarise

    ## The following object is masked from 'package:mosaic':
    ## 
    ##     count

    ## The following object is masked from 'package:lubridate':
    ## 
    ##     here

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     arrange, count, desc, failwith, id, mutate, rename, summarise,
    ##     summarize

    ## The following object is masked from 'package:purrr':
    ## 
    ##     compact

    ## NOTE: Either Arial Narrow or Roboto Condensed fonts are required to use these themes.

    ##       Please use hrbrthemes::import_roboto_condensed() to install Roboto Condensed and

    ##       if Arial Narrow is not on your system, please see https://bit.ly/arialnarrow

    ## Loading required package: viridisLite

    ## Parsed with column specification:
    ## cols(
    ##   summary = col_character(),
    ##   class = col_character(),
    ##   activity = col_character(),
    ##   description = col_character(),
    ##   start_datetime = col_datetime(format = ""),
    ##   end_datetime = col_datetime(format = ""),
    ##   length_sec = col_double(),
    ##   length_min = col_double(),
    ##   length_hrs = col_double(),
    ##   date = col_datetime(format = "")
    ## )

    ## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.

<!--html_preserve-->
Shiny applications not supported in static R Markdown documents

<!--/html_preserve-->
