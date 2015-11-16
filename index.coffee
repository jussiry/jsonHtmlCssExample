
{ parse } = require "jsonHtml"

{ addStyles, compile, removeStyles } = require "jsonCss"

styleId = 'some-style-id'

# HTML

htmlObj =
  '.json-html-style-example':
    h1: "Some html to target the styles"
    'h1.second': ".second title"
    ul: [
      li: "dii"
    , li: "daa"
    ]
    'button.remove':
      text: 'remove style definitions'
      onClick: -> removeStyles styleId

# STYLES

blackBox =
  padding: 10
  background: 'black'
  color: 'white'

cssDefinitions =
  '.json-html-style-example':
    # camelCase poperty names transform to kebab-case, e.g.
    # borderRadius -> border-radius
    borderRadius: "10px"
    # pixel values can be defined with plain numbers:
    padding: 10
    background: 'white'
    color: 'black'
    h1:
      fontSize: 14
      # & -sign can be used to mixin definition to parent
      '&': blackBox
      # unlike with jsonHtml, whitespace characters do matter
      '&.second':
        color: "hsl(120, 90%, 45%)"
    ul:
      padding: blackBox.padding
      li:
        # add -v to property to create vendor prefixes
        "filter -v": "blur(2px)"
    '.remove':
      color: 'red'
      margin: 10
  # nested definitions can also be define in one string
  'body pre': blackBox

# INIT

parse htmlObj, document.querySelector('#root')
addStyles styleId, cssDefinitions
