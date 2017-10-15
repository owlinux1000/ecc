require 'gmp'

module Ecc
  
  # Class for Point on Elliptic Curve
  # 
  # @since 0.1.0
  
  class Point
    
    attr_accessor :x, :y, :curve
    
    def initialize(curve, x, y)

      if curve.class != Curve or x.class != Integer or y.class != Integer
        raise TypeError
      end
      
      @curve = curve
      @x = GMP::Z.new(x)
      @y = GMP::Z.new(y)
      
    end

    def to_s
      
      return "O" if self.zero?
      "(#{@x}, #{@y})"
      
    end

    def zero?
      
      @x == -1 and @y == -1
        
    end
    
    def ==(other)
      
      @x == other.x and @y == other.y
      
    end

    def !=(other)
      
      not self == other
      
    end
    
    def +(other)

      raise "different elliptic curve" if self.curve != other.curve
      
      u = self
      v = other
      
      return u if v.zero?
      return v if u.zero?

      if u.x == v.x and u.y == -1 * v.y
        return Point.new(@curve, -1, -1)
      end
      
      t = 0
      
      if u != v
        t = (v.y - u.y) * (v.x - u.x).powmod(@curve.fp - 2, @curve.fp)
      else
        t = (3 * u.x ** 2 + @curve.a) * (2 * u.y).powmod(@curve.fp - 2, @curve.fp)
      end
      
      x3 = (t ** 2 - u.x - v.x) % @curve.fp
      y3 = (t * (u.x - x3) - u.y) % @curve.fp
      
      Point.new(@curve, x3.to_i, y3.to_i)

    end

    def -(other)

      raise "different elliptic curve" if self.curve != other.curve
      
      self + Point.new(self.curve, other.x.to_i, (-1 * other.y).to_i)
      
    end

    def *(d)
      
      sum = self
      d = d.to_s(2)[1..-1]
      d.chars.each do |di|
        sum = sum + sum
        sum = sum + self if di == "1"
      end
      
      sum
      
    end
    
  end
  
end
