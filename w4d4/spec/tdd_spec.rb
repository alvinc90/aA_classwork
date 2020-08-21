require "tdd" 
require "rspec" 

describe Array do 
    let(:matrix) {Array.new([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ])}

    describe "#my_uniq" do 
        it "removes duplicates in a array " do 
            expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3]) 
        end

        context "when array is empty" do  
            it "return an empty array" do 
                expect([].my_uniq).to eq([]) 
            end
        end
    end

    describe "#two_sum" do
        it "find pairs of positions where the elements at those positions sum to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end

        context "when the size of the array is less than two" do  
            it "raises an error" do 
                # expect {[].two_sum}.to raise_error(StandardError)
                expect{self.length < 2}.to raise_error(StandardError)
                # expect{Array.empty?}.to raise_error(StandardError)
            end
        end
    end

    describe "#my_transpose" do
        it "transposes the array" do
            expect(matrix.my_transpose).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ])
        end
    end

    describe "#stock_picker" do 
        it "outputs the most profitable pair of days on which to first buy the 
            stock and then sell the stock" do 
                expect([1,2,3,4,5,6,7].stock_picker).to eq([0, 6]) 
        end

        context "when array length is not equals to 7 or an element is 0" do 
            it "raises an error" do 
                expect{self.length != 7}.to raise_error(StandardError)
                expect{self.include?(0)}.to raise_error(StandardError)
            end
        end

        context "when there are less than two unique elements in the array" do
            it "raises an error" do
                expect{self.uniq.length < 2}.to raise_error(StandardError)
            end
        end
    end
end