require_relative "../lib/prime.rb"

describe Prime do
  it "returns X number of specified prime numbers" do
    expect(Prime.generate_n_primes).to eq([])
    expect(Prime.generate_n_primes(3)).to eq([2, 3, 5])
    expect(Prime.generate_n_primes(-10)).to be_nil
  end

  it "checks whether given number is prime" do
    expect(Prime.is_prime?(1)).to  eq false
    expect(Prime.is_prime?(2)).to  eq true
    expect(Prime.is_prime?(13)).to eq true
    expect(Prime.is_prime?(-1)).to eq false
  end
end
