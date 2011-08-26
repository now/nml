# -*- coding: utf-8 -*-

class NML::Normalization::Footnotes::Inline
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
    inline(@ast)
  end

private

  def inline(node)
    case node
    when NML::AST::Block::Footnoted
      @environment.nest(node.footnotes){
        inline node.child
      }
    when NML::AST::Inline::Footnote
      footnote(@environment[node.identifier].definition, node)
    when String
      node
    when NML::AST::Node
      node.copy(*node.map{ |child| inline child })
    else
      raise TypeError, 'unknown node type: %p' % [node]
    end
  end

  Inlines = {
    NML::AST::Block::Footnote::Abbreviation => NML::AST::Inline::Abbreviation,
    NML::AST::Block::Footnote::Link => NML::AST::Inline::Link
  }

  def Inlines.[](definition)
    super(definition.class) or raise TypeError, 'unknown node type: %p' % [node]
  end

  def footnote(definition, node)
    Inlines[definition].new(*(definition.to_a + node.to_a))
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
        @frames.pop
      end
    end

    def [](identifier)
      @frames.reverse.find{ |frame| frame.defined? identifier }[identifier]
    end

  private
  
    class Frame
      def initialize(footnotes)
        @footnotes = footnotes
      end

      def defined?(identifier)
        @footnotes.defined? identifier
      end

      def [](identifier)
        @footnotes[identifier]
      end
    end
  end
end
