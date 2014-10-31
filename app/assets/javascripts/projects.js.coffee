# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @Runtime
  constructor: ->
    that = @
    @runtime_starter = $("a#start_runtime")

    @runtime_starter.on 'click', (e) ->
      e.preventDefault()
      setInterval (->
        # alert "Monitor Table Successfully Reloaded"
        $("#monitor_table").load "/projects/monitortable"
        ), 300000

$(document).ready ->
  runtime = new Runtime

jQuery ->
  # Remove fieldset
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()
    
  # Add more fieldset
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()