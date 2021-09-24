' converts any primitive to string
function extraString(value as dynamic) as string

    ' convert by type
    kind = type(value)
    if kind = "invalid" return "invalid"
    if kind = "roString" return value

    ' unhadled type
    print "cannot handle type " + kind
    return ""

endfunction
