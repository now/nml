# -*- coding: utf-8 -*-

require 'ame'

class NML::CLI < Ame::Root
  Version = NML::Version

  description 'Convert NMC files to NML files'
  option :'templates-root', 'Output template root path and exit'
  splat :file, 'Source NMC file', :optional => true
  def nmc(files, options)
    if options[:'templates-root']
      $stdout.write File.join(NML::DataPath, 'templates')
      exit
    end
    if files.empty?
      nmlize nil, $stdin
    else
      files.each do |file|
        File.open(file, 'rb') do |input|
          nmlize file, input
        end
      end
    end
  end

private

  def nmlize(file, input)
    $stdout.write NML::Output::NML.call(NML::Validation::Footnotes.call(NML.ast(input.read)))
  rescue NML::Parser::Error => e
    raise unless file
    raise e, '%s:%s' % [file, e.message]
  end
end
