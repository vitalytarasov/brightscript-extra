sub main()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("Tester")
    screen.show()

    ' run string tests
    pass = 0
    fail = 0
    print "starting string tests"
    if TestBsxToString() then pass = pass + 1 else fail = fail + 1
    print "result of string tests: " + BsxToString(pass) + " passed, " + BsxToString(fail) + " failed"

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        print "receied " + msgType + " event"
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub
