require 'debugger'
class TreeNode
	attr_accessor :value, :left_child, :right_child, :parent


	def initialize(parent = nil, value)
		@parent = parent
		@children = []
		@left_child = nil
		@right_child = nil
		@value = value
	end #method

	def left=(value)
		@left_child = TreeNode.new(self, nil)
		@left_child.value = value
	end

	def left
		@left_child
	end

	def right=(value)
		@right_child = TreeNode.new(self, value)
	end

	def right
		@right_child
	end


	def dfs(looking_for)
		result = nil
		#debugger
		if self.value == looking_for
			result = self
			return result
		elsif self.left == nil && self.right == nil
			result
		else
			result = self.left.dfs(looking_for) unless self.left 
			result = self.right.dfs(looking_for) unless result 
			result
		end		
	end

	def bfs(looking_for)
		debugger
		result = nil
		array = []
		array << self
		until array.empty?
			
			checking = array.shift 
			unless checking == nil
				if checking.value == looking_for
					result = checking
					return result
				else
					array << checking.left 
					array << checking.right 
				end
			end
		end
		result
	end











end #class