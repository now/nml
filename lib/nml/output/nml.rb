# -*- coding: utf-8 -*-

require 'nokogiri'

class NML::Output::NML
  def initialize(ast)
    @ast = ast
  end

  def call
    Nokogiri::XML::Builder.new{ |xml|
      output xml, @ast
    }.to_xml
  end

private

  def output(xml, node)
    case node
    when NML::AST::Inline::Code
      xml.code{
        children xml, node
      }
    when NML::AST::Block::Document
      xml.nml{
        children xml, node
      }
    when NML::AST::Inline::Emphasis
      xml.emphasis{
        children xml, node
      }
    when NML::AST::Block::Enumeration
      xml.enumeration{
        children xml, node
      }
    when NML::AST::Inline::Group
      children xml, node
    when NML::AST::Block::Item
      xml.item{
        children xml, node
      }
    when NML::AST::Block::Itemization
      xml.itemization{
        children xml, node
      }
    when NML::AST::Block::Paragraph
      xml.p{
        children xml, node
      }
    when NML::AST::Block::Section
      xml.section{
        children xml, node
      }
    when NML::AST::Block::Title
      xml.title{
        children xml, node
      }
    when String
      xml.text node
    else
      raise TypeError, 'unknown node type: %p' % [node]
    end
  end

  def children(xml, node)
    node.each do |child|
      output xml, child
    end
  end
end
