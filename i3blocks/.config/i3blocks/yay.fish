#!/usr/bin/fish

# Get the count of packages that are available to upgrade
set count (yay -Pn)

if test $count -eq 0
  echo "No Updates"
else if test $count -gt 0
  echo "$count updates"
else
  echo "Error"
end
