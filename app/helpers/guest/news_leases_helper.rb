module Guest::NewsLeasesHelper
  def format_price(price_type)
    if price_type == 0
      t "day"
    elsif price_type == 1
      t ".week"
    else
      t ".month"
    end
  end
end
