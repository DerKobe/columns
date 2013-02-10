class Shortcuts
  constructor: ->
    $('.sublinks-panel-option').on 'change', @show_hide_sublinks_panel
    $('.sublinks').sortable(items: '.sublink').disableSelection()
    $('form').on 'submit', @gather_sublinks
    $('#add-sublink').click @add_sublink
    $('.sublinks').delegate '.remove', 'click', @remove_sublink

  show_hide_sublinks_panel: ->
    if $('.sublinks-panel-option:checked').val() == 'off'
      $('#sublinks-panel').hide()
    else
      $('#sublinks-panel').show()

  gather_sublinks: (event)->
    sublinks = new Array()
    $('.sublink').each (index,sublink)->
      title = $(sublink).find('input[name=title]').val()
      url = $(sublink).find('input[name=url]').val()
      sublinks.push { title: title, url: url }
    $('input[name=sublinks_serialized]').val JSON.stringify(sublinks)

  add_sublink: ->
    $('.sublinks').append $('#sublink-template').html()

  remove_sublink: (event)->
    if $('.sublink').length > 1
      $(event.currentTarget).closest('.sublink').remove()
    else
      $(event.currentTarget).closest('.sublink').find('input[type=text]').val('')

$ ->
  new Shortcuts() if $('body').hasClass('shortcuts')
