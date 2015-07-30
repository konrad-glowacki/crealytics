class Float
  def to_german_s
    self.to_s.gsub('.', ',')
  end
end
