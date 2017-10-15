require 'ecc'

# SECCON2013 Quals Cryptanalysis (crypto 300pts)
# Following parameters were given.
A = 1234577
B = 3213242
M = 7654319
curve = Ecc::Curve.new(A, B, M)
base = Ecc::Point.new(curve, 5234568, 2287747)
pubic_key = Ecc::Point.new(curve, 2366653, 1424308)
crypted_data =  [
  Ecc::Point.new(curve, 5081741, 6744615),
  Ecc::Point.new(curve, 610619, 6218)
]

secret_key = 0
x = Ecc::Point.new(curve, -1, -1)

M.times do |i|
  puts i
  if x == pubic_key
    secret_key = i #=> 1584718
    break
  end
  x = x + base
end

tmp = crypted_data[0] * secret_key
plain = crypted_data[1] - tmp
puts plain
puts plain.x + plain.y # Challenge answer is plain.x + plain.y

