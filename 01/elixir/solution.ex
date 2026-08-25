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
    calc = input |> Enum.reduce({0, 1, 0}, fn element, {acc, pos, found} ->
      new_acc = acc + if element == "(", do: 1, else: -1
      new_pos = pos + if new_acc == -1 and found == 0, do: 0, else: 1
      
      {new_acc, new_pos, (if found == 0 and new_acc == -1, do: new_pos, else: found)}
    end)

    IO.puts(elem(calc, 2))
  end
end  
