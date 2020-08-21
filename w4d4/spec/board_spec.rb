require "board.rb" 
require "rspec" 

describe Board do 

    subject(:test) {Board.new(5)} 
    describe "#initialize" do 
        it "sets a number of pieces" do 
            expect(test.num_pieces).to eq(5) 
        end

        it "should make the game board" do 
            expect(test.hanoi).to eq([
                [1,2,3,4,5],
                [],
                []
            ])
        end
    end

    describe "#move" do 
        it "takes an array and moves the top element to the top of another array" do 
            expect(test.move([0, 1])).to eq([
                [2,3,4,5],
                [1],
                []
            ]) 
        end

        it "should have elements in the initial array" do
            expect{test.move([2, 1])}.to raise_error("You can't move from an empty tower")
        end

        it "should not move a larger value onto a smaller value" do 
            test.move([0,1]) 
            expect{test.move([0,1])}.to raise_error("You can't move a smaller value onto a larger value")
        end
    end

    # describe "#won?" do
    #     it "won?" do
    #         expect(test.won?).to eq(true) 
    #     end

    # end

end