With `eply`, you can apply a function over a data frame of expressions. Try out this example. 

```r
> .expr = example.expr()
> .expr
                                 x y rep
1 subset(mtcars, cyl == 4, mpg, T) 1   A
2  subset(mtcars, cyl == 4, wt, T) 1   A
3 subset(mtcars, cyl == 4, mpg, T) 2   A
4  subset(mtcars, cyl == 4, wt, T) 2   A
5 subset(mtcars, cyl == 4, mpg, T) 1   B
6  subset(mtcars, cyl == 4, wt, T) 1   B
7 subset(mtcars, cyl == 4, mpg, T) 2   B
8  subset(mtcars, cyl == 4, wt, T) 2   B
> example.fun
function (x, y)
{
    mean(x/y)
}
<environment: namespace:eply>
> eply(example.fun, .expr)
        1         2         3         4         5         6         7         8
26.663636  2.285727 13.331818  1.142864 26.663636  2.285727 13.331818  1.142864
```
