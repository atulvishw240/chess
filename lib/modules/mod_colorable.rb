# Contains all colors and Markers used throughout the game
module Colorable
  RESET_TERMINAL = "\e[0m".freeze

  # Foreground
  DARK_YELLOW_FOREGROUND = "\e[1;33m".freeze
  BLACK_FOREGROUND = "\e[30m".freeze
  BROWN_FOREGROUND = "\e[38;5;160m".freeze

  # Background
  WHITE_BACKGROUND = "\e[47m".freeze
  CYAN_BACKGROUND = "\e[48;5;45m".freeze
  PURPLE_BACKGROUND = "\e[48;5;141m".freeze

  # Marker
  MARKER = "\e[90m\u{25CF}".freeze
end
