# -*- coding: utf-8 -*-

module NML::Parser::Extensions
  def ast(string)
    parser = new
    tree = parser.parse(string) or
      raise NML::Parser::Error.new('expected %s' %
                                   (parser.terminal_failures.count == 1 ?
                                      parser.terminal_failures.first.expected_string :
                                      'one of %s' % [parser.terminal_failures.
                                                     map{ |f| f.expected_string }.
                                                     uniq.
                                                     join(', ')]),
                                   parser.failure_line,
                                   parser.failure_column)
    tree.to_ast
  end
end
