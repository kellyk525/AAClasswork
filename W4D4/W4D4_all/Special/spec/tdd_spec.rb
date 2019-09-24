require "tdd"


RSpec.describe Array do
  describe "Array#my_uniq" do
    subject(:arr) {[1,2,1,3,3]}

    # it "should accept arrays as argument" do
    #   expect().to receive(Array)
    # end
    it "should remove duplicates" do
      expect(arr.my_uniq).to eq([1,2,3])
    end

    it "should return the unique elements in the order they first appeared" do
      expect(arr.my_uniq).to eq([1,2,3])
    end

    it "should not call #uniq" do
      expect(arr).not_to receive(:uniq)
      arr.my_uniq
      # expect {arr.my_uniq}.not_to raise_error
    end
  end

  # describe "Array#two_sum" do
  #   subject(:arr) {[-1, 0, 2, -2, -1]}

  #   it "should accept arrays as argument" do
  #     expect(arr).to receive(Array)
  #   end
  #   it "should find all pairs of positions where the elements at those positions sum to zero" do 
  #     expect (arr.two_sum).to eq([0, 4], [2, 3])   
  #   end

  #   it "should be ordered from smallest index to biggest index" do
  #     expect (arr.two_sum).to_not eq([2, 3], [0, 4])
  #   end

  #   it "should return false if no pairs sum to zero" do
  #     expect ([1,2,3].two_sum).to be(false)
  #   end
  # end

end

