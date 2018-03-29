#!/bin/sh

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
OUTPUT="$(cat /opt/eagleowl/.live | awk '{print $4}')"

currenttime=$(date +%s)
curl  -X POST -H "Content-type: application/json" \
-d "{ \"series\" :
         [{\"metric\":\"energy\",
          \"points\":[[$currenttime, $OUTPUT]],
          \"type\":\"gauge\",
          \"host\":\"home\",
          \"tags\":[\"environment:energy\"]}
        ]
    }" \
'https://app.datadoghq.com/api/v1/series?api_key=APIKEY'

