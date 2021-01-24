require "set"
require "json"
require 'sinatra'
require "uwn/api"

uwn = Uwn::Api::Connect.new plugins_path: "./uwnapi/plugins"
puts settings.environment # sinatra output sometimes gets this wrong

get '/:lang/:word' do
  if settings.development?
    puts "settings cors"
    response.headers['Access-Control-Allow-Origin'] = "*"
  end
  meaning = uwn.meaning params['word'], params['lang']
  definitions = []
  synsets = []
  meaning.glosses.each do |gloss|
    definitions.append(gloss.term_str)
    synsets.append(gloss.synset)
  end
  part_of_speech = []
  meaning.lexical_categories.each do |lexical_category|
    part_of_speech.append(lexical_category.lexcat)
  end
  return JSON.generate [{"definitions"=>definitions}, {"parts_of_speech"=>part_of_speech}, "meaning_ids"=>synsets]
end

get '/:lang/:word/:synset/translate' do
  if settings.development?
    puts "settings cors"
    response.headers['Access-Control-Allow-Origin'] = "*"
  end
  meaning = uwn.meaning params['word'], params['lang']
  translations = Hash.new
  seenLangs = Set['ase']
  meaning.lexicalizations.each do |lexicalization|
    synset = lexicalization.synset[2,lexicalization.synset.size]
    if synset == params['synset'] and not seenLangs === lexicalization.language
      translations[lexicalization.language] = lexicalization.term_str
      seenLangs.add(lexicalization.language)
    end
  end
  return JSON.generate translations
end