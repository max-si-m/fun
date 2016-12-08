require_relative '15_order_report'

RSpec.describe OrdersReport do
  describe '#total_sales_within_date_range' do
    it 'returns total sales in range' do
      order_within_range = Order.new(amount: 5, placed_at: Date.new(2012, 1, 28))
      order_out_of_range = Order.new(amount: 6, placed_at: Date.new(2012, 1, 1))
      orders = [order_within_range, order_out_of_range]

      start_date = Date.new(2012, 1, 15)
      end_date = Date.new(2012, 1, 30)

      result = OrdersReport.new(orders, start_date, end_date).total_sales_within_date_range
      expect( result ).to eq 5
    end
  end
end
