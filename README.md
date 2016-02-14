# novel json apis
for bear's tool to consume
## scripts
```sh
# To have launchd start postgresql at login:
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
# Then to load postgresql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
# Or, if you don't want/need launchctl, you can just run:
postgres -D /usr/local/var/postgres
# install
bundle install
# run server
rails server
```
## APIs
### get book list (meta)
**GET** /books
**GET** /authors/123/books
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
**GET** /books/123
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
### set individual book (meta)
**POST** /books
```json
{
  "name": "aaaa",
  "author_id": 123
}
```
### update individual book (meta)
**PUT** /books/1
```json
{
  "name": "aaax",
  "author_id": 2
}
```
### get chapter lists
**GET** /books/123/chapters
* params:
* int body: 0/1 to determine weather displaying body
* int pg: page number for pagination
```json
[
  {
    "book_id": 1,
    "title": "xxxx",
    "author_name": "xxxx",
    "author_id": 123,
    "index": 123,
    "body": "xxxxx....."
  }
]
```
#### response header
* X_PAGINATION: {"total_page":10,"current_page":2}

### get each chapter
**GET** /books/123/chapters/123
```json
{
  "book_id": 1,
  "title": "xxxx",
  "author_name": "xxxx",
  "author_id": 123,
  "index": 123,
  "body": "xxxxx....."
}
```
### create chapter
**GET** /books/123/chapters
```json
{
  "book_id": 1,
  "title": "xxxx",
  "author_id": 123,
  "index": 123,
  "body": "xxxxx....."
}
```
### update chapter
**GET** /books/1/chapters/123
```json
{
  "book_id": 1,
  "title": "xxxx",
  "author_id": 123,
  "index": 123,
  "body": "xxxxx....."
}
```
### get authors
**GET** /authors
```json
[
  {
    "id": 123,
    "name": "aaaa"
  },..
]
```
### get author
**GET** /authors/123
```json
{
  "id": 123,
  "name": "aaaa"
}
```
### set author
**POST** /authors
```json
{
  "name": "aaaa"
}
```
### update author
**PUT** /authors/1
```json
{
  "name": "aaab"
}
```
## references
* <https://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/>
