# frozen_string_literal: true

require "fileutils"

module Tc
  # This module generates a t&c document for a given dataset and template.
  module Generator
    # This class retrieves the erb template from the given path.
    #
    # @attr_accessor [String] path
    class Template
      attr_accessor :path

      # @param [String] path
      #
      # @return [String] the template path
      def self.call(path:)
        new(path).call
      end

      def initialize(path)
        @path = path
      end

      # @return [String] the template path
      def call
        template_file = File.read(path)
        convert_file_erb_file(template_file)
      end

      private

      def convert_file_erb_file(template_file)
        new_contents = template_file.gsub("[CLAUSE-", "<%= @clauses[")
        new_contents1 = new_contents.gsub("[SECTION-", "<%= @sections[")
        new_contents2 = new_contents1.gsub("]", " - 1] %>")
        template_path = erb_filepath

        File.open(template_path, "w+") do |f|
          f.write(new_contents2)
        end

        template_path
      end

      def erb_filepath
        dir = "/#{spec.gem_dir}/lib/tc/tmp"
        erb_path = "#{dir}/template.erb"
        FileUtils.mkdir_p(dir)
        erb_path
      end

      def spec
        Gem::Specification.find_by_name("tc-generator")
      end
    end
  end
end
