class String
  def is_numeric?
    true if Float(self) rescue false
  end

  # PHP's two argument version of strtr
  def strtr(replace_pairs)
    keys = replace_pairs.map {|a, b| a }
    values = replace_pairs.map {|a, b| b }
    self.gsub(
      /(#{keys.map{|a| Regexp.quote(a) }.join( ')|(' )})/
      ) { |match| values[keys.index(match)] }
  end
end