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
end