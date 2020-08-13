module ApplicationHelper
  def get_carts_total(carts)
    sum_total = 0
    @carts.each do |cart|
      sum_total += cart.total
    end
    sum_total
  end
end
