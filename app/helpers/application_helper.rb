module ApplicationHelper

  def is_nav_item_active?(item)
    controller.class.name == "#{item}Controller" ? 'active' : ''
  end

  def separator_needed?(neighbours)
    neighbours.reduce('') do |s,n|
      s = 'hide' if controller.class.name == "#{n}Controller"
      s
    end
  end

  def colors
    {
        '<div class="color none"></div>'.html_safe   => 'none',
        '<div class="color blue"></div>'.html_safe   => 'blue',
        '<div class="color red"></div>'.html_safe    => 'red',
        '<div class="color green"></div>'.html_safe  => 'green',
        '<div class="color yellow"></div>'.html_safe => 'yellow',
        '<div class="color orange"></div>'.html_safe => 'orange',
        '<div class="color black"></div>'.html_safe  => 'black'
    }
  end
end
