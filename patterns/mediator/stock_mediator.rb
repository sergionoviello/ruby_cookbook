require_relative 'stock_offer'

class StockMediator
  attr_accessor :colleagues, :colleague_codes, :stock_buy, :stock_sale

  def initialize
    @colleague_codes = 0
    @colleagues = []
    @stock_buy = []
    @stock_sale = []
  end

  def add_colleague(colleague)
    @colleagues << colleague
    @colleague_codes += 1
    colleague.code = @colleague_codes
  end

  def offer(stock, shares, code, type)
    stock_offers = type == :buy ? @stock_buy : @stock_sale
    
    stock_offers.each do |offer|
      puts "#{shares} #{stock} #{code}"
    end

    if type == :buy
      @stock_buy << StockOffer.new(shares, stock, code)
    else
      @stock_sale << StockOffer.new(shares, stock, code)
    end
  end
end
