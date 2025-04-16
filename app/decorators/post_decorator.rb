module PostDecorator
  # いいね数
  def like_count
    likes.count
  end
end