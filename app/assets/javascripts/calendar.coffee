$(document).on 'ready page:load', () ->
  $('[data-datetime-picker]').datetimepicker
    format: 'YYYY-MM-DD HH:mm:SS'