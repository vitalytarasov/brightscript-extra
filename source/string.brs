' provides a consistent invterface for converting primitives to string
' logs warning and returns empty string on error
function BsxToString(value as dynamic) as string

    ' convert by type
    kind = Type(value)
    if kind = "Boolean" or kind = "roBoolean" then return value.ToStr()
    if kind = "Float" or kind = "roFloat" then return value.ToStr()
    if kind = "roDateTime" then return value.ToISOString()
    if kind = "Double" or kind = "roDouble" then return value.ToStr()
    if kind = "Integer" or kind = "roInteger" then return value.ToStr()
    if kind = "LongInteger" or kind = "roLongInteger" then return value.ToStr()
    if kind = "String" or kind = "roString" then return value

    ' unhadled type: invalid and uninitialized fall here
    print "WARNING: cannot handle type " + kind
    return ""

endfunction