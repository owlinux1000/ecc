module Ecc
  class Point
    
    attr_accessor :x, :y
    
    def initialize(curve, x, y)

      if curve.class != Curve
        raise "1st argument type error"
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

    def +(other)
      
      u = Point.new(@ecc, self) if u.class != Point
      v = Point.new(@ecc, other) if v.class != Point
       
      return u if v.zero?
      return v if u.zero?
      
      lambda = nil
        
      if u != v
        lambda = ((v.y - u.y) * (((v.x - u.x) ** (@fp - 2)) % @fp)) % @fp
      else
        lambda = ((3 * u.x ** 2 + @a) * (((2 * u.y) ** (@fp - 2)) % @fp)) % @fp
      end
       
      x3 = lambda ** 2 - u.x - v.x
      y3 = lambda * (u.x - x3) - u.y
      Point.new(@ecc, [x3 % @fp, y3 % @fp])

    end

    def *(d)
        
      sum = Point.new(@ecc, self)
      
      (d - 1).times do
        sum = sum + self
      end
      
      sum
      
    end
    
  end

end
