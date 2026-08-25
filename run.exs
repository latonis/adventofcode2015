defmodule Runner do
  def main do
    {parsed, _remaining, _invalid} = System.argv() |> OptionParser.parse(
      strict: [day: :string, test: :boolean, part_two: :boolean]
    )

    day = Keyword.get(parsed, :day)
    test = Keyword.get(parsed, :test, false)
    part_two = Keyword.get(parsed, :part_two, false)
    
    IO.puts("Running day #{day} (test: #{test})")

    test_input = if test, do: "test-input", else: "input"
    
    working_dir = "./#{day}"

    input_file = "#{working_dir}/#{test_input}"
    solution_file = "#{working_dir}/elixir/solution.ex"

    IO.puts("Running #{solution_file} with #{input_file}")

    if File.exists?(solution_file) do
      Code.require_file(solution_file)

      module_name = Module.concat(["Day#{day}"])

      apply(module_name, :solve, [input_file, part_two])
    else
      IO.puts("File not found: #{solution_file}")
    end
  end
end  

Runner.main()
