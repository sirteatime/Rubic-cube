class Face
	
    def initialize
        face_size = 2
        @top_colors = (0..2).to_a
        @center_colors = (0..2).to_a
        @bottom_colors = (0..2).to_a
        @whole_face = [@top_colors,@center_colors,@bottom_colors]
    end
	
	def get_face_collection(face_index)
		[get_row(face_index), get_down(face_index)]
	end
	
    def get_color(row,down)
        return @whole_face[row][down]         
    end
    def fill_color(row,down,color)
        @whole_face[row][down] = color
    end
    def get_row(num)
        return @whole_face[num]
    end
    def get_down(num)
        down_down = []
        @whole_face.count.times do |row|
             down_down.push(@whole_face[row][num])
        end
        return down_down
    end
    def fill_row(row,ray)
        @whole_face[row].count.times do |square|
             @whole_face[row][square] = ray[square]
        end
    end
    def fill_down(down,ray)
        @whole_face.each_index do |square|
            @whole_face[square][down] = ray[square]
        end
    end
	
	def to_s
		buff = []
		@whole_face.each do |face|
			buff << face.join(" ") + "\n"
		end
		return buff.join
	end
		def to_s!
		buff = []
		@whole_face.each do |face|
			buff <<  "           " + face.join(" ") + "\n"
		end
		return buff.join
	end
	
end
