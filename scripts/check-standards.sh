#!/bin/sh
# Every file in config/ must set resource limits and must not use a floating image tag.
fail=0
for f in config/*.yaml; do
  grep -q 'limits:' "$f" || { echo "::error file=$f::$f sets no resource limits. Every application must declare how much CPU and memory it may use."; fail=1; }
  if grep -Eq 'image:.*:latest|image:[^:]*$' "$f"; then echo "::error file=$f::$f uses a floating image tag. Pin an exact version, for example :1.4.0."; fail=1; fi
done
[ $fail = 0 ] && echo "standards: all checks passed"
exit $fail
