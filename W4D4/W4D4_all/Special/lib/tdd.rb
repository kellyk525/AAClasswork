


class Array
  def my_uniq(arg)
    final = []
    self.each do |ele|
      final << ele if !final.include?(ele)
    end
    final
    # self.uniq
  end
end



