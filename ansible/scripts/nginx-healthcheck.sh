#!/bin/bash

status_code=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

if [[ "$status_code" -ne 200 ]] ; then
  echo "Error >> Nginx status changed to $status_code"
else
  echo "Nginx healthy!"
fi