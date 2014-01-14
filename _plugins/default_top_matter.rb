# Default top matter
# A Jekyll plug-in by Paul '@pjf' Fenwick
#
# Based upon code by Hakan Ensari
# https://stackoverflow.com/a/17739983
#
# If a `_defaults.yml` file exists in the same directory as your
# post, it will be read first. Settings in your posts' top-matter
# will override these defaults.
#
# This can be useful if you wish to provide default layout, tags,
# titles, or other attributes.
#
# Patches are very welcome; especially one that traverses the
# entire directory tree, applying defaults as we go.
#
# You may use, modify, and distribute this code under the same
# license as Ruby itself.

module DefaultTopMatter
    def read_yaml(base, name)

        begin
            # Read our defaults, if they exist.
            
            defaults_yml = base + '/' + File.dirname(name) + '/_defaults.yml'
            defaults = YAML.load_file(defaults_yml)

        rescue
            # Ignore failing to find defaults

        end

        # Now read the actual top-matter of the top
        super(base, name)

        # Finally, merge the defaults into our data
        self.data = defaults.merge(self.data)
        
    end
end

Jekyll::Post.send(:include, DefaultTopMatter)
