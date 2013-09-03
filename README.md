# gobuild

Build Go programs for various architectures.

## Installation

$ heroku create myapp-build
$ heroku release http:// -a myapp-build
$ heroku config:set HOST=linux-amd64 NODE_ENV=production PLATFORMS="darwin-386 darwin-amd64 linux-386 linux-amd64 windows-386 windows-amd64"
$ heroku config:set PROJECT="github.com/me/myapp"

## Usage

$ curl -O http://myapp-build.herokuapp.com/darwin-amd64/myapp
$ chmod +x myapp
$ ./myapp

## License

MIT

