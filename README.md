# BrightScript Extra library, a.k.a. BSX
a collection of utility functions for Roku client development

## convert
data type conversions
### function convertToJson(value as dynamic) as string
converts given value to a JSON string using `convertToString` function rules;  
unsupported types (e.g. `roSGNode`) will be effectively skipped 
####examples
```brightscript
' convert an associative array to JSON, skipping SceneGraph node
map = {
    fruit: "mango",
    quantity: 3,
    poster: CreateObject("roSGNode", "Poster"),
    when: CreateObject("roDateTime")
}
print convertToJson(map) ' outputs string "{"fruit":"mango","quantity":3,"when":"2021-02-03T04:05:06Z"}" 
```

### function convertToString(value as dynamic) as string
converts singular data types (e.g. Integer, Float, DateTime) to a string:  
- date/time is converted to ISO 8601;  
- prints a warning and returns an empty string if type is composite (e.g. `roAssociativeArray`, `roSGNode`, etc.)
#### examples
```brightscript
' convert a boolean to string
value = 1 > 2
print convertToString(value) ' outputs "false"

' convert a float to string
calc = 43 * 1.1
print convertToString(calc) ' outputs "47.3"

' convert DateTime to ISO 8601 string
now = CreateObject("roDateTime")
print convertToString(now) ' outputs "2021-02-03T04:05:06Z"
```

## usage
- copy the `BSX` directory into your project's `source`
- add an import file with the desired functions to your node:
```xml
<?xml version="1.0" encoding="utf-8" ?>
<component name="MyScene" extends="Scene">
    <script type="text/brightscript" uri="pkg:/source/BSX/convert.brs"/>
    ...
</component>
```
- call functions as given in the examples above 