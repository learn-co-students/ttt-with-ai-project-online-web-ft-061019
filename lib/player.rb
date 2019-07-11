class Player
    attr_reader :token
    def initialize(token)
        @token = token
    end

    def move(obj)
        puts "Enter a move 1-9"
        gets.chomp
    end
end
