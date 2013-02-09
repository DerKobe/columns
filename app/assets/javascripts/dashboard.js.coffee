class Dashboard

  constructor: ->
    $('.shortcut.auto-open').on 'mouseenter mouseleave', @toggle_shortcut

  toggle_shortcut: (event)->
    $sublinks = $(event.target).closest('.shortcut').find('.sublinks')
    if $sublinks.data 'open' == (event.type == 'mouseleave')
      $sublinks.data 'open', (event.type == 'mouseleave')
      $sublinks.slideToggle(150)

$ ->
  new Dashboard()