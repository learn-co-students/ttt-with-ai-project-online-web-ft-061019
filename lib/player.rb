class Player
    attr_reader :token
    def initialize(token)
        @token = token
    end

    def move(obj)
        puts "Enter a move 1-9"
        self.kind_of?(Players::Human) ? gets.chomp : [*1..9].sample.to_s
    end
end
