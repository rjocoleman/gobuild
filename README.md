# gobuild

Build Go programs for various architectures.

## Installation

    $ heroku create myapp-build
    $ heroku release https://api.anvilworks.org/slugs/5cce12b3-9432-407b-981c-c9f7dd4a63e4.tgz -a myapp-build
    $ heroku config:set HOST=linux-amd64
    $ heroku config:set PLATFORMS="darwin-386 darwin-amd64 linux-386 linux-amd64 windows-386 windows-amd64"
    $ heroku config:set PROJECT="github.com/me/myapp"

## Usage

    $ curl -O http://myapp-build.herokuapp.com/darwin-amd64/myapp
    $ chmod +x myapp
    $ ./myapp

## License

MIT
