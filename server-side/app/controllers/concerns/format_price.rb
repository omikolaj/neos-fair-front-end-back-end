module FormatPrice  

  def format(price)
    "$%.2f" % price.truncate(2)
  end

end