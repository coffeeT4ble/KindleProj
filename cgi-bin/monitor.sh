#!/usr/bin/env bash
echo "Content-type: text/html"
echo ""

uptime=$(uptime -p)
mem=$(free -m | awk '{print $2 " | " $3 " | " $7}' | sed '2q;d')
load=$(awk '{print "<b>1</b>: " $1, "<b>5</b>: " $2, "<b>15</b>: " $3}' /proc/loadavg)

echo "<html>"
echo "<head><title>System Info</title></head>"
echo "<body>"

echo "<h3> Uptime </h3>"
echo "<p> $uptime </p>"

echo "<h3> Memory </h3>"
echo "<i> Total | Used | Ava </i>"
echo "<p> $mem </p>"

echo "<h3> Load avg </h3>"
echo "<p> $load </p>"



echo "</body>"
echo "</html>"

