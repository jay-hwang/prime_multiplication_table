class Prime
  def self.is_prime?(num)
    # Base case: smallest prime number is 2, so any number < 2 is not prime.
    return false if num < 2

    (2...num).each do |div|
      return false if num % div == 0
    end

    true
  end

  def self.generate_n_primes(n = 0)
    # Base case: can only generate_n_primes if n is an Integer >= 0
    return nil if n < 0 || (!n.is_a? Integer)

    primes, num = [], 2

    until primes.count == n
      primes << num if Prime.is_prime?(num)
      num += 1
    end

    primes
  end
end
