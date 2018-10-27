# purrr is better!

[`purrr`](https://github.com/tidyverse/purrr) is a much better package for this use case than `eply`. Please use [`purrr`](https://github.com/tidyverse/purrr).

# eply

[![Project Status: Inactive – The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](https://www.repostatus.org/badges/latest/inactive.svg)](https://www.repostatus.org/#inactive)

The `eply` package processes batches of quoted expressions. Just as `apply()` acts on data frames of function arguments, `eply()` acts on data frames of quoted **expressions** that **return** arguments. The package also has `evals()`, which simply evaluates a character vector of quoted expressions, plus some nice utilities.

# Installation

First, ensure that [R](https://www.r-project.org/) is installed, as well as the dependencies in the [`DESCRIPTION`](https://github.com/wlandau/eply/blob/master/DESCRIPTION). To install the [latest CRAN release](https://cran.r-project.org/web/packages/eply/), run

```r
install.packages("eply")
```

To install the development version, get the [devtools](https://cran.r-project.org/web/packages/devtools/) package and then run 

```r
devtools::install_github("wlandau/eply", build = TRUE)
```

Alternatively, download the source, unzip it, and install it locally.

```r
devtools::install_local("eply", build = TRUE)
```


# Tutorial

The [online package vignette](https://CRAN.R-project.org/package=eply/vignettes/eply.html) has a complete tutorial. You can the load the compiled version from an R session.

```r
vignette("eply")
```


# Help and troubleshooting

Use the `help_eply()` function to obtain a collection of helpful links. For troubleshooting, please refer to [TROUBLESHOOTING.md](https://github.com/wlandau/eply/blob/master/TROUBLESHOOTING.md) on the [GitHub page](https://github.com/wlandau/eply) for instructions.
