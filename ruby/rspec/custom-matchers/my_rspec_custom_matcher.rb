
module MyRspecCustomMatcher

  class CheckAttributes
    attr_accessor :object, :expected_val, :actual_val, :attribute
    def initialize(expected)  
      @expected = expected  
    end  
    
    def matches?(actual)  
      self.object = actual
      # actual is object
      @expected.all? do |key, val|
        self.actual_val = object.send(key)
        self.expected_val = val
        self.attribute = key

        actual_val == expected_val
      end
    end
    
    def failure_message_for_should  
      "object of class #{object.class} should have '#{expected_val}' as #{attribute}, but has '#{actual_val}'"
    end  
  end  

  def have_these_attributes(expected)  
    CheckAttributes.new(expected)
  end

end

