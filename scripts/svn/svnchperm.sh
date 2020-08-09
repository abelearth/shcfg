find $1 -path \.svn -prune -o -type d | grep -v \.svn | xargs -I{} chmod -v u+rwx {}
find $1 -path \.svn -prune -o -type f | grep -v \.svn | xargs -I{} chmod -v u+rw {}
find $1 -iname "*.sh" -o -iname "*.exe" -o -iname "*.bat" | xargs -I{} chmod -v +x {}

