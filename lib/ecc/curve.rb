module Ecc

  # Class for Elliptic Curve
  #
  # @since 0.1.0
  
  class Curve
      
    attr_accessor :a, :b, :fp
    
    def initialize(a, b, fp)
      
      @a = a
      @b = b
      @fp = fp
      
      raise "not elliptic curve" if 4 * (@a ** 3) + 27 * (@b ** 2) == 0
      
    end

    # Returns true if point on elliptic curve
    # 
    # @param [Ecc::Point] p
    # @return [true, false]
    
    def belong?(p)
      
      return false unless 0 <= p.x and p.x < @fp
      return false unless 0 <= p.y and p.y < @fp
      
      (p.y ** 2) % @fp == (p.x ** 3 + @a * p.x + @b) % @fp
      
    end

    # Returns rational point on elliptic curve.
    # 
    # @return [Array<Ecc::Point>]
    
    def rational_points
      
      result = []
      
      a = (0...@fp).to_a
      
      a.product(a).each do |x,y|
        point = Ecc::Point.new(self, x, y)
        result << point if belong?(point)
      end
      
      result
      
    end

    # Returns the order of an elliptic curve group
    # 
    # @return [Integer]
    
    def order
      rational_points.length + 1
    end

    # Returns the order of point p
    #
    # @param [Ecc::Point]
    # @return [Integer]
    
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
