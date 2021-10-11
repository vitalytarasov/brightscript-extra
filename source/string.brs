' provides a consistent invterface for converting primitives to string
' logs warning and returns empty string on error
function BsxToString(value as dynamic) as string

    ' handle special cases
    kind = Type(value)
    if kind = "Invalid" then return "invalid"
    if kind = "<uninitialized>" then return "uninitialized"

    ' handle simple types
    if kind = "Boolean" or kind = "roBoolean" then return value.ToStr()
    if kind = "Float" or kind = "roFloat" then return value.ToStr()
    if kind = "Double" or kind = "roDouble" then return value.ToStr()
    if kind = "Integer" or kind = "roInt" or kind = "roInteger" then return value.ToStr()
    if kind = "LongInteger" or kind = "roLongInteger" then return value.ToStr()
    if kind = "String" or kind = "roString" then return value

    ' handle complex types
    if kind = "roDateTime" then return value.ToISOString()

    ' unhadled type
    print "WARNING: cannot handle type " + kind
    return ""

endfunction