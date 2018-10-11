#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

current = WikiData::Category.new( 'Flokkur:Alþingismenn', 'is').member_titles.reject { |n| n.include? 'Kjörnir alþingismenn' }
former = WikiData::Category.new( 'Flokkur:Fyrrum Alþingismenn', 'is').member_titles

is_names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/iceland-althing-wikipedia', column: 'wikiname')
en_names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/iceland-althing-wp', column: 'wikipedia')

sparq = 'SELECT DISTINCT ?item WHERE { ?item p:P39/ps:P39/wdt:P279* wd:Q21272959 }'
p39s = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: p39s, names: { en: en_names, is: is_names | current | former })
