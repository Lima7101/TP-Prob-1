require 'treat'
require 'stanford-core-nlp'
include Treat::Core::DSL

StanfordCoreNLP::Config::Models[:ner][:english] = 'muc.7class.distsim.crf.ser.gz'


d = document './files/events.txt'


d.do(:chunk, :segment, :tokenize, :parse, :name_tag)


d.children.each_with_index do |c, i|
  # c.visualize :dot, file: "./output/#{i+1}.dot"
  c.serialize :xml, file: "./output/#{i+1}.xml"
  # `xml ./output/#{i+1}.dot -Tpng -o ./output/#{i+1}.png`
end


puts 'done'