class Game
    attr_accessor :board, :player_1, :player_2, :players, :winning_player

    def initialize(player_1_obj = Player::Human.new("X"), player_2_obj = Player::Human.new("O"), board_obj = Board.new)
       self.players = []
       self.player_1 = player_1_obj
       self.players << self.player_1
       self.player_2 = player_2_obj
       self.players << self.player_2
       self.board = board_obj
       
       if computer = self.players.find {|player| player.class == Computer}
          if computer.token == player_1.token
             computer.player_number = 1
          elsif computer.token == player_2.token
             computer.player_number = 2
          end
       end
       self.current_player = player_1
       self.turn
    end
 
    def current_player
       player_1_turns = self.board.cells.count(player_1.token)
       player_2_turns = self.board.cells.count(player_2.token)
 
       if player_1_turns == player_2_turns
          player_1
       else
          player_2
       end
    end
 
    def current_player=(player_obj)
       @current_player = player_obj
    end
    def won?
       win_match_found = false

       WIN_COMBINATIONS.map do |combo_arr|
          check = self.board.cells.values_at(combo_arr[0], combo_arr[1], combo_arr[2]).join
 
          if check == "XXX"
             self.winning_player = self.players.find {|player| player.token == "X"}
             win_match_found = combo_arr
          elsif check == "OOO"
             self.winning_player = self.players.find {|player| player.token == "O"}
             win_match_found = combo_arr
          end
       end
       win_match_found
    end
 
    def winner
       if self.won?
          self.winning_player.token
       else
          nil
       end
    end
 
    def draw?
       self.won? == false && self.board.full?
    end
    
    def over?
       self.won? || self.draw?
    end
 
    def turn
       self.board.display
       puts "Type in the numeric value of the cell you'd like to play in."
       player_move = self.current_player.move(self.board)
       indexed_move = self.board.convert_to_arr_index(player_move)
       move_is_valid = nil
       until move_is_valid
          move_is_valid = self.board.valid_move?(player_move)
             
          if move_is_valid
             self.board.update(player_move, self.current_player)
             if self.current_player == player_1
                self.current_player = player_2
             else
                self.current_player = player_1
             end
          else
             player_move = self.current_player.move(board)
          end
       end
    end
 
    def play 
       is_over = self.over?
       until is_over
          self.turn
          is_over = self.over?
       end
 
       if self.winner
          puts "Congratulations #{self.winner}!"
       else
          puts "Cat's Game!"
       end
 
    end
 
 
 
 end