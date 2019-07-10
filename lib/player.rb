class Player
    attr_reader :token
    def initialize(token)
        @token = token
    end

    def move(obj)
        # Each player's move
        puts "Please a move"
        gets.chomp
    end
end