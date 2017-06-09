class Prime
  def self.is_prime?(num)
    return false if num < 2

    (2...num).each do |div|
      return false if num % div == 0
    end

    true
  end

  def self.generate_n_primes(n = 0)
    if n < 0 || (!n.is_a? Integer)
      return nil
    end

    primes, num = [], 2

    until primes.count == n
      primes << num if Prime.is_prime?(num)
      num += 1
    end

    primes
  end
end
