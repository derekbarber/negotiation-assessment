class String
  # colourization
  def colourize(colour_code)
    "\e[#{colour_code}m#{self}\e[0m"
  end

  def red
    colourize(31)
  end

  def green
    colourize(32)
  end

  def yellow
    colourize(33)
  end

  def pink
    colourize(35)
  end
end
