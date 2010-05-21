$deck = [0,4,4,4,4,4,4,4,4,4,16]
$dealscore = 0
def end_game
    if($happy > 21 or $dealscore > $happy )  
        puts "You loose the game"
        puts "Dealer had " + $dealscore.to_s
        exit
    elsif ($happy == 21)
        puts "Blackjack!"
        exit
    else 
        puts "you win the game"
        puts "Dealer had " + $dealscore.to_s
        exit
    end
end

def dealend_game
    if($dealscore > 21)  
        puts "Dealer loose the game!"
        exit
    elsif ($dealscore == 21)
        puts "Dealer Blackjack!"
        exit
    end
end
def options 
    puts "enter 1 for hit" 
    puts "enter 2 for stand"
end

def get_card
    while
    number = 1 + rand(10)
        if $deck[number] > 0
            $deck[number] = $deck[number] - 1
            return number
        end 
    end
end
def dealer
    card1 = get_card
    puts "Dealer has a " + if11d(card1).to_s
    $dealscore += if11d(card1)
    card1 = get_card
    puts "Dealer has a face down card "
    $dealscore += if11d(card1)
    while($dealscore < 15)
        card2 = get_card
        $dealscore += if11d(card2)
        puts "Dealer has a " + if11d(card2).to_s + " face up"
    end
    if ($dealscore >= 21)
         dealend_game
    end
end
def if11(a)
    if(($happy + 11 <= 21) and a == 1 )
        return 11 
    elsif (a == 1)
        return 1    
    end
    return a 
end
def if11d(a)
    if(($dealscore + 11 <= 21) and a == 1 )
        return 11
    elsif (a == 1)
        return 1    
    end
    return a 
end
dealer
$happy = 0
if ($happy == 0)
    cat = if11(get_card)
    puts "you get a " + cat.to_s
    $happy += cat
    b = if11(get_card)
    puts "you get a " + b.to_s
    $happy += if11(b)
end
while($happy < 21) 
    options
    choice = gets
    puts "your current totoal is " + $happy.to_s
    if (choice.to_i == 1)
        a = if11(get_card)
        puts "you are dealt a " + a.to_s
        $happy += a
    else
        end_game
    end
    
end
end_game

