#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require_tree .
#= require highcharts/highcharts

ready = ->
  $('.text-section').flowtype
    minFont: 12
    maxFont: 20
    fontRatio: 20

$(document).ready(ready)
$(document).on('page:load', ready)
