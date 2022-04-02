# frozen_string_literal: true

class Purchase
  attr_reader :amount

  def initialize
    @purchase = {}
    @amount = {}
  end

  def user_input
    loop do
      puts "Enter product name: (Eenter 'stop' if you want to end the shopping)"
      product_name = gets.chomp.to_s

      break if product_name == 'stop'

      puts "Enter product price"
      product_price = gets.chomp.to_f
      puts "Enter product quantity"
      product_quantity = gets.chomp.to_i

      @purchase[product_name] = { product_price: product_price, product_quantity: product_quantity }
    end
  end

  def item_amount
    @purchase.each { |key, value| @amount[key] = value[:product_price] * value[:product_quantity] }
  end
end

person = Purchase.new

person.user_input
person.item_amount
person.amount.each { |key, value| puts "#{key} total amount is #{value}" }
puts "total amount of all product is #{person.amount.values.sum}"
