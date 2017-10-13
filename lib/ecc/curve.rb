module Ecc
  
  class Curve
      
    attr_accessor :a, :b, :fp
    
    def initialize(a, b, fp)
      
      @a = a
      @b = b
      @fp = fp
      
      raise "not elliptic curve" if 4 * (@a ** 3) + 27 * (@b ** 2) == 0
      
    end

    def belong?(x,y)
      
      return (y ** 2) % @fp == (x ** 3 + @a * x + @b) % @fp
      
    end
    
    def point_order(x, y)
      
      p2 = Point.new(self, x, y)
      
      i = 2
      loop do
        break if p * i == p2
        i += 1
      end
      i
    end

    def ==(other)
      self.a == other.a and self.b == other.b and self.fp == other.fp
    end
    
  end
  
end
