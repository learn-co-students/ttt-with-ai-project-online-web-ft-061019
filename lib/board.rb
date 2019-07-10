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
end
