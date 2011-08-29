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
    when NML::AST::Inline::Footnote
      raise NML::Validation::Error.
        new('footnote not defined: %s' % node.identifier,
            node.line,
            node.column) unless @environment.defined? node.identifier
    when String
    when NML::AST::Node
      node.each do |child|
        validate child
      end
    else
      raise TypeError, 'unknown node type: %p' % [node]
    end
  end

  class Environment
    def initialize
      @frames = []
    end

    def nest(footnotes)
      @frames.push Frame.new(footnotes)
      begin
        yield
      ensure
        @frames.pop.validate
      end
    end

    def defined?(identifier)
      @frames.reverse.any?{ |frame| frame.defined? identifier }
    end

  private

    class Frame
      def initialize(footnotes)
        @footnotes = footnotes
        @referenced = []
      end

      def defined?(identifier)
        return false unless @footnotes.defined? identifier
        @referenced << identifier
        true
      end

      def validate
        unreferenced = @footnotes.identifiers - @referenced
        return if unreferenced.empty?
        first = @footnotes[unreferenced.first]
        raise NML::Validation::Error.
                new('footnote not referenced: %s' % unreferenced.join(', '),
                    first.line,
                    first.column)
      end
    end
  end
end
