require 'squib'

data = Squib.csv file: 'card-data.csv'
icon_credits = YAML.load(File.read("icons/credits.yml"))
n = data['title'].size

last_is_back = true

# front cards
nf = last_is_back ? n-2 : n-1

# moo bleed size?!
Squib::Deck.new(cards: n, layout: 'layout.yml', width: '59mm', height: '88mm', dpi: 300) do
  background range: 0..nf, color: 'white'
  # back
  background range: -1, color: '#eee' if last_is_back
  # rectangle around card
  #rect
  #rect layout: 'cut' # cut line as defined by TheGameCrafter
  #rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text range: 0..nf, str: data['title'], layout: 'title'
  text range: -1, str: data['title'], layout: 'back_title'
  text range: 0..nf, str: data['description'], layout: 'description'
  # or png
  #png file: data['icon'].map { |n| "icons/#{n}.png" }, layout: 'art'
  #png file: data['group'].map { |n| "icons/group-#{n.downcase}.png" }, layout: 'lower_right'
  #default image
  svg range: 0..nf, file: data['icon'].map { |n| (n.to_s == '' ? 'icons/default.svg' : "icons/#{n}.svg" ) }, layout: 'art'
  text range: 0..nf, str: data['icon'].map { |n| (n.to_s == '' ? '' : icon_credits[n] ) }, layout: 'art_credit' 
  svg range: 0..nf, file: data['group'].map { |n| (n.to_s == '' ? 'icons/default.svg' : "icons/group-#{n.downcase}.svg" ) }, layout: 'lower_right'
  text range: 0..nf, str: data['group'], layout: 'lower_left'
  
  save format: :png
  # moo trim is smaller than squib examples; A4 narrower than letter
  save_pdf file: 'output.pdf', trim: 23.5, height: 2200
  save_sheet count_format: '%d', rows: 3, columns: 5, prefix: 'Atlas_'
end
