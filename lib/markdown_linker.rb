require 'markdown_linker/version'
require 'markdown_linker/description'

require 'commander'

require 'open-uri'
require 'nokogiri'

module MarkdownLinker

  class Methods

    include Commander::Methods

    def run

      program :name, "markdwon linker"
      program :version, MarkdownLinker::VERSION
      program :description, MarkdownLinker::DESCRIPTION

      command :make do |c|
        c.syntax = 'markdown_linker make URL'
        c.description = 'Generate markdown type link of the given URL'
        c.action do |args, options|
          self.make(args, options)
        end
      end

      run!
    end

    :private

    def make(args, options)
      args.each do |url|
        charset = nil
        html = nil
        progress [url] do |url|
          html = open(url) do |f|
            charset = f.charset
            f.read
          end
        end

        doc = Nokogiri::HTML.parse(html, nil, charset)
        puts "[#{doc.title}](#{url})"
      end
    end

  end

end
