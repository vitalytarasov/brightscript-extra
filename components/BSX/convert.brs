' type conversion

' converts given value to string
function convertToString(value as dynamic) as string

    ' handle special cases
    kind = type(value, 3)
    if kind = "Invalid" then return "invalid"
    if kind = "<uninitialized>" then return "uninitialized"

    ' handle types with built in conversion
    if kind = "Boolean" or kind = "roBoolean" then return value.ToStr()
    if kind = "Float" or kind = "roFloat" then return value.ToStr()
    if kind = "Double" or kind = "roDouble" then return value.ToStr()
    if kind = "Integer" or kind = "roInt" or kind = "roInteger" then return value.ToStr()
    if kind = "LongInteger" or kind = "roLongInteger" then return value.ToStr()
    if kind = "String" or kind = "roString" then return value

    ' handle supported complex types
    if kind = "roDateTime" then return value.toISOString()

    ' unhandled types
    print substitute("WARNING: cannot convert type {0} to string", kind)
    return ""

end function
