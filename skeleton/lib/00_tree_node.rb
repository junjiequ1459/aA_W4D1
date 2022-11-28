class PolyTreeNode
  attr_accessor :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if @parent != nil
      @parent.children.delete self
    end
    @parent = node

    if @parent == nil
      return nil
    end
    if !parent.children.include? self
      parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
    raise "bad input" unless @children.include? child_node
    @children.delete(child_node)
  end

  def dfs(target_value)
    return self if self.value == target_value

    @children.each do |ele|
      result = ele.dfs(target_value)
      if result != nil
        return result
      end
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      ele = queue.shift
      if ele.value == target_value
        return ele
      end
      queue += ele.children
    end
    nil
  end
end
