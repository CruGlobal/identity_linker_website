# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('[data-behavior]').click ->
    $('#spinner').show()
    $('#results').html('')
    $('#method').val($(this).attr('data-behavior'))
    $('#linker_form').submit()
