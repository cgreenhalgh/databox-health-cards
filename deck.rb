require 'squib'

data = Squib.csv file: 'card-data.csv'

# moo bleed size?!
Squib::Deck.new(cards: data['title'].size, layout: 'layout.yml', width: '59mm', height: '88mm') do
  background color: 'white'
  # rectangle around card
  rect
  rect layout: 'cut' # cut line as defined by TheGameCrafter
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['title'], layout: 'title'
  text str: data['description'], layout: 'description'
  png file: data['icon'].map { |n| "icons/#{n}.png" }, layout: 'art'
  png file: data['group'].map { |n| "icons/group-#{n.downcase}.png" }, layout: 'lower_right'
  text str: data['group'], layout: 'lower_left'
  
  save format: :png
  # moo trim is smaller than squib examples
  save_pdf trim: 23.5
end
