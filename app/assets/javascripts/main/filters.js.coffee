filters_init = ->
  $('.filters-form input').change ->
    $('.filters-form').submit()
  
$(document).ready(filters_init)
$(document).on('page:load', filters_init)

