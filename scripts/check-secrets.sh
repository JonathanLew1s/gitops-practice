#!/bin/sh
# Look for things that should never be committed. Values are never printed, only the file and line.
fail=0
check() { # name, regex
  hits=$(grep -rEn --exclude-dir=.git --exclude-dir=scripts --exclude=README.md "$2" . 2>/dev/null | cut -d: -f1,2)
  if [ -n "$hits" ]; then echo "$hits" | while IFS=: read -r f l; do echo "::error file=$f,line=$l::Possible $1 found. Remove it, and treat it as exposed if it was ever real."; done; fail=1; fi
}
check "secret token" 'FAKE-TOKEN-|ghp_[A-Za-z0-9]{36}|AKIA[0-9A-Z]{16}'
check "password" '(password|passwd|secret)[[:space:]]*[:=][[:space:]]*[^[:space:]]+'
check "national-ID style number (PII)" '[0-9]{3}-[0-9]{2}-[0-9]{4}'
[ $fail = 0 ] && echo "secrets: nothing found"
exit $fail
