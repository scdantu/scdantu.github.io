args <- commandArgs(trailingOnly = TRUE)
a <- as.integer(args[1]) # guess why I had to use coercion
b <- as.integer(args[2])
print(a)
print(b)
print(a+b)
