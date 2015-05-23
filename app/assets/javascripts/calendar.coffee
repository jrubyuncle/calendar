$(document).on 'ready page:load nested:fieldAdded:events', () ->
  $('[data-datetime-picker]').datetimepicker
    format: 'YYYY-MM-DD HH:mm:SS'