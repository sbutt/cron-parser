require_relative "../cron-parser.rb"

describe range_parser do
    context "When passing good values to range_parser method" do
        it "The range_parser method should return a range" do
            my_range = range_parser("1-10")
            expect my_range.to eq "1 2 3 4 5 6 7 8 9 10"
        end
    end
end

