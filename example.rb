require 'ucl_last_16_draw'

winners = [
  {group: "A", name: "Napoli", country: "Italy"},
  {group: "B", name: "Porto", country: "Portugal"},
  {group: "C", name: "Bayern Munich", country: "Germany"},
  {group: "D", name: "Tottenham Hotspur", country: "England"},
  {group: "E", name: "Chelsea", country: "England"},
  {group: "F", name: "Real Madrid", country: "Spain"},
  {group: "G", name: "Manchester City", country: "England"},
  {group: "H", name: "Benfica", country: "Portugal"},
]

runners_up = [
  {group: "A", name: "Liverpool", country: "England"},
  {group: "B", name: "Club Brugge", country: "Belgium"},
  {group: "C", name: "Inter Milan", country: "Italy"},
  {group: "D", name: "Eintracht Frankfurt", country: "Germany"},
  {group: "E", name: "AC Milan", country: "Italy"},
  {group: "F", name: "RB Leipzig", country: "Germany"},
  {group: "G", name: "Borussia Dortmund", country: "Germany"},
  {"group" => "H", name: "Paris Saint-Germain", country: "France"}
]

result = UCLLast16Draw::Participants.new({winners: winners, runners_up: runners_up})
# result = UCLLast16Draw::Participants.new(winners: winners)

# if you need value only, without any formatting
teams = result.generate_draw

puts teams.to_s # showing pure value 

# simple beutify output
puts result.print_draw
