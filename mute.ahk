#Persistent
#SingleInstance, Force
return

Numpad8::
    HttpGet("http://192.168.0.99:2345/mute")
return

Numpad9::
    HttpGet("http://192.168.0.99:2345/unmute")
return

HttpGet(URL) {
    whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    whr.Open("GET", URL)
    whr.Send()
}