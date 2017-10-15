module Ecc

  # Baby-step Giant-step method
  def self.bsgs(curve, p, q)
    
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
    
    puts "Not found d"
    
    nil
    
  end
  
end
