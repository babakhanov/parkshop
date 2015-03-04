validation = ->
  $('form').validator()

$(document).ready(validation)
$(document).on('page:load', validation)


``

