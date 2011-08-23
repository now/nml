# -*- coding: utf-8 -*-

require 'ame'

class NML::CLI < Ame::Root
  Version = NML::Version

  description 'Convert NMC files to NML files'
  splat :file, 'Source NMC file', :optional => true
  def nmc(files)
    if files.empty?
      nmlize $stdin
    else
      files.each do |file|
        File.open(file, 'rb') do |input|
          nmlize input
        end
      end
    end
  end

private

  def nmlize(input)
    begin
      $stdout.write NML::Output::NML.call(NML.ast(input.read))
    rescue NML::Parser::Error => e
      raise e, '%s:%s' % [file, e.message]
    end
  end
end
