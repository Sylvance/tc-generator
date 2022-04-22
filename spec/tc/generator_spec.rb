# frozen_string_literal: true

RSpec.describe Tc::Generator do
  let(:file_path) { Tc::Generator.configuration.target_folder_path + Tc::Generator.configuration.target_filename }

  before do
    Tc::Generator.configure do |configuration|
      configuration.target_folder_path     =  "examples/"
      configuration.target_filename        =  "result.txt"
      configuration.dataset_path           =  "examples/dataset.json"
      configuration.template_path          =  "examples/template.txt"
      configuration.section_join_character = ";"
    end
  end

  after do
    File.delete(file_path) if File.exist?(file_path)
  end

  it "has a version number" do
    expect(Tc::Generator::VERSION).not_to be nil
  end

  it "generates a file without any error when given a good configuration" do
    Tc::Generator::Run.call

    expect(File.exist?(file_path)).to be true
  end
end
