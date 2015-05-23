# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Calendar =
  init: ->
    Calendar.init_calendar()

  init_once: ->

  init_calendar: ->
    $("#calendar").fullCalendar({events: $("#calendar").data("path")})


Calendar.init_once()

$(document).on 'ready page:load', ->
  Calendar.init()