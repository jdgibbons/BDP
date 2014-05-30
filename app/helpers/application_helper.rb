module ApplicationHelper
  def date_mdY(date)
    if date.nil?
      ""
    else
      date.strftime("%m/%d/%Y")
    end
  end

  def generate_order_number_with_links(order)
    ord = link_to( order.quote_number, order )

    if not order.work_order.nil?
      ord += "-"
      ord += link_to( order.work_order.id, order.work_order)
    end
    ord
  end
end
