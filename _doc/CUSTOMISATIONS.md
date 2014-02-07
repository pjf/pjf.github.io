Things that can be changed/customised beyond the config file. 

NOTE: Be aware that some of this may result in a merge conflict

#### Custom CSS
If you wish to override any of the sites css, a custom.css.example exists 
so you can do so without having to handle merge conflicts in the future.

Copy /css/custom.css.example to /css/custom.css and uncomment 'custom.css'
in the _config.yml

The example changes the site logo to blue.

#### Logo Colour
* If the HTML5 template is updated, you will have to handle a merge conflict and reapply your customisations

Using vim it is easy to do search for the relevant sections in these files:

* css/style-narrower.css
* css/style.css
* css/style-desktop.css
* css/style-mobile.css

This will find the current colour (red)
`/c94663`

add this to your custom.css

```css
  #logo
  {
    background-color: #0062A3;
  }
```

To get the change colour for the mobile sites side bar slide out button a separate change is required

* css/style-mobile.css

`/#d95673`

add this to your custom.css

```css
  #titleBar .toggle:active:before
  {
    background-color: #0071bd;
  }
```

#### Favicon

The favicon can be created using 'The Gimp'. 

- Open the page, grab a screen shot
- Copy a 32x32 section of the logo
- Create a new file, with a transparent background as the first layer
- Paste your selection as a new layer
- Input your text, colour #d4dde0
- Save as favicon.png under images
