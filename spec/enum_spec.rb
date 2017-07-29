require 'enum'

describe 'Enumerable' do
	let(:test_array) { Array.new }
	let(:test_hash) { Hash.new }
	
	describe '.my_each' do
		context 'given an array of numbers' do
			it 'adds 1 to each item' do
				[1, 2, 3].my_each { |item| test_array << item + 1 }
				expect(test_array).to eql([2,3,4])
			end
			it 'multiplies each item by 3' do
				[1, 2, 3].my_each { |item| test_array << item * 3 }
				expect(test_array).to eql([3, 6, 9])
			end
		end
		context 'given an array of words' do
			it 'adds on to the word' do
				["foot", "base", "basket"].my_each { |item| test_array << item + "ball" }
				expect(test_array).to eql(["football", "baseball", "basketball"])
			end
		end
	end

	describe '.my_each_with_index' do
		context 'given an array of numbers' do
			it 'identifies items with even indices' do
				[2, 4, 6, 8, 10].my_each_with_index { |item, index| test_array << item if index.even? }
				expect(test_array).to eql([2, 6, 10])
			end
		end
		context 'given an array of words' do
			it 'puts the word with its index' do
				["Sam", "Charlotte", "Frank"].my_each_with_index { |item, index| test_hash[index] = item }
				expect(test_hash).to eql(0 => "Sam", 1 => "Charlotte", 2 => "Frank")
			end
		end
	end

	describe '.my_select' do
		context 'given an array of numbers' do
			it 'selects items less 5' do
				expect([2, 5, 9, 1, 3].my_select { |item| item < 5 }).to eql([2, 1, 3])
			end
			it 'selects multiples of 3' do
				expect([8, 2, 9, 13, 3].my_select { |item| item % 3 == 0 }).to eql([9, 3])
			end
		end
		context 'given an array of words' do
			it 'selects items that contain "ment"' do
				expect(["payment", "building", "chair", "mental"].my_select { |item| item.include? "ment" }).to eql(["payment", "mental"])
			end
		end
	end

	describe '.my_all?' do
		context 'given an array of numbers' do
			it 'verifies whether all items are over 3' do
				expect([8, 4, 9, 7].my_all? { |item| item > 3 }).to eql(true)
				expect([2, 8, 5, 6].my_all? { |item| item > 3 }).to eql(false)
				#expect([2, 8, 5, 6].my_all? { |item| item > 3 }).to eql(false)
			end
		end
		context 'given an array of words' do
			it 'verifies whether all items contain "t"' do
				expect(["fit", "settle", "take"].my_all? { |item| item.include? "t" }).to eql(true)
				expect(["fit", "settle", "bake"].my_all? { |item| item.include? "t" }).to eql(false)
			end
		end
	end

	describe '.my_any?' do
		context 'given an array of numbers' do
			it 'verifies whether any items are over 5' do
				expect([8, 3, 4, 2].my_any? { |item| item > 5 }).to eql(true)
				expect([1, 3, 4, 2].my_any? { |item| item > 5 }).to eql(false)
			end
		end
		context 'given an array of words' do
			it 'verifies whether any items contain "t"' do
				expect(["fit", "settle", "bake"].my_any? { |item| item.include? "t" }).to eql(true)
				expect(["phone", "poor", "work"].my_any? { |item| item.include? "t" }).to eql(false)
			end
		end
	end

	describe 'my_none?' do
		context 'given an array of numbers' do
			it 'verifies whether none of the items are over 5' do
				expect([1, 3, 4, 2].my_none? { |item| item > 5 }).to eql(true)
				expect([8, 3, 4, 2].my_none? { |item| item > 5 }).to eql(false)
			end
		end
		context 'given an array of words' do
			it 'verifies whether none of the items contain "t"' do
				expect(["phone", "poor", "work"].my_none? { |item| item.include? "t" }).to eql(true)
				expect(["fit", "settle", "bake"].my_none? { |item| item.include? "t" }).to eql(false)
			end
		end
	end


end

