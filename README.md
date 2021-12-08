# BrightScript Extra library, a.k.a. BSX
a collection of utility functions for Roku client development

## convert
data type conversion
### function convertToString(value as dynamic) as string
converts singular data types (e.g. Integer, Float, DateTime) to a string  
prints a warning and returns an empty string if type is not singular
#### examples
```brightscript
' convert a boolean to string
value = 1 > 2
print convertToString(value) ' prints "false"

' convert a float to string
calc = 43 * 1.1
print convertToString(calc) ' prints "47.3"

' convert DateTime to ISO 8601 string
now = CreateObject("roDateTime")
print convertToString(now) ' prints "2021-02-03T04:05:06Z"
```

## usage
- copy the `BSX` directory into your project `components`
- add a file with the desired functions to your node:
```brightscript
<?xml version="1.0" encoding="utf-8" ?>
<component name="MyScene" extends="Scene">
    <script type="text/brightscript" uri="pkg:/components/BSX/convert.brs"/>
    ...
</component>
```
 