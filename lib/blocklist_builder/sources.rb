# frozen_string_literal: true

module BlocklistBuilder
  SOURCES = [
    Source.new(name: 'adaway',
               description: 'Focus on mobile ads',
               url: 'https://adaway.org/hosts.txt'),
    Suorce.new(name: 'adguard',
               description: 'Combined adguard filter list',
               url: 'https://filters.adtidy.org/windows/filters/15.txt',
               regex: /^\|\|([\w\-_.]+)/),
    Source.new(name: 'bitcoin',
               description: 'Focus on malicious bitcoin sites',
               url: 'https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt'),
    Source.new(name: 'disconnect',
               description: 'Mozilla-driven blocklist',
               url: 'https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt',
               regex: /^([\w\-_.]+)$/),
    Source.new(name: 'dshield',
               description: 'DShield.org suspicious domain list',
               url: 'https://www.dshield.org/feeds/suspiciousdomains_Low.txt',
               regex: /^([\w\-_]+\.[\w\-_.]+)$/),
    Source.new(name: 'hphosts',
               description: 'Broad blacklist against ad and tracking domains',
               url: 'https://hosts-file.net/ad_servers.txt'),
    Source.new(name: 'malware',
               description: 'Broad blacklist against malware domains',
               url: 'https://mirror.espoch.edu.ec/malwaredomains/justdomains',
               type: :plain),
    Source.new(name: 'malwarelist',
               description: 'Blocklist with focus on malware domains',
               url: 'http://www.malwaredomainlist.com/hostslist/hosts.txt')
  ].freeze
end
