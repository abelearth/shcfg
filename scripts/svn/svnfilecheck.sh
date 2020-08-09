svn st | sed 's/^[M,A]       //g;' | xargs -I{} ls -l {}
