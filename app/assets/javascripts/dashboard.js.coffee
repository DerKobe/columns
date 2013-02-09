class Dashboard

  constructor: ->
    $('.shortcut.auto-open').on 'mouseenter mouseleave', @toggle_sublinks
    $('.shortcut .toggle-buttons a').on 'click', @toggle_sublinks
    $('.shortcut .headline').on 'click', @follow_headline_link

  toggle_sublinks: (event)->
    $shortcut = $(event.target).closest('.shortcut')
    $shortcut.find('.sublinks').slideToggle(150)
    if event.type == 'click'
      $shortcut.find('.toggle-buttons a').toggle()

  follow_headline_link: (event)->
    window.location = $(event.target).closest('.headline').find('a').attr('href')

$ ->
  new Dashboard()