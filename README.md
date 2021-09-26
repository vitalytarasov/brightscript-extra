# brightscript-extra, a.k.a. BSX library
## string functions
### BsxToString(value) string
converts simple types to strings
#### examples
```brightscript
' convert boolean, prints "result is false"
val = 1 > 2
print "result is " + BsxToString(val)
```
```brightscript
' convert interger, prints "count is 43"
count = 43
print "count is " + BsxToString(count)
```

```brightscript
' convert date time to ISO 8601, prints "now is 2023-10-20T01:02:03Z"
now = CreateObject("roDateTime")
print "now is " + BsxToString(now)
```
