require 'squib'

data = Squib.csv file: 'card-data.csv'
icon_credits = YAML.load(File.read("icons/credits.yml"))

# moo bleed size?!
Squib::Deck.new(cards: data['title'].size, layout: 'layout.yml', width: '59mm', height: '88mm') do
  background color: 'white'
  # rectangle around card
  #rect
  #rect layout: 'cut' # cut line as defined by TheGameCrafter
  #rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['title'], layout: 'title'
  text str: data['description'], layout: 'description'
  # or png
  #png file: data['icon'].map { |n| "icons/#{n}.png" }, layout: 'art'
  #png file: data['group'].map { |n| "icons/group-#{n.downcase}.png" }, layout: 'lower_right'
  svg file: data['icon'].map { |n| "icons/#{n}.svg" }, layout: 'art'
  text str: data['icon'].map { |n| icon_credits[n] }, layout: 'art_credit', format: true
  svg file: data['group'].map { |n| "icons/group-#{n.downcase}.svg" }, layout: 'lower_right'
  text str: data['group'], layout: 'lower_left'
  
  save format: :png
  # moo trim is smaller than squib examples; A4 narrower than letter
  save_pdf trim: 23.5, height: 2200
end
