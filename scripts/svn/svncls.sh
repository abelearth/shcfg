#!/bin/bash
svn status --no-ignore | grep ^[I,\?] | cut -c9- | xargs -I{} -d \\n rm -rv {}
