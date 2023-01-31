class Hangman

    def initialize
        @letters = ('a'..'z').to_a
        @word = word.sample
        @lives = 7
        @correct_guesses = []
        @word_teaser = ""

        @word.first.size.times do
            @word_teaser += "_ "
            end
    end

    def word 
    [
        ["cricket", "A game played by gentalmen"],
        ["jogging", "We are not walking"],
        ["celabrate", "Remembering special moments"],
        ["continent", "There are 7 of these"],
        ["exotic", "Not from around here"],
    ]
    end

    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

    def update_teaser last_guess
        new_teaser = @word_teaser.split
        new_teaser.each_with_index do|letter, index|
        if letter = '_' && @word.first[index] == last_guess
            new_teaser[index] = last_guess
        end
    end
    @word_teaser = new_teaser.join(' ')
    end


    def make_guess 
        if @lives > 0
        puts "enter a letter"
        guess = gets.chomp
        good_guess = @word.first.include? guess
        if guess == "exit"
        puts "Thank you for playing"

        elsif guess == @word.first
            puts "Correctly guessed Word!, you Win!"

        elsif guess.length > 1
        puts "only guess 1 letter at a time please!"
          make_guess

        elsif good_guess
        puts "You currectly guess a letter!"

        print_teaser guess

        if @word.first == @word_teaser.split.join
            puts "Congratulations, you win!"
        else
        make_guess
        end

        else
        puts "Bad Guess!"
        @lives -= 1
        puts "Sorry... you have #{ @lives } lives left. Please try again"
        make_guess
        end
    
        else
         puts "Game over!"
        end 

        end
    
    def begin
        
        puts "new game started... your clue is #{ @word.first.size } characters long"
        puts "To exit game at any point type 'exit'"
        print_teaser
        puts "Clue: #{ @word.last }"
        make_guess
    end

end

game = Hangman.new
game.begin