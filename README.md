# Ecc

## Install

```
gem install ecc
```

## Usage


```
ecc = Ecc::Curve.new(a = 3, b = 4, fp = 7)
a = Ecc::Point.new(ecc, 0, 2)
b = Ecc::Point.new(ecc, 0, 2)
puts a + b
c = a * 2
puts c
puts ecc.point_order(0, 2)
puts ecc.rational_points
puts ecc.group_order
```
