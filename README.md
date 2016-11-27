# eply

[![Travis-CI Build Status](https://travis-ci.org/wlandau/eply.svg?branch=master)](https://travis-ci.org/wlandau/eply)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/wlandau/eply?branch=master&svg=true)](https://ci.appveyor.com/project/wlandau/eply)
[![codecov.io](https://codecov.io/github/wlandau/eply/coverage.svg?branch=master)](https://codecov.io/github/wlandau/eply?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/eply)](http://cran.r-project.org/package=eply)

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

If you specify a tag, you can install a GitHub release.

```r
devtools::install_github("wlandau/eply@v0.2.1", build = TRUE)
```

If all else fails, download the source, unzip it, and install it locally.

```r
devtools::install_local("eply", build = TRUE)
```


# Tutorial

The [online package vignette](http://will-landau.com/eply/articles/eply.html) has a complete tutorial. You can the load the compiled version from an R session.

```r
vignette("eply")
```


# Help and troubleshooting

Use the `help_eply()` function to obtain a collection of helpful links. For troubleshooting, please refer to [TROUBLESHOOTING.md](https://github.com/wlandau/eply/blob/master/TROUBLESHOOTING.md) on the [GitHub page](https://github.com/wlandau/eply) for instructions.
