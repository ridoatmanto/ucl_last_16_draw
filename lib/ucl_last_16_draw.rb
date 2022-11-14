module UCLLast16Draw
  class Participants
    def initialize(participants = {})
      check_participants(participants)

      @group_winners = participants[:winners] || []
      @runners_up    = participants[:runners_up] || []

      check_hash_key
      check_participants_number

      @draw_header_label   = "UEFA Champions League Sample Draw (last 16 Round)"
      @draw_header_width   = 90
      @max_center_position = 40
      @draw_result         = []
    end

    def generate_draw
      winners    = @group_winners.clone
      loop_count = 0
      
      while @draw_result.empty?
        loop_count += 1

        if loop_count > 22 # rude assusmtion number too many attempt for creating a draw.
          abort("Please check your participants! It doesn't seem possible.")
        end

        available_runner_up = @runners_up.clone

        winners.shuffle.each do |item|
          candidate = opponent_candidate(available_runner_up, item).sample
          
          if candidate.nil?
            @draw_result = []
            break
          end

          @draw_result.push([item, candidate])
          available_runner_up.delete(candidate)
        end
      end

      @draw_result
    end

    def print_draw
      abort("Please doing 'generate_draw' first!") if @draw_result.empty?

      format_output(@draw_result)
    end

    private

    def check_participants(participants)
      abort("Please fill group winners.") unless participants.key?(:winners)
      abort("Please fill group runners up.") unless participants.key?(:runners_up)
    end

    def check_participants_number
      abort("Group winners number must be 8 teams.") unless @group_winners.length == 8
      abort("Runners up number must be 8 teams.") unless @runners_up.length == 8
    end

    def check_hash_key
      keys     = [:group, :name, :country]
      all_team = convert_string_key_into_symbol(@group_winners + @runners_up)
      result   = all_team.select { |x| x.keys.sort != keys.sort }
      
      abort("Every team must have 'group', 'name', and 'country' value.") if result.length > 0
    end

    def opponent_candidate(participants, candidate)
      participants.select{ |x| x[:country] != candidate[:country] && x[:group] != candidate[:group]}
    end

    def header(title, area_width)
      header = "\n\t" + title.center(area_width)
      header += "\n\t" + ("_" * area_width).center(area_width) + "\n\n"
      
      header
    end

    def format_output(draw)
      text = header(@draw_header_label, @draw_header_width)

      draw.each do |x|
        winner      = x.first
        runner_up   = x.last
        winner_text = "#{winner[:name]} (#{winner[:country]})/Group #{winner[:group]}"
        
        text += "\t".ljust(@max_center_position-winner_text.length) + winner_text
        text += "  vs  "
        text += "#{runner_up[:name]} (#{runner_up[:country]})/Group #{runner_up[:group]}\n\n"
      end

      text
    end

    def convert_string_key_into_symbol(previous_hash)
      new_array = Array.new

      previous_hash.each do |item|
        new_hash = Hash.new
        item.each { |k, v| new_hash[k.to_sym] = v }
        new_array.push(new_hash)
      end

      new_array
    end
  end
end
