defmodule Day01 do
  def solve(file_path, part_two) do
    
    file_contents = file_path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
    |> List.first()
    |> String.graphemes()

    p1(file_contents)

    if part_two do
      p2(file_contents)
    end    
  end

  def p1(input) do
    calc = input |> Enum.reduce(0, fn element, acc ->
      acc + if element == "(", do: 1, else: -1
    end)

    IO.puts(calc)
  end

  def p2(input) do
    IO.puts("reached part 2")

    input |> IO.puts()
  end
end  
