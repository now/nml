# -*- coding: utf-8 -*-

class NML::AST::Document
  def initialize(title, blocks, sections)
    @title, @blocks, @sections = title, blocks, sections
  end

  def ==(other)
    title == other.title and
      blocks == other.blocks and
      sections == other.sections
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    title.hash ^
      blocks.hash ^
      sections.hash
  end

  def inspect
    '#<%s %s, %s, %s>' % [self.class,
                          title,
                          blocks.map{ |block| block.inspect }.join(', '),
                          sections.map{ |section| section.inspect }.join(', ')]
  end

protected

  attr_reader :title, :blocks, :sections
end
