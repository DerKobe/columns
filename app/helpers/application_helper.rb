module ApplicationHelper

  def is_nav_item_active?(item)
    controller.class.name == "#{item}Controller" ? 'active' : ''
  end

  def colors
    {
        '<div class="color none">A</div>'.html_safe   => 'none',
        '<div class="color blue">A</div>'.html_safe   => 'blue',
        '<div class="color red">A</div>'.html_safe    => 'red',
        '<div class="color green">A</div>'.html_safe  => 'green',
        '<div class="color yellow">A</div>'.html_safe => 'yellow',
        '<div class="color orange">A</div>'.html_safe => 'orange',
        '<div class="color black">A</div>'.html_safe  => 'black'
    }
  end

  def sublinks_panel
    {
      'Off' => :off,
      'Always open' => :always_open,
      'Auto open/close' => :auto,
      'Manual toggle' => :toggle
    }
  end

end
