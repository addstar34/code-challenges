# Generate the fibonacci sequence returning the nth digit
# Create this using recursive and iterative methods
# Benchmark the 2 methods to see which performs better

def recursive_fib(n, a=0, b=1)
  if n == 0
    return a
  else
    recursive_fib(n - 1, b, a + b)
  end
end

def iterative_fib(n)
  a = 0
  b = 1

  n.times do
    temp = b
    b = a + b
    a = temp
  end

  return a
end


require 'benchmark'
num = 110
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib") { iterative_fib(num) }
end
