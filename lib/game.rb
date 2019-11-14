class Game
    # defines a constant WIN_COMBINATIONS with arrays for each win combination
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],]
    attr_accessor :board, :player_1, :player_2, :winning_player
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new())
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        # Returns current player object
        self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
    end

    def won?
        # Returns nil if there is no winner
        # Returns combo the winning combo if there is a winner
        WIN_COMBINATIONS.detect do |combo|
        if (self.board.cells[combo[0]]) == "X" && (self.board.cells[combo[1]]) == "X" && (self.board.cells[combo[2]]) == "X"
            # Store the winner
            self.winning_player = "X"
            return combo
        elsif (self.board.cells[combo[0]]) == "O" && (self.board.cells[combo[1]]) == "O" && (self.board.cells[combo[2]]) == "O"
            # Store the winner
            self.winning_player = "O"
            return combo
        end
            false
        end
    end

    def draw?
        # returns true for a draw
        # returns false for a won game
        # returns false for an in-progress game
        !(won?) && (self.board.full?)
    end

    def over?
        # returns true for a draw
        # returns true for a won game
        # returns false for an in-progress game
        won? || self.board.full? || draw?
    end

    def winner
        # Returns the winnner
        won?
        self.winning_player
    end

    def turn
        get_input = true
        while get_input
            user_move = current_player.move(self.board).to_i
            if self.board.valid_move?(user_move)
                self.board.update(user_move, current_player)
                self.board.display
                get_input = false
            else
                puts "Move is not valid"
            end
        end
    end

    def play
        while over? == false
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

end
