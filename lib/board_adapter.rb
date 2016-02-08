require 'board'
require 'player_symbols'

class BoardAdapter

  def translate(grid_representation = '[0, 1, 2, 3, 4, 5, 6, 7, 8]')
    grid = strip_to_grid_contents(grid_representation).map do |cell_value|
      to_nil?(cell_value) ? nil : PlayerSymbols::to_symbol(cell_value)
    end

    Board.new(grid)
  end

  private

  def strip_to_grid_contents(grid_representation)
    grid_representation.delete(":").delete("[").delete("]").delete(" ").split(",")
  end

  def to_nil?(cell_value)
    cell_value == "nil" || is_number(cell_value)
  end

  def is_number(value)
    begin
      Integer(value)
      true
    rescue ArgumentError
      false
    end
  end
end
