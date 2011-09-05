# -*- coding: utf-8 -*-

module NML::Parser::Extensions
  def ast(string, options = {})
    parser = new
    tree = parser.parse(string, options) or
      raise NML::Parser::Error.
        new('expected %s%s' %
              [parser.terminal_failures.count > 1 ? 'one of ' : '',
               parser.terminal_failures.map{ |f|
                 f.expected_string =~ /\A\s*\z/ ?
                   f.expected_string.inspect :
                   f.expected_string
               }.uniq.join(', ')],
            parser.failure_line,
            parser.failure_column)
    tree.to_ast
  end
end
