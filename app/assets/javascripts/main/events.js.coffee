$(document).on 'page:fetch', ->
  $(document.documentElement)
    .removeClass('loaded')

  $(document.documentElement)
    .addClass('loading')

$(document).on 'page:change', ->
  $(document.documentElement)
    .removeClass('loading')

$(document).on 'page:load', ->
  $(document.documentElement)
    .addClass('loaded')
