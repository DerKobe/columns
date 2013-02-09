class Dashboard

  constructor: ->
    $('.shortcut.auto-open').on 'mouseenter mouseleave', @toggle_sublinks
    $('.shortcut .toggle-buttons a').on 'click', @toggle_sublinks

  toggle_sublinks: (event)->
    $shortcut = $(event.target).closest('.shortcut')
    $shortcut.find('.sublinks').slideToggle(150)
    if event.type == 'click'
      $shortcut.find('.toggle-buttons a').toggle()

$ ->
  new Dashboard()