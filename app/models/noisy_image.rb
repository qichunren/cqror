
class NoisyImage
  
  include Magick
  attr_reader :code, :code_image
  Jiggle =8
  Wobble =5

  def initialize(len=4)
    chars =('1'..'8').to_a
    code_array=[]
    1.upto(len){code_array << chars[rand(chars.length)]}
    granite = Magick::ImageList.new('xc:#d0e3ea')
    canvas  = Magick::ImageList.new
    canvas.new_image(22*len, 32, Magick::TextureFill.new(granite))
    text = Magick::Draw.new
    #text.font_family=['times', 'sans', 'fixed', 'Verdana'].sort{rand}.pop
    text.pointsize = 25
    cur =0

    code_array.each { |c|

      text.annotate(canvas,0,1,cur,22,c){
#        self.rotation= 18
        self.font_weight = BoldWeight
        self.fill = '#676f72'
      }
      cur += 18
    }
    @code=code_array.to_s
    @code_image = canvas.to_blob{
      self.format="JPG"
    }
  end
end
