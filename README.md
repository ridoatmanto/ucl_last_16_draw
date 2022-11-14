# ucl_last_16_draw
Doing UEFA Champions League last 16 draw with ruby gem

### Preparing gem
Build this gem
```
gem build ucl_last_16_draw.gemspec
```

Then install build output with
```
gem install ucl_last_16_draw-0.0.0.gem
```

or

You can install it from https://rubygems.org.
Run command `gem install ucl_last_16_draw`

## Prepare your winners and runners up teams
Let's say we have two group of teams like below
```
winners_list = [
  {group: "A", name: "Napoli", country: "Italy"},
  {group: "B", name: "Porto", country: "Portugal"},
  {group: "C", name: "Bayern Munich", country: "Germany"},
  {group: "D", name: "Tottenham Hotspur", country: "England"},
  {group: "E", name: "Chelsea", country: "England"},
  {group: "F", name: "Real Madrid", country: "Spain"},
  {group: "G", name: "Manchester City", country: "England"},
  {group: "H", name: "Benfica", country: "Portugal"},
]

runners_up_list = [
  {group: "A", name: "Liverpool", country: "England"},
  {group: "B", name: "Club Brugge", country: "Belgium"},
  {group: "C", name: "Inter Milan", country: "Italy"},
  {group: "D", name: "Eintracht Frankfurt", country: "Germany"},
  {group: "E", name: "AC Milan", country: "Italy"},
  {group: "F", name: "RB Leipzig", country: "Germany"},
  {group: "G", name: "Borussia Dortmund", country: "Germany"},
  {"group" => "H", name: "Paris Saint-Germain", country: "France"} # you can use String key instead of symbol
]
```

## Embed `ucl_last_16_draw` gem to use its feature.
```
require 'ucl_last_16_draw'

result = UCLLast16Draw::Participants.new({winners: winners_list, runners_up: runners_up_list})

# if you need value only, without any formatting
teams = result.generate_draw
```
`teams` output has randomized with pure value. So, if you want to format it by yours will be no problem.
```
[
  [
    {:group=>"F", :name=>"Real Madrid", :country=>"Spain"},
    {:group=>"E", :name=>"AC Milan", :country=>"Italy"}
  ],
  [
    {:group=>"G", :name=>"Manchester City", :country=>"England"},
    {"group"=>"H", :name=>"Paris Saint-Germain", :country=>"France"}
  ],
  [
    {:group=>"A", :name=>"Napoli", :country=>"Italy"},
    {:group=>"B", :name=>"Club Brugge", :country=>"Belgium"}
  ],
  [
    {:group=>"H", :name=>"Benfica", :country=>"Portugal"},
    {:group=>"C", :name=>"Inter Milan", :country=>"Italy"}
  ],
  [
    {:group=>"C", :name=>"Bayern Munich", :country=>"Germany"},
    {:group=>"A", :name=>"Liverpool", :country=>"England"}
  ],
  [
    {:group=>"D", :name=>"Tottenham Hotspur", :country=>"England"},
    {:group=>"F", :name=>"RB Leipzig", :country=>"Germany"}
  ],
  [
    {:group=>"B", :name=>"Porto", :country=>"Portugal"},
    {:group=>"D", :name=>"Eintracht Frankfurt", :country=>"Germany"}
  ],
  [
    {:group=>"E", :name=>"Chelsea", :country=>"England"},
    {:group=>"G", :name=>"Borussia Dortmund", :country=>"Germany"}
  ]
]
```

## Making readable output
```# simple beutify output
puts result.print_draw
```
Beautify Output with simple built in format :
```
                            UEFA Champions League Sample Draw (last 16 Round)
        __________________________________________________________________________________________

                    Real Madrid (Spain)/Group F  vs  AC Milan (Italy)/Group E

              Manchester City (England)/Group G  vs  Paris Saint-Germain (France)/Group

                         Napoli (Italy)/Group A  vs  Club Brugge (Belgium)/Group B

                     Benfica (Portugal)/Group H  vs  Inter Milan (Italy)/Group C

                Bayern Munich (Germany)/Group C  vs  Liverpool (England)/Group A

            Tottenham Hotspur (England)/Group D  vs  RB Leipzig (Germany)/Group F

                       Porto (Portugal)/Group B  vs  Eintracht Frankfurt (Germany)/Group D

                      Chelsea (England)/Group E  vs  Borussia Dortmund (Germany)/Group G
```
***
If you still confused, please run `~ruby example.rb` in your machine after install this gem.

Enjoy it!

**Rido Atmanto**

*Created: November 14th 2022*
