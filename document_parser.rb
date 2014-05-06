require 'treat'
require 'stanford-core-nlp'
include Treat::Core::DSL

StanfordCoreNLP::Config::Models[:ner][:english] = 'muc.7class.distsim.crf.ser.gz'

#d = document './../../corpora/LDC2013E64_DEFT_Phase_1_ERE_Annotation_R3_V2/data/source/events_workshop/EVENTS_WKSP_37_1.txt'
d = document './../../corpora/trimmer/events.txt'


d.do(:chunk, :segment, :tokenize, :parse, :name_tag)
#d.do(:chunk, :segment, :tokenize, :parse, :hypernyms, :synonyms, :name_tag)
#d.do(:chunk, :segment, :tokenize, :parse, :name_tag)

d.children.each_with_index do |c, i|
  c.visualize :dot, file: "./../../output/simple/#{i+1}.dot"
  c.serialize :xml, file: "./../../output/simple/#{i+1}.xml"
  `dot ./../../output/simple/#{i+1}.dot -Tpng -o ./../../output/simple/#{i+1}.png`
end


puts 'done'