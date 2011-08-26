# -*- coding: utf-8 -*-

require 'nokogiri'

class NML::Output::NML
  class << self
    def call(ast)
      new(NML::Normalization::Footnotes::Inline.call(ast)).call
    end
  end

  def initialize(ast)
    @ast = ast
  end

  def call
    Nokogiri::XML::Builder.new(:encoding => 'utf-8'){ |xml|
      output xml, @ast
    }.to_xml
  end

private

  def output(xml, node)
    case node
    when NML::AST::Inline::Group
      children xml, node
    when String
      xml.text node
    when NML::AST::Node
      xml.send(name(node), Hash[*node.enum_for(:each_attribute).entries.flatten]){
        children xml, node
      }
    else
      raise TypeError, 'unknown node type: %p' % [node]
    end
  end

  def children(xml, node)
    node.each do |child|
      output xml, child
    end
  end

  Names = {
    NML::AST::Block::Document => 'nml',
    NML::AST::Block::Paragraph => 'p_',
    NML::AST::Inline::Link => 'ref'
  }

  def name(node)
    Names[node.class] ||= node.class.name.sub(/^.*::/, '').downcase
  end
end
