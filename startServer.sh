#!/bin/bash

kill -9 $(lsof -t -i:3000) 2>/dev/null

nohup rails s -b 0.0.0.0 -p 3000 > log/production.log 2>&1 &