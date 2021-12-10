' constructor
function init() as void
    m.top.setFocus(true)
    m.top.findNode("Title").font.size = 92
end function

' executes all tests
function runTests() as void
    testConvertToString()
    testConvertToJson()
end function

' execute tests for convertToString function
function testConvertToString()

    print "running convertToString tests"

    ' test special cases
    _assetEqual(convertToString(m.something), "invalid")
    _assetEqual(convertToString(something), "uninitialized")

    ' test boolean
    _assetEqual(convertToString(true), "true")
    _assetEqual(convertToString(false), "false")

    ' double
    _assetEqual(convertToString(0.0001D0), "0.0001")
    _assetEqual(convertToString(-0.0007D0), "-0.0007")

    ' date time
    value = CreateObject("roDateTime")
    value.FromSeconds(1697763723)
    _assetEqual(convertToString(value), "2023-10-20T01:02:03Z")

    ' float
    _assetEqual(convertToString(6.25!), "6.25")
    _assetEqual(convertToString(-10.03!), "-10.03")

    ' integer
    _assetEqual(convertToString(214748364), "214748364")
    _assetEqual(convertToString(-214748364), "-214748364")

    ' long integer
    _assetEqual(convertToString(9223372036854775807&), "9223372036854775807")
    _assetEqual(convertToString(-9223372036854775808&), "-9223372036854775808")

    ' string
    _assetEqual(convertToString("banana"), "banana")

    ' unhandled
    _assetEqual(convertToString(CreateObject("roUrlTransfer")), "")
    _assetEqual(convertToString(m.top), "")

    print "convertToString tests passed"

end function

' execute tests for convertToJson function
function testConvertToJson()

    print "running convertToJson tests"

    ' test special cases
    _assetEqual(convertToJson(m.something), "") ' invalid
    _assetEqual(convertToJson(something), "") ' uninitialized

    ' test boolean
    _assetEqual(convertToJson(true), "true")
    _assetEqual(convertToJson(false), "false")

    ' test map with singular types
    map = {
        apple: "apple",
        twenty: 20,
        pi: 3.1415926535898,
    }
    _assetEqual(convertToJson(map), "{""apple"":""apple"",""pi"":3.14159,""twenty"":20}")

    ' test roSGNode type
    map.node = CreateObject("roSGNode", "Poster")
    _assetEqual(convertToJson(map), "{""apple"":""apple"",""pi"":3.14159,""twenty"":20}")

    ' test map with composite types
    epoch = CreateObject("roDateTime")
    epoch.FromSeconds(946782245)
    map.when = epoch
    _assetEqual(convertToJson(map), "{""apple"":""apple"",""pi"":3.14159,""twenty"":20,""when"":""2000-01-02T03:04:05Z""}")

    ' test four dimensional map with composite types
    two = {
        one: map,
        two: {
            first: map,
            second: {
                uno: map,
                dos: {
                    num: 6,
                    str: "banana",
                    flt: 2.6
                },
            },
        },
    }
    _assetEqual(convertToJson(two), "{""one"":{""apple"":""apple"",""pi"":3.14159,""twenty"":20,""when"":""2000-01-02T03:04:05Z""},""two"":{""first"":{""apple"":""apple"",""pi"":3.14159,""twenty"":20,""when"":""2000-01-02T03:04:05Z""},""second"":{""dos"":{""flt"":2.6,""num"":6,""str"":""banana""},""uno"":{""apple"":""apple"",""pi"":3.14159,""twenty"":20,""when"":""2000-01-02T03:04:05Z""}}}}")

    ' unhandled
    _assetEqual(convertToJson(CreateObject("roUrlTransfer")), "")

    print "convertToJson tests passed"

end function

' prints error message if two values are not the same
function _assetEqual(val1 as object, val2 as object) as void
    if Type(val1, 3) <> Type(val2, 3)
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