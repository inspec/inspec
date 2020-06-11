module Term
  module ANSIColor
    class Attribute
      class IntenseColor8
        # High intensity, aixterm (works in OS X)
        Attribute.set :intense_black,   90
        Attribute.set :bright_black,    90
        Attribute.set :intense_red,     91
        Attribute.set :bright_red,      91
        Attribute.set :intense_green,   92
        Attribute.set :bright_green,    92
        Attribute.set :intense_yellow,  93
        Attribute.set :bright_yellow,   93
        Attribute.set :intense_blue,    94
        Attribute.set :bright_blue,     94
        Attribute.set :intense_magenta, 95
        Attribute.set :bright_magenta,  95
        Attribute.set :intense_cyan,    96
        Attribute.set :bright_cyan,     96
        Attribute.set :intense_white,   97
        Attribute.set :bright_white,    97

        # High intensity background,  aixterm (works in OS X)
        Attribute.set :on_intense_black,   100
        Attribute.set :on_bright_black,    100
        Attribute.set :on_intense_red,     101
        Attribute.set :on_bright_red,      101
        Attribute.set :on_intense_green,   102
        Attribute.set :on_bright_green,    102
        Attribute.set :on_intense_yellow,  103
        Attribute.set :on_bright_yellow,   103
        Attribute.set :on_intense_blue,    104
        Attribute.set :on_bright_blue,     104
        Attribute.set :on_intense_magenta, 105
        Attribute.set :on_bright_magenta,  105
        Attribute.set :on_intense_cyan,    106
        Attribute.set :on_bright_cyan,     106
        Attribute.set :on_intense_white,   107
        Attribute.set :on_bright_white,    107
      end
    end
  end
end
