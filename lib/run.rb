require_relative "primes_multiplication_table"

specified_size = ARGV[0]

if specified_size
  primes_table = PrimesMultiplicationTable.new(specified_size.to_i)
else
  primes_table = PrimesMultiplicationTable.new()
end

primes_table.render
