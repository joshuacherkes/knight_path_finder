require 'debugger'
class TreeNode
	attr_accessor :value, :parent


	def initialize(parent = nil, value)
		@parent = parent
		@children = []
		@value = value
	end #initialize

	def add_child(tree_object)
		tree_object.parent = self
		@children << tree_object
	end #add_child

	def children
		@children
	end #children


	def dfs(target)
		#debugger
		return self if  self.value == target

		self.children.each do |child|
			result = child.dfs(target)
			return result if result
		end

	end #dfs

	def bfs(target)
		array = [self]
		until array.empty?
			test_against = array.shift
			return test_against if test_against && test_against.value == target
			test_against.children.each {|child| array << child}
		end
		nil
	end #bfs

	def ancestors
		array = [self.value]
		check = self
		
		while check.parent
			array << check.parent.value
			check = check.parent
		end
		array
	end






end #class



	# def dfs(looking_for)
	# 	result = nil
	# 	#debugger
	# 	if self.value == looking_for
	# 		result = self
	# 		return result
	# 	elsif self.children.empty?
	# 		result
	# 	else
	# 		@children.each_index do |i|
	# 			result = self.children[i].dfs(looking_for) 
	# 			unless result == nil
	# 				if result.value == looking_for
	# 					break
	# 				end
	# 			end
	# 		end 
	# 		#result = self.right.dfs(looking_for) unless result 
	# 	end
	# 	result		
	# end