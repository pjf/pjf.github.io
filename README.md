This is pjf's personal website. You can fork this repo and use it
for your own website if you like, or you can send me patches,
corrections, and improvements.

#### Initial Configuration

This assumes you want the underlying site, but not the config

**Step 1**

Fork and clone the repository

**Step 2**

* Create a new build branch off `base`

```
    $ git checkout base
    $ git branch -m build old_build
    $ git checkout -b build
    $ git push origin build --force
```

(You can delete the `old_build` branch if you like)

**Step 3**

Copy the `_config.yml.example to _config.yml and make your changes.

#### Branches and building

The `base` branch is where you can pull in changes to the underlying
site. It should be safe to `git merge base` at any time.

The `build` branch is where you want to do all your work.

The `master` branch is the compiled, static site. This is required
by github.

Run `jekyll build` to build, or `jekyll serve` to start a test
server on `localhost:4000`.

#### CUSTOMISE

See the contents of the include `_doc` directory for ways in
which you can customise the site. Contributions to this documentation
are very welcome!

#### Deploying

Run `bin/deploy.pl` to deploy. *Make sure you have all your changes
committed first*.

#### LICENSE

Creative Commons Attribution 3.0 except where otherwise marked.
