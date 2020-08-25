#!/bin/bash

gcalcli --calendar jeff.hiltz@vimcar.com agenda --tsv --nostarted --nodeclined | head -n1 | awk '{
  start_string = gensub(/[-:]/, " ", "g", $1" "$2" 00")
  start_time = mktime(start_string)
  description = ""
  for(i = 5; i <= NF; i++) {
    description = description" "$i
  }
  gsub("&", "\\&amp;", description)
  gsub("<", "\\&lt;", description)
  gsub(">", "\\&gt;", description)
  print start_time"^"description
}'
