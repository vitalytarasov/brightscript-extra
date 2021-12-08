sub main()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    ' create and run Tester node
    tester = screen.CreateScene("TestScene")
    screen.show()
    tester.callFunc("runTests")

    ' main loop
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        print substitute("received {0} event", msgType)
        if msgType = "roSGScreenEvent" and msg.isScreenClosed() then return
    end while
end sub
