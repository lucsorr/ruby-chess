module CastlingBoardControl
  # (See Castling, movement.rb::CastlingPieceControl, Rook, King)
  def mark_moved_piece!(piece)
    return unless self[piece].is_a?(Rook) || self[piece].is_a?(King)

    self[piece].mark!
  end

  def castle!(side, color, permanent=false)
    if color == :white && side == :king
      move_piece!([7, 4], [7, 6], permanent)
      move_piece!([7, 7], [7, 5], permanent)
    elsif color == :white && side == :queen
      move_piece!([7, 4], [7, 2], permanent)
      move_piece!([7, 0], [7, 3], permanent)
    elsif color == :black && side == :king
      move_piece!([0, 4], [0, 6], permanent)
      move_piece!([0, 7], [0, 5], permanent)
    else
      move_piece!([0, 4], [0, 2], permanent)
      move_piece!([0, 0], [0, 3], permanent)
    end
  end

  def uncastle!(side, color)
    if color == :white && side == :king
      move_piece!([7, 6], [7, 4])
      move_piece!([7, 5], [7, 7])
    elsif color == :white && side == :queen
      move_piece!([7, 2], [7, 4])
      move_piece!([7, 3], [7, 0])
    elsif color == :black && side == :king
      move_piece!([0, 6], [0, 4])
      move_piece!([0, 5], [0, 7])
    else
      move_piece!([0, 2], [0, 4])
      move_piece!([0, 3], [0, 0])
    end
  end
end