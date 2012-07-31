# What is oojs\_assets\_enabler?

This is a minimal Rails application with support for the asset pipeline
bundled with the [oojspec](https://github.com/rosenfeld/oojspec) spec-runner.
This branch also provides integration with the [oojs](http://github.com/rosenfeld/oojs) gem.

Just copy these files to your (non-Rails) project root and run:

    rake oojs:spec_helper
    rake oojs:spec -- --name=shopping_cart
    rake oojs:serve

Then browse to http://localhost:5000 and see your specs passing.

Alternatively you can add this repository to some subdirectory and optionally
symlink Rakefile to your root app.

Take a look at [this oojs enabled Grails sample application](https://github.com/rosenfeld/grails-oojs).

Happy coding! :)
