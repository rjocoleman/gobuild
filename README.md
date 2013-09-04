# gobuild

Build Go programs for various architectures.

## Installation

    $ heroku create myapp-build
    $ heroku release https://api.anvilworks.org/slugs/44671be1-df9d-4aca-8a9e-b6392cb48d06.tgz -a myapp-build
    $ heroku config:set HOST=linux-amd64
    $ heroku config:set PLATFORMS="darwin-386 darwin-amd64 linux-386 linux-amd64 windows-386 windows-amd64"
    $ heroku config:set PROJECT="github.com/me/myapp"

## Usage

    $ curl -O http://myapp-build.herokuapp.com/darwin-amd64/myapp
    $ chmod +x myapp
    $ ./myapp

## License

MIT
