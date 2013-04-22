class Mycode < ActiveRecord::Base
attr_accessor :bytesize
attr_accessor :mymbsize

def mymbsize
(self.bytesize.to_i)/(1 << 20)
end



end