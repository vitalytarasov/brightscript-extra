' constructor
function init() as void
    m.top.setFocus(true)
    m.top.findNode("Title").font.size = 92
end function

' executes all tests
function runTests() as void
    runConvertTests()
end function

' execute tests for convert functions
function runConvertTests()
    print "running convert tests"

    ' test special cases
    assetEqual(convertToString(m.something), "invalid")
    assetEqual(convertToString(something), "uninitialized")

    ' test boolean
    assetEqual(convertToString(true), "true")
    assetEqual(convertToString(false), "false")

    ' double
    assetEqual(convertToString(0.0001D0), "0.0001")
    assetEqual(convertToString(-0.0007D0), "-0.0007")

    ' date time
    value = CreateObject("roDateTime")
    value.FromSeconds(1697763723)
    assetEqual(convertToString(value), "2023-10-20T01:02:03Z")

    ' float
    assetEqual(convertToString(6.25!), "6.25")
    assetEqual(convertToString(-10.03!), "-10.03")

    ' integer
    assetEqual(convertToString(214748364), "214748364")
    assetEqual(convertToString(-214748364), "-214748364")

    ' long integer
    assetEqual(convertToString(9223372036854775807&), "9223372036854775807")
    assetEqual(convertToString(-9223372036854775808&), "-9223372036854775808")

    ' string
    assetEqual(convertToString("banana"), "banana")

    ' unhandled
    assetEqual(convertToString(CreateObject("roUrlTransfer")), "")

    print "convert tests passed"
end function

' prints error message if two values are not the same
function assetEqual(val1 as object, val2 as object) as void
    if type(val1, 3) <> type(val2, 3)
        print "type mismatch (val1, val2):"
        print val1
        print val2
        stop
    end if
    if val1 <> val2
        print "value mismatch (val1, val2):"
        print val1
        print val2
        stop
    end if
end function