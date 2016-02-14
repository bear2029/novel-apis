# novel json apis
for bear's tool to consume
## scripts
```sh
# install
bundle install
# run server
rails server
```
## APIs
### get book list (meta)
*GET* /books
```json
[
  {
    "id": 123,
    "name": "aaaa",
    "count": 3000,
    "author_name": "xxxx",
    "author_id": 123,
    "last_updated": 12312312
  },..
]
```
### get individual book (meta)
*GET* /books/123
```json
{
  "id": 123,
  "name": "aaaa",
  "author_name": "xxxx",
  "author_id": 123,
  "count": 3000,
  "last_updated": 12312312
}
```
### get chapter lists
*GET* /books/123/chapters
* params:
* int body: 0/1 to determine weather displaying body
* int pg: page number for pagination
```json
[
  {
    "title": "xxxx",
    "author_name": "xxxx",
    "author_id": 123,
    "
  }
]
```
#### response header
* X_PAGINATION: {"total_page":10,"current_page":2}
### get each chapter
