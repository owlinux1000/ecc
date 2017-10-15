module Ecc
  
  # Baby-step Giant-step method. Calculate d of Q = dP
  # 
  # @param [Curve] curve
  # @param [Point] p
  # @param [Point] q
  # @raise [TypeError, RuntimeError]
  # @return [Integer] d

  def self.bsgs(curve, p, q)

    if curve.class != Curve or p.class != Point or q.class != Point
      raise TypeError
    end
    
    m = Math.sqrt(curve.point_order(p)).to_i
    
    baby = []
    b = q
    
    m.times do
      baby << b
      b -= p
    end

    giant = p * m
    
    1.step(m).each do |i|
      return i*m + baby.index(giant) if baby.include?(giant)
      giant += (p * m)
    end
    
    raise "Not found d of Q = dP"
    
  end
  
end
