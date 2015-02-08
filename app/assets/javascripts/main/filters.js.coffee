filters_init = ->
  $('.filters-form input').change ->
    $('.filters-form').submit()
  if $('.price-slider').length
    $('.price-ui-slider').slider
      range: true
      min: parseInt $('.price-start').val()
      max: parseInt $('.price-end').val()
      values: [
        parseInt $('.price-from').val()
        parseInt $('.price-to').val()
      ]
      slide: (event, ui) ->
        $('.price-from').val ui.values[0]
        $('.price-to').val ui.values[1]
        $('.filters-form').submit()

  
$(document).ready(filters_init)
$(document).on('page:load', filters_init)


``



