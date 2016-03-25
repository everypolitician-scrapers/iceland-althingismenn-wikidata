#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

# current = WikiData::Category.new( 'Flokkur:Alþingismenn', 'is').member_titles
# former = WikiData::Category.new( 'Flokkur:Fyrrum Alþingismenn', 'is').member_titles
# names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/iceland-althing-wikipedia', column: 'wikiname')

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/iceland-althing-wp', column: 'wikipedia')
EveryPolitician::Wikidata.scrape_wikidata(names: { en: names }, output: false)
