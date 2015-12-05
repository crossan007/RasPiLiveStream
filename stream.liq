#!/usr/bin/liquidsoap

set("init.daemon",true)
set("init.daemon.pidfile.path","/tmp/soap.pid")

set("log.file.path","/tmp/soap.log")
set("log.stdout",false)
set("log.file",true)
set("log.level",4)

set("server.telnet",true)


source = input.alsa(bufferize=true,device="plughw:1,0")
#source = noise(duration=100.00)
output.alsa(bufferize=true,fallible=true,device="hw:0",source)

output.icecast(%vorbis, host='172.30.9.163',
               port=8000, password='hackme',
               mount="/stream/live.ogg", fallible=true,
               source)

