require 'date'
require 'ostruct'

class OrdersReport
  def initialize(orders, start_date, end_date)
    @orders = orders
    @start_date = start_date
    @end_date = end_date
  end

  def total_sales_within_date_range
    @orders.reduce(0) do |sum, order|
      if order.placed_at >= @start_date && order.placed_at <= @end_date
        sum += order.amount
      end
      sum
    end
  end
end

class Order < OpenStruct
end
