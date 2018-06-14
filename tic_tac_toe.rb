class Game
    def initialize(player1_name, player1_team, player2_name, player2_team, board)
        @player1 = Player.new(player1_name, player1_team)
        @player2 = Player.new(player2_name, player2_team)
        @board = board
        @winner = false
        @current_player = @player1
        @loser_count = 0
    end
    
    def start_game
        desplay_player_info
        make_board(@board)
        ask_player_turn_move(@current_player)
    end
    
    private

    def move(x,y,choice,current_player)
        puts @board[x][y] == "X" || @board[x][y] == "O"
        if @board[x][y] == "X" || @board[x][y] == "O"
            puts "Something is alreay located there #{current_player.name}"
            ask_player_turn_move(current_player)
        else
            @board[x][y] = choice
            @board_move = @board
        end
    end
    def ask_player_turn_move(player)
        while(@winner == false)
            if player == @player1
                puts "#{@player1.name} please make a move using a cordinate system"
                puts "Please pick a column :"
                column = gets.chomp.to_i
                puts "Please pick a row :"
                row = gets.chomp.to_i
                move(row,column, player.team,player)
                has_winner?(@board_move, player)
                player = @player2
            else player == @player2
                puts "#{@player2.name} please make a move using a cordinate system"
                puts "Please pick a column :"
                column = gets.chomp.to_i
                puts "Please pick a row :"
                row = gets.chomp.to_i
                move(row,column, player.team,player)
                has_winner?(@board_move,player)
                player = @player1
            end
            break if @loser_count == 9
        end
    end
    def desplay_player_info
        puts "Player1 : #{@player1.name}, Team : #{@player1.team}'s"
        puts "Player2 : #{@player2.name}, Team : #{@player2.team}'s"
    end
    def make_board(board)
        space = " "
        puts space
        puts "     col0  col1  col2"
        board.each_index do |i|
            print "Row#{i} #{board[i]} \n" 
        end
        puts space
    end
    def has_winner?(possible_winner_board,player)
        make_board(possible_winner_board)
        #check for winner

        possible_winner1 = (possible_winner_board[0][0] == "X" && possible_winner_board[1][0] == "X" && possible_winner_board[2][0] == "X") || (possible_winner_board[0][0] == "O" && possible_winner_board[1][0] == "O" && possible_winner_board[2][0] == "O")
        possible_winner2 = (possible_winner_board[0][1] == "X" && possible_winner_board[1][1] == "X" && possible_winner_board[2][1] == "X") || (possible_winner_board[0][1] == "O" && possible_winner_board[1][1] == "O" && possible_winner_board[2][1] == "O")
        possible_winner3 = (possible_winner_board[0][2] == "X" && possible_winner_board[1][2] == "X" && possible_winner_board[2][2] == "X") || (possible_winner_board[0][2] == "O" && possible_winner_board[1][2] == "O" && possible_winner_board[2][2] == "O")
        possible_winner4 = (possible_winner_board[0][0] == "X" && possible_winner_board[0][1] == "X" && possible_winner_board[0][2] == "X") || (possible_winner_board[0][0] == "O" && possible_winner_board[0][1] == "O" && possible_winner_board[0][2] == "O")
        possible_winner5 = (possible_winner_board[1][0] == "X" && possible_winner_board[1][1] == "X" && possible_winner_board[1][2] == "X") || (possible_winner_board[1][0] == "O" && possible_winner_board[1][1] == "O" && possible_winner_board[1][2] == "O")
        possible_winner6 = (possible_winner_board[2][0] == "X" && possible_winner_board[2][1] == "X" && possible_winner_board[2][2] == "X") || (possible_winner_board[2][0] == "O" && possible_winner_board[2][1] == "O" && possible_winner_board[2][2] == "O")
        possible_winner7 = (possible_winner_board[0][0] == "X" && possible_winner_board[1][1] == "X" && possible_winner_board[2][2] == "X") || (possible_winner_board[0][0] == "O" && possible_winner_board[1][1] == "O" && possible_winner_board[2][2] == "O")
        possible_winner8 = (possible_winner_board[0][2] == "X" && possible_winner_board[1][1] == "X" && possible_winner_board[2][0] == "X") || (possible_winner_board[0][2] == "O" && possible_winner_board[1][1] == "O" && possible_winner_board[2][0] == "O")
        
        if possible_winner1
            display_winner(player)
            @winner = true
        elsif possible_winner2
            display_winner(player)
            @winner = true
        elsif possible_winner3
            display_winner(player)
            @winner = true
        elsif possible_winner4
            display_winner(player)
            @winner = true
        elsif possible_winner5
            display_winner(player)
            @winner = true
        elsif possible_winner6
            display_winner(player)
            @winner = true
        elsif possible_winner7
            display_winner(player)
            @winner = true
        elsif possible_winner8
            display_winner(player)
            @winner = true
        elsif !possible_winner1 && !possible_winner2 && !possible_winner3 && !possible_winner4 && !possible_winner5 && !possible_winner6 && !possible_winner7 && !possible_winner8
            @winner = false
            @loser_count += 1
        else
            @winner = false
            @loser_count += 1
        end
    end
    def display_winner(player)
        4.times do
            new_line = "\n"
            puts "#{player.name} you won congrats!!!!!"
            puts new_line
        end
    end
end

class Player
    attr_accessor :name, :team
    def initialize(name, team)
        @name = name
        @team = team
    end
end

class Game_config
    def initialize
        @board = [["_","_","_"],["_","_","_"],["_","_","_"]]
        puts "Player 1 what is your name? : "
        @player1_name = gets.chomp.capitalize
        puts "Player 1 pick a team : "
        @player1_team = gets.chomp.upcase
        puts "Player 2 what is your name? : "
        @player2_name = gets.chomp.capitalize
        puts "Player 2 pick a team : "
        @player2_team = gets.chomp.upcase
        if (@player1_team != "X" && @player1_team != "O") || (@player2_team != "X" && @player2_team != "O")
            initialize
        else
            tic_tac_toe = Game.new(@player1_name, @player1_team, @player2_name, @player2_team, @board)
            tic_tac_toe.start_game
        end
    end
end




tic_tac_toe = Game_config.new