# -*- coding: utf-8 -*-

class NML::AST::Node
  include Enumerable

  class << self
    def attributes(*attributes)
      return @attributes ||= [] if attributes.empty?
      attr_reader(*attributes)
      @attributes = attributes
    end

    def children(*children)
      return @children ||= [] if children.empty?
      attr_reader(*children)
      @children = children
    end
  end

  def initialize(*arguments)
    raise ArgumentError,
      'wrong number of arguments (%d for %d)' %
        [arguments.length, self.class.attributes.length + self.class.children.length] if
          arguments.length < self.class.attributes.length + self.class.children.length or
          (self.class.children.length > 0 and
           arguments.length > self.class.attributes.length + self.class.children.length)
    self.class.attributes.each_with_index do |attribute, index|
      instance_variable_set :"@#{attribute}", arguments[index]
    end
    self.class.children.each_with_index do |child, index|
      instance_variable_set :"@#{child}", arguments[self.class.attributes.length + index]
    end
    @attributes = arguments[0...self.class.attributes.length]
    @children = arguments[self.class.attributes.length..-1]
  end

  def copy(*children)
    children == @children ? self : self.class.new(*(attributes + children))
  end

  def each
    children.each do |child|
      yield child
    end
    self
  end

  def ==(other)
    self.class == other.class and
      attributes == other.attributes and
      children == other.children
  end

  alias eql? ==

  def hash
    attributes.hash ^ children.hash
  end

  def inspect
    attributes.length + children.length > 0 ?
      '%s.new(%s)' % [self.class, (attributes + children).map{ |e| e.inspect }.join(', ')] :
      '%s.new' % self.class
  end

protected

  attr_reader :attributes, :children
end
