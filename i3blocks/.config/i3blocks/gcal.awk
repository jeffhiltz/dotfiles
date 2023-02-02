#!/bin/awk -f

BEGIN {
  FS = "^"
};

{
  minutes_until = int(($1 - systime()) / 60);
  if (minutes_until > 17 * 60) {
    print "No Meetings";
  }
  else if (minutes_until > 90) {
    start = strftime("%H:%M", $1);
    print start" -"$2;
  }
  else {
    if (minutes_until > 5)
      color = "#dfdab7";
    else if (minutes_until > 1)
      color = "orange";
    else
      color = "red";
    print "<span foreground=\""color"\">"minutes_until" mins until"$2"</span>";
  }
}
