find $1 -type d | xargs -I{} chmod -v 0775 {}
find $1 -not -type d | xargs -I{} chmod -v 0664 {}
find $1 -iname "*.sh" -o -iname "*.py" -o -iname "*.exe" -o -iname "*.bat" -o -iname "*.dll" -o -iname "*.a" | xargs -I{} chmod -v +x {}

