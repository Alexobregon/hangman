class Hangman

    def initialize
        @letters = ('a'..'z').to_a
        @word = word.sample
        @lives = 7
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

    def print_teaser
        word_teaser = ""
        @word.first.size.times do
            word_teaser += "_ "
            end
    
            puts word_teaser
    end

    def make_guess 
        if @lives > 0
        puts "enter a letter"
        guess = gets.chomp

       good_guess = @word.first.include? guess

       if good_guess
        puts "Good Guess!"
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
        print_teaser

        puts "Clue: #{ @word.last }"
        make_guess
    end

end

game = Hangman.new
game.begin