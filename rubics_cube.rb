require 'face'

class RubicsCube
    COLORS = %w(w b r o g y)
    
    attr_reader :cube
    
    def initialize
        @cube = []
        setup_cube!
        self
    end

	def twist_front_face_clock
		selected_face = self.cube[0]
		
		left = selected_face.get_down(0).dup
		top = selected_face.get_row(0).dup
		right = selected_face.get_down(2).dup
		bottom = selected_face.get_row(2).dup
		
		selected_face.fill_row(0, left)
		selected_face.fill_down(2, top)
		selected_face.fill_row(2, right.reverse)
		selected_face.fill_down(0, bottom)
		
		left_face = self.cube[1].get_down(2).dup
		top_face = self.cube[5].get_row(2).dup
		right_face = self.cube[2].get_down(0).dup 
		bottom_face = self.cube[4].get_row(0).dup
		self.cube[2].fill_down(0, top_face)
		self.cube[1].fill_down(2, bottom_face)
		self.cube[5].fill_row(2, left_face)
		self.cube[4].fill_row(0, right_face)
		self.cube
	end
	def coloring
		blue = %w(b o w r g y)
		white = %w(w b r o g y)
		red = %w(r w o b g y)
		orange = %w(o r b w g y)
		green = %w(g b r y o w )
		yellow = %w(y b r g w o)
	end
	def twist_front_face_counter
		twist_front_face_clock
		twist_front_face_clock
		twist_front_face_clock
	end
	def to_s
		buff = []
		buff << self.cube[5].to_s! + "5 \n"
		buff << self.cube[1].get_row(0).join(" ") +"  	   "+ self.cube[0].get_row(0).join(" ") +"     "+ self.cube[2].get_row(0).join(" ") + "\n"
		buff << self.cube[1].get_row(1).join(" ") +"  	   "+ self.cube[0].get_row(1).join(" ") +"     "+ self.cube[2].get_row(1).join(" ") + "\n"
		buff << self.cube[1].get_row(2).join(" ") +"1	   "+ self.cube[0].get_row(2).join(" ") +"0    "+ self.cube[2].get_row(2).join(" ") + " 2\n\n"
		buff << self.cube[4].to_s! + "4 \n"
		buff << self.cube[3].to_s! + "3 \n"
		return buff.join		
	end
	def turn_cube(front)
		front.times {self.cube << self.cube.shift}
	end
	
	def shuffle_cube
		100.times do |hi|
			face = rand(5)
			turn_cube(face) 
			twist_front_face_clock
			turn_cube(6-face )
		end
	end
	
	def comapre_cube(cubes)
        6.times do |face|
            3.times do |row|
                3.times do |down|
                    if (self.cube[face].get_color(row,down).eql? cubes.cube[face].get_color(row,down))
					else
						return false
					end
                end                            
            end
        end   
        return true		
	end
    private

    def setup_cube!
        6.times {self.cube << Face.new }        
        6.times do |face|
            coloring = COLORS[face]
            3.times do |row|
                3.times do |down|
                    self.cube[face].fill_color(row,down,coloring)
                end                            
            end
        end   
        return self.cube
    end
	
	def turn_clock(the_face)
		selected_face = self.cube[the_face]
		
		left, top = selected_face.get_face_collection(0)
		right, bottom = selected_face.get_face_collection(2)
		
		selected_face.fill_row(0, left)
		selected_face.fill_down(0, bottom)

		selected_face.fill_row(2, right)
		selected_face.fill_down(2, top)
	end
	
	def turn_counter()
		selected_face = self.cube[the_face]
		
		left, top = selected_face.get_face_collection(0)
		right, bottom = selected_face.get_face_collection(2)
		
		selected_face.fill_row(2, left)
		selected_face.fill_down(2, bottom)

		selected_face.fill_row(0, right)
		selected_face.fill_down(0, top)
	end

end


rubics_cube = RubicsCube.new
#rubics_cube.shuffle_cube
the_cube = RubicsCube.new
#rubics_cube.comapre_cube(the_cube)
#rubics_cube.turn_cube(1)
#puts rubics_cube.to_s
while !(false)
	puts rubics_cube.to_s
	puts "select number face"
	face = gets.strip()
	puts "1 for clock /n 2 for counter"
	rubics_cube.turn_cube(face.to_i)
	puts rubics_cube.to_s
	way = gets.strip()
	if (way.to_i == 1)
		rubics_cube.twist_front_face_clock
	else
		rubics_cube.twist_front_face_counter
		rubics_cube.turn_cube(1)
	end
	rubics_cube.turn_cube(6-face.to_i)
end
puts "you win the game"
