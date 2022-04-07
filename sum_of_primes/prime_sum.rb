# frozen_string_literal: true

require "prime"

class PrimeFinder
  def initialize(*arr)
    @arr = arr
  end

  def call
    check_valid_input
    find_prime_numbers
  rescue ArgumentError => e
    warn e
  end

  private

  def find_prime_numbers
    @arr.select(&:prime?).sum
  end

  def check_valid_input
    unless @arr.all? do |num|
      num.is_a?(Integer)
    end
      raise ArgumentError, "input shoud be numbers"
    end
  end
end

puts PrimeFinder.new(1, 2, 3, 4, 5, 6, 7, 8, 9).call
