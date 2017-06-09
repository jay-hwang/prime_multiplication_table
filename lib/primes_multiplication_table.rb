require 'byebug'
require_relative 'prime'

class PrimesMultiplicationTable
  attr_reader :size, :table, :primes_table

  DEFAULT_SIZE = 10

  def initialize(size = DEFAULT_SIZE)
    @size = size
    @table = ""
    @primes_table = generate_primes_table
  end

  def render
    primes_table.each_with_index do |row, row_index|
      add_divider_row_to_table if row_index == 1
      add_row_to_table(row, row_index)
    end

    print table
    nil
  end

  private

    attr_writer :table

    def add_row_to_table(row, row_index)
      row.each_with_index do |cell, cell_index|
        table << add_cell_to_row(cell, row_index, cell_index)
        # Shovel empty string for space between cells to increase readability
        table << '  '
      end
      table << "\n"
    end

    # Adds dividing line below the first row
    def add_divider_row_to_table
      table << "     -"
      size.times { table << '-----' }
      table << "\n"
    end

    def add_cell_to_row(cell, row_index, cell_index)
      # This cell is the top left corner, so it's just an empty string
      cell = '      ' if row_index == 0 && cell_index == 0
      # Add padding to cell
      cell = cell.to_s.rjust(padding)
      # If it's the first cell in a row, add a divider
      cell = "#{cell}  |" if cell_index == 0 && row_index > 0
      cell
    end

    def padding
      @padding ||= (og_primes.last**2).to_s.length
      # When making tables smaller than size 5, the padding goes off. This line of code keeps all the numbers looking pretty.
      @padding >= 3 ? @padding : 3
    end

    def og_primes
      # The first N prime numbers, where N = @size
      @primes_row ||= [1] + Array(Prime.generate_n_primes(size))
    end

    # This is the bottleneck of the code. This method has a O(n2) runtime, where n = @size. Since there are many overlaps in multiplication tables, we could cache results to prevent from calculating the same equation multiple times.
    def generate_primes_table
      og_primes.map do |x|
        og_primes.map do |y|
          x * y
        end
      end
    end
end
