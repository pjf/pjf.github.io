This is pjf's personal website. You can fork this repo and use it
for your own website if you like, or you can send me patches,
corrections, and improvements.

#### Initial Configuration
Copy the `_config.yml.example to _config.yml and make your changes.

#### Branches and building

The `base` branch is where you can pull in changes to the underlying
site. In theory you should be able to pull central changes into here 
and safely merge them into your site (I don't have a method for this
yet)

The `build` branch is where you want to do all your work. The
`master` branch is the compiled, static site.

Run `jekyll build` to build, or `jekyll serve` to start a test
server on `localhost:4000`.

#### Deploying

Run `bin/deploy.pl` to deploy. *Make sure you have all your changes
committed first*.

#### LICENSE

Creative Commons Attribution 3.0 except where otherwise marked.
