module Term
  module ANSIColor
    class Attribute
      class Color8
        Attribute.set :black,   30
        Attribute.set :red,     31
        Attribute.set :green,   32
        Attribute.set :yellow,  33
        Attribute.set :blue,    34
        Attribute.set :magenta, 35
        Attribute.set :cyan,    36
        Attribute.set :white,   37

        Attribute.set :on_black,   40
        Attribute.set :on_red,     41
        Attribute.set :on_green,   42
        Attribute.set :on_yellow,  43
        Attribute.set :on_blue,    44
        Attribute.set :on_magenta, 45
        Attribute.set :on_cyan,    46
        Attribute.set :on_white,   47
      end
    end
  end
end
