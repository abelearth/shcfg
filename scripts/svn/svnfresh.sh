svn status --no-ignore | grep ^[A,D,M,!] | cut -c9- | xargs -I{} -d \\n svn revert {}
