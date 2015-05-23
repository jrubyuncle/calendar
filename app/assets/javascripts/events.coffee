$(document).on 'ready page:load', () ->
  $('[data-all-day]:checked').closest('.fields').find('[data-date-input]').hide()
  $('[data-all-day]:not(:checked)').closest('.fields').find('[data-date-input]').show()
  $(document).on 'change', '[data-all-day]', () ->
    $this = $(this)
    if $this.is(':checked')
      $this.closest('.fields').find('[data-date-input]').hide()
    else
      $this.closest('.fields').find('[data-date-input]').show()
