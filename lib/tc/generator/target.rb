# frozen_string_literal: true

require "fileutils"

module Tc
  # This module generates a t&c document for a given dataset and template.
  module Generator
    # This class creates the target folder from the given folder path and file name.
    # It also returns the target path.
    #
    # @attr_accessor [String] folder_path
    # @attr_accessor [String] filename
    class Target
      attr_accessor :folder_path, :filename

      # @param [String] folder_path
      # @param [String] filename
      #
      # @return [String]
      def self.call(folder_path:, filename:)
        new(folder_path, filename).call
      end

      def initialize(folder_path, filename)
        @folder_path = folder_path
        @filename    = filename
      end

      # @return [String] the target path
      def call
        FileUtils.mkdir_p(folder_path)
        File.join(folder_path, filename)
      end
    end
  end
end
