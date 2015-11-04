# encoding: utf-8

require 'erb'
require 'fileutils'
require 'yaml'

class TemplateEngine
  OUTPUT_DIR = File.join(File.dirname(__FILE__), 'output')

  attr_reader :data, :content_file, :template_file
  alias_method :d, :data

  def initialize(opts = {})
    @content_file  = opts[:content_file] || 'content.yml'
    @template_file = opts[:template_file] || 'template.tex.erb'
    @data = YAML.load_file @content_file
  end

  def build
    FileUtils.mkdir_p OUTPUT_DIR unless Dir.exist? OUTPUT_DIR
    output = build_erb
    !!File.write(File.join(OUTPUT_DIR, output_file), output)
  end

  private

  def build_erb
    b = binding
    file = File.open(@template_file, 'rb')
    raw  = file.read
    file.close
    erb = ERB.new(raw)
    erb.result(b)
  end

  def output_file
    parts = @template_file.split('.')
    parts.take(parts.size - 1).join('.')
  end

  def font_spec_options(style)
    str = ''
    if font = @data['fonts'][style]
      str << '['
      font.each_with_index do |(k, v), i|
        next if k == 'name'
        str << "#{camelize(k)}=#{v}"
        str << ',' unless i == font.size - 1
      end
      str << ']'
    end
  end

  def camelize(string)
    string.split('_').map(&:capitalize).join
  end
end
