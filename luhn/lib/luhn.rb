# Luhn algorithm https://en.wikipedia.org/wiki/Luhn_algorithm
# "The Luhn algorithm or Luhn formula, also known as the "modulus 10" or "mod 10" algorithm, is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers, IMEI numbers, National Provider Identifier numbers in the US, and Canadian Social Insurance Numbers. It was created by IBM scientist Hans Peter Luhn and described in U.S. Patent No. 2,950,048, filed on January 6, 1954, and granted on August 23, 1960."

module Luhn
  def self.is_valid?(number)
    number = number.to_s.chars.map(&:to_i).reverse
    number.map!.with_index do |num, i|
      if i.odd?
        num *= 2
        num -= 9 if num >= 10
      end
      num
    end

    return true ? number.reduce(:+) % 10 == 0 : false
  end
end
