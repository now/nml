# -*- coding: utf-8 -*-

class NML::Output::NMC
  def initialize(ast)
    @ast = ast
  end

  def call
    Closure.new(@ast).call
  end

private

  class Closure
    def initialize(ast)
      @ast = ast
      @output = []
      @level = 0
      @block = "\n\n"
    end

    def call
      output @ast
      @output.join('')
    end

  private

    def output(node)
      case node
      when NML::AST::Document
        children node
      when NML::AST::Enumeration
        block
        numbers = ['₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', '₀']
        items(node){ numbers.shift + ' ' }
      when NML::AST::Itemization
        block
        items(node){ '• ' }
      when NML::AST::Paragraph
        block
        @output << margin << '  '
        children node
      when NML::AST::Section
        block
        @output << margin << '§ '
        nest do
          children node
        end
      when NML::AST::Title
        children node
      when String
        @output << node
      else
        raise TypeError, 'unknown node type: %p' % [node]
      end
    end

    def block
      @output << @block
    end

    def items(node)
      node.each do |i|
        @output << margin << yield
        item do
          output i.first
        end
        nest do
          i.entries[1..-1].each do |child|
            output child
          end
        end
      end
    end

    def item
      @block = ''
      begin
        yield
      ensure
        @block = "\n\n"
      end
    end

    def children(node)
      node.each do |child|
        output child
      end
    end

    def nest
      @level += 1
      begin
        yield
      ensure
        @level -= 1
      end
    end

    def margin
      '  ' * @level
    end
  end
end
