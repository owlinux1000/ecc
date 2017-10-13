module Ecc
  
  class Point
    
    attr_accessor :x, :y, :curve
    
    def initialize(curve, x, y)

      if curve.class != Curve
        raise "1st argument type error: "
      end
      
      @curve = curve
      @x = x
      @y = y
      
    end

    def to_s
        
      "(#{@x}, #{@y})"
      
    end

    def zero?
      
      @x == 0 and @y == 0
        
    end
    
    def ==(other)
      
      @x == other.x and @y == other.y
      
    end

    def !=(other)
      
      not self == other
      
    end
    
    def +(other)

      u = self
      v = other
      
      return u if v.zero?
      return v if u.zero?
      
      t = 0
      
      if u != v
        t = ((v.y - u.y) * (((v.x - u.x) ** (@curve.fp - 2)) % @curve.fp)) % @curve.fp
      else
        t = ((3 * u.x ** 2 + @curve.a) * (((2 * u.y) ** (@curve.fp - 2)) % @curve.fp)) % @curve.fp
      end
       
      x3 = t ** 2 - u.x - v.x
      y3 = t * (u.x - x3) - u.y
      
      Point.new(@curve, x3 % @curve.fp, y3 % @curve.fp)

    end

    def *(d)
        
      sum = self
      
      (d - 1).times do
        sum = sum + self
      end
      
      sum
      
    end
    
  end

end
