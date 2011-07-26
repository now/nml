# -*- coding: utf-8 -*-

class NML::AST::Document
  def initialize(title, paragraphs, sections)
    @title, @paragraphs, @sections = title, paragraphs, sections
  end

  def ==(other)
    title == other.title and
      paragraphs == other.paragraphs and
      sections == other.sections
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    title.hash ^
      paragraphs.hash ^
      sections.hash
  end

  def inspect
    '#<%s %s, %s, %s>' % [self.class,
                          title,
                          paragraphs.map{ |p| p.inspect }.join(', '),
                          sections.map{ |s| s.inspect }.join(', ')]
  end

protected

  attr_reader :title, :paragraphs, :sections
end
