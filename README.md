# Ruby on Rails Tutorial sample application

This is the sample application

## Getting started

To get started with the app, clone the repo and then install the needed gems:
```
$ gem install bundler -v 2.3.14
$ bundle _2.3.14_ config set --local without 'production'
$ bundle _2.3.14_ install
```

Next, migrate the database:
```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```

To provide tests guard
```
bundle _2.3.14_ exec guard init
```