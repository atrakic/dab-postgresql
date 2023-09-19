declare -a opts
opts=(-H 'X-MS-API-ROLE: Sample.Role')
#opts+=(-H 'Authorization: Bearer ey...')
curl -sL "${opts[@]}" http://localhost:5000/api/Book
curl -sL "${opts[@]}" http://localhost:5000/api/Author
