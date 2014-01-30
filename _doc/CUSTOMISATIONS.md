Things that can be changed/customised beyond the config file. 

NOTE: Be aware that some of this may result in a merge conflict

#### Logo Colour
* If the HTML5 template is updated, you will have to handle a merge conflict and reapply your customisations

Using vim it is easy to do a search and replace on the following files:

* css/style-narrower.css
* css/style.css
* css/style-desktop.css
* css/style-mobile.css

This will change the colour to blue
`%s/#c94663/#0062A3/g`

To get the change colour for the mobile sites side bar slide out button a separate change is required

* css/style-mobile.css

`%s/#d95673/#0071bd/g`

#### Favicon

The favicon can be created using 'The Gimp'. 

- Open the page, grab a screen shot
- Copy a 32x32 section of the logo
- Create a new file, with a transparent background as the first layer
- Paste your selection as a new layer
- Input your text, colour #d4dde0
- Save as favicon.png under images
