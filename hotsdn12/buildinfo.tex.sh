#!/bin/sh

# Note: independent of what the #$ tag says, the makefile will run this
# via /bin/sh. So be dash-aware

git_revision=$(hg tip | head -1 | awk -F ' ' '{ print substr($2,0,11) }')
date=$(date)
#echo "\\large Rev ${git_revision}" >buildinfo.tex
if ! hg diff --quiet >/dev/null ; then
    changed_tag="{\\color{red}{(Uncommitted!)}}"
else
    changed_tag=""
fi
cat >buildinfo.tex <<END
Rev ${git_revision} ${changed_tag}
built on $date
by $USER
END
