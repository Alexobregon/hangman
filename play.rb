class Hangman

    def initialize
        @letters = ('a'..'z').to_a
        @word = word.sample
    end

    def word 
    [
        ["cricket", "A game played by gentalmen"],
        ["jogging", "We are not walking"],
        ["celabrate", "Remembering special moments"],
        ["continent", "There are 7 pf these"],
        ["exotic", "Not from around here"],
    ]


    end
    
    def begin
        
        puts "new game started... your clue is #{ @word.first }"
        guess = gets.chomp
        
        puts " you guessed #{guess}"
    end

end

game = Hangman.new
game.begin