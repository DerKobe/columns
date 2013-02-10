class Dashboard

  constructor: ->
    $('body.dashboard .shortcut.auto-open').on 'mouseenter mouseleave', @toggle_sublinks
    $('body.dashboard .shortcut .toggle-buttons a').on 'click', @toggle_sublinks
    $('body.dashboard .shortcut .headline').on 'click', @follow_headline_link

    $('body.arrange ul').sortable({
      items: 'li.shortcut'
      connectWith: "body.arrange ul"
      stop: @save_new_position_for_shortcut
    }).disableSelection();

  toggle_sublinks: (event)->
    $shortcut = $(event.target).closest('.shortcut')
    $shortcut.find('.sublinks').slideToggle(150)
    if event.type == 'click'
      $shortcut.find('.toggle-buttons a').toggle()

  follow_headline_link: (event)->
    window.location = $(event.target).closest('.headline').find('a').attr('href')

  save_new_position_for_shortcut: (event,ui)->
    $shortcut = $(ui.item)
    $.ajax(
      type: 'POST'
      url: '/arrange'
      data:
        position: $shortcut.index()-1
        shortcut_id: $shortcut.data('id')
        column_id: $shortcut.closest('.column').data('id')
    )

$ ->
  new Dashboard()