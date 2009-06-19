#-------------------------------------------------------------------------------
# Copyright (c) 2008 Topher Fangio
# 
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#-------------------------------------------------------------------------------


module LCDProc
  
  class Response
    attr_reader :message
    
    def initialize( message )
      @message = message
    end
    
    def successful?
      passed = true
      
      if @message.kind_of? String
        messages = [@message]
      else
        messages = @message
      end
      
      messages.each do |m|
        if m =~ /^huh/
          passed = false
          break
        end
      end
      
      return passed
    end
    
    def message
      if @message.kind_of? Array
        return @message.join
      else
        return @message
      end
    end
    
  end
  
end
