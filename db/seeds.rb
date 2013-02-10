user = User.create! email: 'philip.claren@googlemail.com', password: 'testestest'

user.columns.create!(title: 'Blogs')
user.columns.create!(title: 'Frameworks')

user.shortcuts.create!(headline: 'Spiegel Online', url: 'http://spiegel.de', color: :red, column_id: user.columns.first.id)
user.shortcuts.create!(headline: 'Mac & I', url: 'http://www.heise.de/mac-and-i', color: :none, column_id: user.columns.first.id)
user.shortcuts.create!(headline: 'Heise', url: 'http://www.heise.de', color: :blue, column_id: user.columns.first.id)

user.shortcuts.create!(headline: 'TwitterBootstrap', url: 'http://twitter.github.com/bootstrap/', color: :yellow, column_id: user.columns.last.id)
user.shortcuts.create!(headline: 'Fontawesome', url: 'http://fortawesome.github.com/Font-Awesome/', color: :red, column_id: user.columns.last.id)
user.shortcuts.create!(headline: 'Backbone.js', url: 'http://backbonejs.org/', color: :none, column_id: user.columns.last.id)

