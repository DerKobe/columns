$ ->
  $('.shortcut.auto-open').on 'mouseenter', (e)->
    $sublinks = $(e.target).closest('.shortcut').find('.sublinks')
    unless $sublinks.data 'open'
      $sublinks.data 'open', true
      $sublinks.slideToggle(150)

  $('.shortcut.auto-open').on 'mouseleave', (e)->
    $sublinks = $(e.target).closest('.shortcut').find('.sublinks')
    if $sublinks.data 'open'
      $sublinks.data 'open', false
      $sublinks.slideToggle(150)
