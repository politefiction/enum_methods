module Enumerable


	def my_each
		i = 0
		while i < self.length
			yield(self[i])
			i += 1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.length
			yield(self[i], i)
			i += 1
		end
		self
	end

	def my_select
		selected = []
		self.my_each { |item| selected << item if yield(item) }
		selected
	end

	def my_all?
		all = []
		self.my_each { |item| all << yield(item) }
		if all.include? false 
			false
		else 
			true
		end
	end

	def my_any?
		any = []
		self.my_each { |item| any << yield(item) }
		any.include? true ? true : false
	end

	def my_none? 
		none = []
		self.my_each { |item| none << yield(item) }
		if none.include? true
			false
		else 
			true
		end
	end

	def my_count(param=nil, &block)
		count = 0
		self.my_each do |item|
			i = 0
			if param
				count += 1 if item == param
			elsif block
				count += 1 if block.call(item)
			else
				count = self.length
			end
		end
		count
	end

	def my_map 
		i = 0
		new_self = []
		while i < self.length
			new_self << yield(self[i])
			i += 1
		end
		new_self
	end

	def my_inject (param=nil)
		if param
			result = param
			self.my_each { |item| result = yield(result, item) }
			result
		else
			result = self[0]
			self.my_each_with_index { |item, index| result = yield(result, item) unless index == 0 }
			result
		end
	end

end

class Array
	include Enumerable
end



