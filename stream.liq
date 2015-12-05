#!/usr/bin/liquidsoap


#Resource: http://savonet.sourceforge.net/doc-svn/scripts/users_radiopi.liq
#resource: http://savonet.sourceforge.net/doc-svn/documentation.html
#Resource: http://www.dlineradio.co.uk/articles/stls-and-raspberry-pis/


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

output.icecast(%mp3.abr(bitrate=32,max_bitrate=64), host='172.30.9.163',
               port=8080, password='hackme',
               mount="/stream/live.mp3", fallible=true,
               source)

			   
	