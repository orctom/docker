#!/bin/bash
/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startServer.sh server1
tail -f /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/server1/SystemOut.log
