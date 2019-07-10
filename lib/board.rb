class Board
    attr_accessor :cells
    def initialize(cells = nil)
         @cells ||= Array.new(9, " ")
    end

    def cell
        @cells
    end
end