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
      
      return false unless 0 <= x and x < @fp
      return false unless 0 <= y and y < @fp
      
      (y ** 2) % @fp == (x ** 3 + @a * x + @b) % @fp
      
    end

    def rational_points
      result = []
      a = (0...@fp).to_a
      a.product(a).each do |x,y|
        result << Ecc::Point.new(self, x, y) if belong?(x,y)
      end
      result
    end

    def group_order
      rational_points.length + 1
    end
    
    def point_order(p)
      
      i = 2
      loop do
        break if p * i == p
        i += 1
      end
      i
      
    end

    def ==(other)
      
      self.a == other.a and self.b == other.b and self.fp == other.fp
      
    end

    def !=(other)
      
      not self == other
      
    end
    
  end
  
end
