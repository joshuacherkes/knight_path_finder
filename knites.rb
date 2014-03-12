require './treenode_nb.rb'
require 'debugger'

class KnitePathFinder
	attr_accessor :tree 


	def initialize(position)
		@starting_position = position
		@tree = TreeNode.new(@starting_position)
		@visited_moves = []
		build_move_tree(@tree)
	end


	def find_path(target_pos)
		self.tree.bfs(target_pos).ancestors
	end

	def build_move_tree(node)
		#debugger
		#Base case, build first level deep 
		if node.children.empty?
			possible_moves = new_move_positions(node.value)
			possible_moves.each do |move|
				unless @visited_moves.include?(move) 
					node.add_child(TreeNode.new(move)) 
					@visited_moves << move
				end
			end #loop
		end #if_block

		node.children.each do |child|
			build_move_tree(child)
		end
		
	end




	def new_move_positions(position)
		knight_moves = [
			[ 2,-1],
			[ 1, 2],
			[ 2, 1],
			[ 1,-2],
			[-1,-2],
			[-2,-1],
			[-1, 2],
			[-2, 1]]
		pos = position
		legal_moves = []
		knight_moves.each  do |move| 
			new_move = [pos[0]+move[0], pos[1]+move[1]]
			legal_moves << new_move if new_move.all?{|num| (0..7).to_a.include?(num)}
		end
		legal_moves
	end



end