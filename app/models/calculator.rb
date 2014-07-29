#Models calculator
class Calculator < ActiveRecord::Base
belongs_to :user
  def +(input)
    self.state += input
    self.save
  end

  def -(input)
    self.state -= input
    self.save
  end
  def *(input)
    self.state *= input
    self.save
  end
  def /(input)
    self.state /= input
    self.save
  end
  def abs
    self.state = self.state.abs
    self.save
  end
  def neg
    self.state = self.state*-1
    self.save
  end
  def sqrt
    begin
      self.state = Math.sqrt self.state
        self.save
    rescue
      puts "Returns Complex number"
    end

  end
  def sqr
    self.state = self.state**2
    self.save
  end
  def cube
    self.state = self.state**3
    self.save
  end
  def cubert
    self.state = Math.cbrt self.state
    self.save
  end
  def cancel
    self.state = 0
    self.save
  end
end

