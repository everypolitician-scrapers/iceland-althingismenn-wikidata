#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

current = WikiData::Category.new( 'Flokkur:Alþingismenn', 'is').member_titles.reject { |n| n.include? 'Kjörnir alþingismenn' }
former = WikiData::Category.new( 'Flokkur:Fyrrum Alþingismenn', 'is').member_titles
is_names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/iceland-althing-wikipedia', column: 'wikiname')

en_names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/iceland-althing-wp', column: 'wikipedia')

EveryPolitician::Wikidata.scrape_wikidata(names: { en: en_names, is: is_names | current | former }, output: false)
