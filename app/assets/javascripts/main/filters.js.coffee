filters_init = ->
  $('.filters-form input').change ->
    $('.filters-form').submit()
  if $('.price-slider').length
    1
  
$(document).ready(filters_init)
$(document).on('page:load', filters_init)

