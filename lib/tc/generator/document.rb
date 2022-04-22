# frozen_string_literal: true

require "erb"
require "fileutils"

module Tc
  # This module generates a t&c document for a given dataset and template.
  module Generator
    # This class creates a document for the target path.
    class Document
      include ERB::Util

      attr_accessor :target_path, :dataset, :clauses, :sections, :template

      # @param [String] target_path
      # @param [Hash] dataset
      # @param [String] template
      #
      # @return [nil]
      def self.call(target_path:, dataset:, template:)
        new(target_path, dataset, template).call
      end

      def initialize(target_path, dataset, template)
        @target_path = target_path
        @dataset     = dataset
        @clauses     = dataset[:clauses]
        @sections    = dataset[:sections]
        @template    = template
      end

      # @return [nil]
      def call
        File.open(target_path, "w+") do |f|
          f.write(render)
        end

        FileUtils.rm_rf(template)
      end

      private

      def render
        template_file = File.read(template)
        ERB.new(template_file).result(binding)
      end
    end
  end
end
