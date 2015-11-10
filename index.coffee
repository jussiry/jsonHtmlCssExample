
{ parse } = require "jussiry/jsonHtml"


htmlObj =
  '.main':
    button: 'click!'
    ul:
      for i in [1,2,3]
        li: i

parse htmlObj, document.querySelector('#root')
