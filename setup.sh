#!/bin/sh
# Set UTF-8 encoding
export LANG=UTF-8
# Needed to work in SourceTree
export PATH=/usr/local/bin:$PATH

# Git repository absolute path
git_root=`git rev-parse --show-toplevel`
# Hook files path
hook_directory="$git_root/.git/hooks"

echo

if mkdir -p "$hook_directory"
then
  for hook in post-checkout post-merge pre-commit
  do
    if cp ""`dirname $0`"/$hook" "$hook_directory"
    then echo "$hook file copied."
    else echo "Could not copy $hook file."
    fi
    if chmod +x "$hook_directory/$hook"
    then echo "$hook file made executable."
    else echo "Could not make $hook file executable."
    fi
  done
fi

echo
echo "All hooks are copied and made executable."
echo "You can start using Git for Sketch files."
echo