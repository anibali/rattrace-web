#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require flowtype.min
#= require_tree .
#= require highcharts/highcharts

ready = ->
  $('.text-section').flowtype
    minFont: 12
    maxFont: 26
    fontRatio: 24

$(document).ready(ready)
$(document).on('page:load', ready)

# Configure Highcharts to use local time
Highcharts.setOptions({global: {useUTC: false}})
