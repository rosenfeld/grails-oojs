# What is this?

This is a Grails application integrated to the 
[oojs](https://github.com/rosenfeld/oojs) gem for easy tests writing.

# Instructions for creating this app:

    grails create-app grails-oojs
    cd grails-oojs
    echo "/target" > .gitignore
    git clone git://github.com/rosenfeld/oojs_assets_enabler.git spec_runner
    cat spec_runner/.gitignore-root-example >> .gitignore
    rm -rf spec_runner/.git*
    ln -s spec_runner/Rakefile
    cd spec_runner; bundle; cd ..
    rake oojs:spec_helper
    rake oojs:spec -- --name=shopping_cart

Then adjust the config.assets.paths in "spec\_runner/config/application.rb".
For Grails, just uncomment that line. Finally:

    rake oojs:serve

Navigate to http://localhost:5000/ and see the specs passing.
