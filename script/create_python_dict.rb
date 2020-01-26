require 'nokogiri'
require 'open-uri'
require 'net/http'

#　マルチバイト文字のチェックメソッド追加
class String
  def has_multibytes?
    self.bytes do |byte|
      return true if (byte & 0b10000000) != 0
    end
    false
  end
end

#　引数チェック（バージョンと出力ファイル名取得）
if ARGV.size == 1
  versions = "2.7"
  DICT_NAME = ARGV[0].to_s
elsif ARGV.size == 2
  DICT_NAME = ARGV[0].to_s
  versions = ARGV[1].to_s
else
  puts "Argument error"
  exit
end

#　索引ページのURL生成
BASE_URL = "https://docs.python.org/ja/" + versions + '/'.freeze
INDEX_URL = BASE_URL + 'genindex.html'.freeze

#　指定したバージョンの索引ページが存在するか確認
res = Net::HTTP.get_response(URI.parse(INDEX_URL))
if res.code != '200'
  puts "status error : " + res.code.to_s
  exit
end

#　索引ページのソース取得
index = Nokogiri::HTML(open(INDEX_URL))
link_tags = index.xpath('//div[@class="genindex-jumpbox"]')

#　A~Zまでの索引ページより索引項目抽出（日本語項目＆補助項目は除外）
items = []
link_tags.search('//p[position()=1]//a').each do |tag|
  urls = URI.escape(BASE_URL + tag[:href])
  doc = Nokogiri::HTML(open(urls))
  doc.search('.//table[@class="indextable"]//a[position()=1]').each do |item|
      item = item.text.split[0]
      unless item.match(/^[-.:(]|,$/) || item.has_multibytes?
        items << item
      end
  end
end

#　取得した全項目から重複分を省きソート後、辞書ファイルとして書き出し
File.open(DICT_NAME, 'w') do |f|
  items.uniq!.sort!
  items.each { |item| f.puts(item) }
end
