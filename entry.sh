#!/bin/bash
/usr/bin/vncserver :99 &
/opt/noVNC/utils/novnc_proxy --vnc 127.0.0.1:5999
