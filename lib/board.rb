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
end