

module Bowling

  class OutputSpy
  
    attr_reader :messages
  
    def initialize()
      @messages = []
    end
    
    def puts(string)
      @messages << string
    end
    
  end
end