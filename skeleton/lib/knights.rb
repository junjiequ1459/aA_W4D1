require_relative "00_tree_node"

class KnightPathFinder

    attr_reader :pos

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        self.build_move_tree
        @considered_positions=[pos]
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            current = queue.shift
            arr = valid_moves(current.value)
            arr.each do |child|
                queue << PolyTreeNode.new(child)
                p queue
            end
        end
    end

    def valid_moves(pos)
        arr = []
        x,y = pos
        arr << [x-2,y+1]
        arr << [x-2,y-1]
        arr << [x+2,y+1]
        arr << [x+2,y-1]
        arr << [x-1,y+2]
        arr << [x-1,y-2]
        arr << [x+1,y+2]
        arr << [x+1,y-2]
        final_arr = arr.select {|ele| (0..7).include?(ele[0]) && (0..7).include?(ele[1])}
        final_arr
    end

    def new_move_positions(pos)
        new_arr = self.valid_moves(pos)
        new_arr.reject! {|ele| @considered_positions.include?(ele)}
        @considered_positions += new_arr 
    end
end

