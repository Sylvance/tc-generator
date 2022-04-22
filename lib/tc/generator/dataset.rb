# frozen_string_literal: true

require "json"

module Tc
  # This module generates a t&c document for a given dataset and template.
  module Generator
    # This class retrieves the dataset from the given path.
    # It also formats the dataset to be used in the document.
    class Dataset
      attr_accessor :path, :section_join_char

      # @param [String] path
      # @param [String] section_join_char
      #
      # @return [Hash] the dataset
      def self.call(path:, section_join_char:)
        new(path, section_join_char).call
      end

      def initialize(path, section_join_char)
        @path              = path
        @section_join_char = section_join_char
      end

      # @return [Hash] the formatted dataset
      def call
        file = File.read(path)

        data = JSON.parse(file)
        formatted_clauses = format_clauses_to_array(data["clauses"])

        {
          clauses: formatted_clauses,
          sections: format_sections_to_array(data["sections"], formatted_clauses)
        }
      end

      private

      def format_clauses_to_array(clauses)
        sorted = clauses.sort_by { |clause| clause["id"] }
        sorted.map { |clause| clause["text"] }
      end

      def format_sections_to_array(sections, formatted_clauses)
        sorted = sections.sort_by { |section| section["id"] }
        result = sorted.map { |section| section["clauses_ids"] }
        result.map do |clauses_ids|
          remapped_clauses_ids = clauses_ids.map { |clause_id| clause_id - 1 }
          formatted_clauses.values_at(*remapped_clauses_ids).join(section_join_char)
        end
      end
    end
  end
end
