# frozen_string_literal: true

RSpec.describe Tc::Generator::Template do
  let(:template_path) { "examples/template.txt" }
  let(:template) { Tc::Generator::Template.call(path: template_path) }
  let(:spec) { Gem::Specification.find_by_name("tc-generator") }
  let(:erb_file_path) { "/#{spec.gem_dir}/lib/tc/tmp/template.erb" }

  after do
    File.delete(erb_file_path) if File.exist?(erb_file_path)
  end

  it "converts the template to a temporary erb file" do
    template

    expect(File.exist?(erb_file_path)).to be true
  end

  it "outputs the template file path for temporary erb file" do
    expect(template).to eq(erb_file_path)
  end
end
