defmodule Othello do
  def create_initial_board do
    # Create an 8x8 board initialized with empty spaces
    List.duplicate(List.duplicate(".", 8), 8)
    |> List.update_at(3, fn row -> List.update_at(row, 3, fn _ -> "W" end) end)
    |> List.update_at(3, fn row -> List.update_at(row, 4, fn _ -> "B" end) end)
    |> List.update_at(4, fn row -> List.update_at(row, 3, fn _ -> "B" end) end)
    |> List.update_at(4, fn row -> List.update_at(row, 4, fn _ -> "W" end) end)
  end

  def print_board(board) do
    Enum.each(board, fn row ->
      IO.puts(Enum.join(row, " "))
    end)
  end

  def valid_moves(board, player) do
    Enum.flat_map(0..7, fn row ->
      Enum.flat_map(0..7, fn col ->
        if valid_move?(board, player, row, col), do: [{row, col}], else: []
      end)
    end)
  end

  defp valid_move?(board, player, row, col) do
    # 空のマスでなければ無効
    if Enum.at(Enum.at(board, row), col) != ".", do: false, else: check_directions(board, player, row, col)
  end

  defp check_directions(board, player, row, col) do
    directions = [{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}]
    Enum.any?(directions, fn {dx, dy} -> check_direction(board, player, row, col, dx, dy) end)
  end

  defp check_direction(board, player, row, col, dx, dy) do
    # 盤面の範囲を超えないようにする
    # ここにロジックを実装...
  end
end


