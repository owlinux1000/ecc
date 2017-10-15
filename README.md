# Ecc

## Install

```
gem install ecc
```

## Usage


```
curve = Ecc::Curve.new(a = 3, b = 4, fp = 7)
a = Ecc::Point.new(curve, 0, 2)
b = Ecc::Point.new(curve 0, 2)
c = a + b
d = c * 2
puts curve.point_order(Ecc::Point.new(curve, 0, 2))
puts curve.rational_points
puts curve.order
```
