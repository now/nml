# -*- coding: utf-8 -*-

class NML::Validation::Footnotes
  class << self
    def call(ast)
      new(ast).call
    end
  end

  def initialize(ast)
    @ast = ast
    @environment = Environment.new
  end

  def call
    validate @ast
    @ast
  end

private

  def validate(node)
    case node
    when NML::AST::Block::Footnoted
      @environment.nest node.footnotes do
        validate node.child
      end
    when NML::AST::Inline::Footnoted
      validate node.child
      node.footnotes.each do |footnote|
        validate footnote
      end
    when NML::AST::Inline::Footnote
      raise NML::Validation::Error.
              new('footnote not defined: %s' % node.number,
                  node.line,
                  node.column) unless @environment.defined? node.number
    when String
    when Enumerable
      node.each do |child|
        validate child
      end
    else
      raise TypeError, 'unknown node type: %p' % [node]
    end
  end

private

  class Environment
    def initialize
      @frames = []
    end

    def nest(footnotes)
      @frames.push Frame.new(footnotes)
      yield
      @frames.pop.validate
    end

    def defined?(number)
      @frames.reverse.any?{ |frame| frame.defined?(number) }
    end

  private

    class Frame
      def initialize(footnotes)
        @footnotes = footnotes
        @referenced = []
      end

      def defined?(number)
        return false unless @footnotes.any?{ |footnote| footnote.number == number }
        @referenced << number
        true
      end

      def validate
        unreferenced = @footnotes.map{ |footnote| footnote.number } - @referenced
        return if unreferenced.empty?
        first = @footnotes.find{ |footnote| unreferenced.include? footnote.number }
        raise NML::Validation::Error.
                new('footnote not referenced: %s' % unreferenced.join(', '),
                    first.line,
                    first.column)
      end
    end
  end
end
