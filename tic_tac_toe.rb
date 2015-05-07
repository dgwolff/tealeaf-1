# Tic, Tac, Toe

def initialise_board
  b = {}
  (1..9).each { |position| b[position] = '' }
  b
end

def empty_positions(board)
  board.keys.select { |position| board[position] == ' ' }
end

def player_picks_square(board)
  puts 'Pick a square (1 - 9):'
  position = gets.chomp.to_i
  board[position] = 'X'
end

def computer_picks_square(board)
  position = empty_positions(board).sample
  board[position] = 'O'
end

def check_winner(board)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8],
                   [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |line|
    if board[line[0]] == 'X' && board[line[1]] == 'X' && board[line[2]] == 'X'
      return 'Player'
    elsif board[line[0]] == 'O' && board[line[1]] == 'O' && board[line[2]] == 'O'
      return 'computer'
    else
      return nil
    end
  end
end

def nine_positions_are_filled?(board)
  empty_positions(board) == []
end

def announce_winner(winner)
  puts "#{winner} won!"
end

def draw_board(board)
  system 'clear'
  puts
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts
end

board = initialise_board
draw_board(board)
begin
  player_picks_square(board)
  draw_board(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || nine_positions_are_filled?(board)
if winner
  announce_winner(winner)
else
  puts "It's a tie!"
end
