# Guide for lintr compliance

Here one can find some examples of lintr warning messages, 
illustrated with examples to help enhancing one's code to pass the checks. 

Structure:
> `lintr message`
> e.g.:
> example that generate the error message
> lintr-compliant solution

or

> `lintr message`
> comment to help solve the issue


## List of examples

> `Avoid 1:length(...) expressions, use seq_len.`
> e.g.: 
> the following: my_object <- 1:length(A)
> should be:     my_object <- seq_len(length(A))

> `Avoid 1:nrow(...) expressions, use seq_len.`
> e.g.: 
> the following: my_object <- 1:nrow(A)
> should be:     my_object <- seq_len(nrow(A))

> `Commas should always have a space after.`
> e.g.: 
> the following: my_object <- c("toto","titi")
> should be:     my_object <- c("toto", "titi")

> `Commented code should be removed.`
> if you really NEED it to appear for understanding purpose, comment it in a documented sentence

> `Do not place spaces around code in parentheses or square brackets.`
> e.g.: 
> the following: my_object <- c( A[ 1, 2], B[ 3, 4 ] )
> should be:     my_object <- c(A[1, 2], B[3, 4])

> `Only use double-quotes.`
> e.g.: 
> the following: my_object <- c('toto', 'titi')
> should be:     my_object <- c("toto", "titi")

> `Place a space before left parenthesis, except in a function call.`
> e.g.: 
> the following: if(toto) {titi}
> should be:     if (toto) {titi}

> `Put spaces around all infix operators.`
> e.g.: 
> the following: list_arguments<-parseCommandArgs(evaluate=FALSE)
> should be:     list_arguments <- parseCommandArgs(evaluate = FALSE)

> `Remove spaces before the left parenthesis in a function call.`
> e.g.: 
> the following: my_fct <- function (toto, titi) {...}
> should be:     my_fct <- function(toto, titi) {...}

> `There should be a space between right parenthesis and an opening curly brace.`
> e.g.: 
> the following: if (toto){titi}
> should be:     if (toto) {titi}

> `Trailing whitespace is superfluous.`
> i.e. no whitespaces at the end of lines

> `Use <-, not =, for assignment.`
> e.g.: 
> the following: list_arguments = parseCommandArgs(evaluate = FALSE)
> should be:     list_arguments <- parseCommandArgs(evaluate = FALSE)

> `Variable and function name style should be snake_case.`
> e.g.: 
> the following: myNewObject <- "toto"
> should be:     my_new_object <- "toto"
