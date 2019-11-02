class Board
    attr_accessor :cells

    def initialize
       self.reset!
    end

    def reset!
       self.cells = Array.new(9, " ")
    end
 
    def display
       puts <<~BOARD
        #{self.cells[TLC]} | #{self.cells[TS]} | #{self.cells[TRC]} 
       -----------
        #{self.cells[MLS]} | #{self.cells[MC]} | #{self.cells[MRS]} 
       -----------
        #{self.cells[BLC]} | #{self.cells[BS]} | #{self.cells[BRC]} 
       BOARD
    end

    def position(user_input)
       self.cells[convert_to_arr_index(user_input)]
    end
 
    def full? 
       full_test = self.cells.all? {|cell| cell == "X" || cell == "O"}
    end

    def turn_count
       self.cells.count {|cell| cell == "X" || cell == "O"}
    end

    def convert_to_arr_index(position_number)
       position_number.to_i - 1
    end

    def taken?(position_number)
       position_to_check = self.cells[convert_to_arr_index(position_number)]
       
       position_to_check == "X" || position_to_check == "O"
    end
 
    def taken_by?(position_number)
       position_to_check = self.cells[convert_to_arr_index(position_number)]
       
       if position_to_check == "X" 
          "X"
       elsif position_to_check == "O"
          "O"
       else
          nil 
       end
    end

    def valid_move?(position_number)
       valid_input_range = 0..8
       indexed_input = convert_to_arr_index(position_number)

       valid_input_range.include?(indexed_input) && !self.taken?(position_number)
    end

    def update(position_number, player_obj)
       self.cells[convert_to_arr_index(position_number)] = player_obj.token
    end
 
    
 
 end