class Dashboard

  constructor: ->
    $('body.dashboard .shortcut.auto-open').on 'mouseenter mouseleave', @toggle_sublinks
    $('body.dashboard .shortcut .toggle-buttons a').on 'click', @toggle_sublinks
    $('body.dashboard .shortcut .headline').on 'click', @follow_headline_link

    $('body.arrange ul').sortable({items: 'li.shortcut', connectWith: "body.arrange ul"}).disableSelection();

  toggle_sublinks: (event)->
    $shortcut = $(event.target).closest('.shortcut')
    $shortcut.find('.sublinks').slideToggle(150)
    if event.type == 'click'
      $shortcut.find('.toggle-buttons a').toggle()

  follow_headline_link: (event)->
    window.location = $(event.target).closest('.headline').find('a').attr('href')

$ ->
  new Dashboard()