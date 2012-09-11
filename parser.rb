class Parser
  attr_accessor :raw_data
  
  def initialize(data)
    self.raw_data = data
    parse
  end
  
end
