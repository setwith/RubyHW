class Pet
  attr_accessor :name


  def initialize(name)
    @name = name
    @health = 10
    @happyness = 10
    @stuff_in_belly = 10
    @asllep = false
    @workout = 10
    @energy = 10

    puts "Хей, мене звати #{@name}, і тепер я планую любити тебе та проводити багато часу разом. Давай пошвидше знайдемо заняття для нас!)"
  end

  def feed
    puts "Ви годуєте #{@name}. Йой, так їсть, аж за вухами лящить."
    @stuff_in_belly = 10
    @energy += 1
    passageOfTime
  end

  def walk
    puts "Хороша ідея була прогулятись. #{@name} махає своїм хвостом та обнюхує кожного зустрічного :)"
    @happyness += 4 
    @energy -= 1
    @stuff_in_belly -= 1
    passageOfTime
  end
  
  #todo обмежити дії, якщо спить
  def put_to_bed
    puts "І все ж таки, який гарний #{@name}, коли спить... І мовчить :D" 
    @asllep = true
    @energy = 10
    @health += 2
    passageOfTime
    puts "#{@name} солодко хропить"
    3.times do 
      puts 'Hzz..'
      end
    puts "#{@name} повільно прокидається"
    @asllep = false
  end
  
  # def wake_up
  #   if @asllep = true
  #     puts "#{@name} прокидається"
  #     @asllep = false
  #     passageOfTime
  #   else
  #     puts "Хазяїн, ну ти чо? Я ж не сплю ;)"
  #   end
  # end
  
  def toss
    puts "Ти підкидаєш #{@name} в повітря. Його улюблене дозвілля, звісно, не враховуючи коли ти йому чухаєш спинку"
    @happyness += 2
    passageOfTime
  end
  

end
