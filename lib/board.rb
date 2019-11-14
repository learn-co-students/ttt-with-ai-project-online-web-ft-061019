class Board
    attr_accessor :cells
    def initialize()
        @cells = Array.new(9, " ")
    end

    def cell
        @cells
    end

    def fix_board(board)
        # Add empty cells
        9.times do
            board << " "
        end
    end

    def reset!
        # Reset cells
        cell.clear
        fix_board(cell)
    end

    def display
        # prints the board
        puts " #{cell[0]} | #{cell[1]} | #{cell[2]} "
        puts "-----------"
        puts " #{cell[3]} | #{cell[4]} | #{cell[5]} "
        puts "-----------"
        puts " #{cell[6]} | #{cell[7]} | #{cell[8]} "
    end

    def position(index)
        # takes in user input and returns the value of the board cell
        cell[index.to_i - 1]
    end

    def full?
        # returns true for a full board
        # returns false for an in-progress game
        cell.all? {|content| content != " "}
    end

    def turn_count
        # returns the amount of turns based on cell value
        cell.count {|token| token == "X" || token == "O"}
    end

    def taken?(index)
        #  returns true if the position is "X" or "O"
        cell[index.to_i - 1] == "O" || cell[index.to_i - 1] == "X"
    end

    def valid_move?(position)
        # returns true for user input between 1-9 that is not taken
        if (position.to_i >= 1 && position.to_i <= cell.length)
            taken?(position.to_i) ? false : true
        else
            false
        end
    end

    def update(user_input, player)
        # updates the cells in the board with the player token according to the input
        cell[user_input.to_i - 1] = player.token
    end

end
