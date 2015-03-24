# Trading

## General project information

### Framework and language versions
- Rails Version: 4.2.1
- Ruby Version: 2.2.1

### Branching model (more info [here](http://nvie.com/posts/a-successful-git-branching-model/))

- Development
- Staging
- Master (which is production)
- Hotfixes
- Temporary feature branches

### Styling guidelines:

Using github’s [ruby guidelines](https://github.com/styleguide/ruby). More on the application wiki.

## Set up the application

### Install [foreman](https://github.com/ddollar/foreman#installation)

If you have...  | Install with...
------------- | -------------
Ruby (MRI, JRuby, Windows)  | $ gem install foreman
Mac OS X  | [foreman.pkg](http://assets.foreman.io/foreman/foreman.pkg)

### Install [mailcatcher](http://mailcatcher.me/) gem

    $ gem install mailcatcher

### Install gems with bundle

    $ bundle install

### Set up the database

    $ bin/rake db:setup

### Start the mailcatcher

    $ mailcatcher --http-ip=0.0.0.0

Go to:

    $ open http://localhost:1080

### Start the server

    $ foreman start -f Procfile.dev

Go to:

    $ open http://localhost:3000
