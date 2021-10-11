function TestBsxToString() as boolean

    ' boolean
    if not _TestBsxToString(true, "true") then return false
    if not _TestBsxToString(false, "false") then return false

    ' double
    if not _TestBsxToString(0.0001D0, "0.0001") then return false
    if not _TestBsxToString(-0.0007D0, "-0.0007") then return false

    ' date time
    value = CreateObject("roDateTime")
    value.FromSeconds(1697763723)
    if not _TestBsxToString(value, "2023-10-20T01:02:03Z") then return false

    ' float
    if not _TestBsxToString(6.25, "6.25") then return false
    if not _TestBsxToString(-10.03, "-10.03") then return false

    ' integer
    if not _TestBsxToString(214748364, "214748364") then return false
    if not _TestBsxToString(-214748364, "-214748364") then return false

    ' invalid, uninitialized
    if not _TestBsxToString(invalid, "invalid") then return false
    if not _TestBsxToString(missing, "uninitialized") then return false

    ' long integer
    if not _TestBsxToString(9223372036854775807&, "9223372036854775807") then return false
    if not _TestBsxToString(-9223372036854775808&, "-9223372036854775808") then return false

    ' node (unhandled)
    if not _TestBsxToString(CreateObject("roUrlTransfer"), "") then return false

    ' string
    if not _TestBsxToString("banana", "banana") then return false

    ' success
    return true

end function

' tests single value
function _TestBsxToString(value as dynamic, expect as string) as boolean
    result = BsxToString(value)
    if result <> expect then
        print Substitute("FAIL: result <{0}> does not match expectation <{1}>", result, expect)
        return false
    end if
    return true
end function