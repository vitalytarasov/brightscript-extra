' type conversion

' converts given value to JSON string
function convertToJson(value as dynamic) as string

    ' handle special cases
    kind = Type(value, 3)
    if kind = "Invalid" or kind = "<uninitialized>" then return ""

    ' clone and normalize value
    if kind = "roAssociativeArray"
        temp = _convertToJsonMap(value, 1)
    else
        temp = value
    end if

    ' let OS handle the final conversion
    return FormatJSON(temp)

end function

' clones roAssociativeArray, converts its unsupported values to strings, copies all others and returns it
function _convertToJsonMap(value as object, level as integer) as object

    ' prevent runaway recursion
    if level > 16
        print "WARNING: max recursion reached"
        return invalid
    end if

    ' roAssociativeArray is passed by reference, therefore in order to prevent changing the original
    ' we must to copy/convert all values into a clone
    res = {}
    for each key in value
        val = value[key]
        kind = Type(val, 3)
        if kind = "roAssociativeArray"
            res[key] = _convertToJsonMap(val, level + 1)
        else if kind = "roDateTime"
            res[key] = convertToString(val)
        else if kind = "roSGNode"
            print Substitute("WARNING: cannot convert type {0} to JSON", kind)
        else
            res[key] = val
        end if
    end for

    ' return the clone
    return res

end function

' converts given value to string
function convertToString(value as dynamic) as string

    ' handle special cases
    kind = Type(value, 3)
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
    if kind = "roDateTime" then return value.ToISOString()

    ' unhandled types
    print Substitute("WARNING: cannot convert type {0} to string", kind)
    return ""

end function
