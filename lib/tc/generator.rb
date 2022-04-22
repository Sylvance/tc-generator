# frozen_string_literal: true

require_relative "generator/dataset"
require_relative "generator/document"
require_relative "generator/run"
require_relative "generator/target"
require_relative "generator/template"
require_relative "generator/version"

module Tc
  # This module generates a t&c document for a given dataset and template.
  module Generator
    class Error < StandardError; end

    def self.configuration
      @configuration ||= OpenStruct.new(
        target_folder_path: nil,
        target_filename: nil,
        dataset_path: nil,
        template_path: nil,
        section_join_character: nil
      )
    end

    def self.configure
      yield(configuration)
    end
  end
end
