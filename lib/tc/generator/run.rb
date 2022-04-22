# frozen_string_literal: true

require_relative "dataset"
require_relative "document"
require_relative "target"
require_relative "template"

module Tc
  # This module generates a t&c document for a given dataset and template.
  module Generator
    # This class runs the generator.
    class Run
      # @return [nil]
      def self.call
        new.call
      end

      def initialize; end

      # @return [nil]
      def call
        Document.call(
          target_path: Target.call(folder_path: target_folder_path, filename: target_filename),
          dataset: Dataset.call(path: dataset_path, section_join_char: section_join_char),
          template: Template.call(path: template_path)
        )
      end

      private

      def target_folder_path
        Tc::Generator.configuration.target_folder_path
      end

      def target_filename
        Tc::Generator.configuration.target_filename
      end

      def dataset_path
        Tc::Generator.configuration.dataset_path
      end

      def section_join_char
        Tc::Generator.configuration.section_join_character
      end

      def template_path
        Tc::Generator.configuration.template_path
      end
    end
  end
end
