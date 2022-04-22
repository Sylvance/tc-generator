# frozen_string_literal: true

RSpec.describe Tc::Generator::Target do
  let(:target_folder_path) { "examples" }
  let(:target_filename) { "result.txt" }
  let(:target) { Tc::Generator::Target.call(folder_path: target_folder_path, filename: target_filename) }
  let(:expected_target) { "examples/result.txt" }

  it "outputs the target file path" do
    expect(target).to eq(expected_target)
  end
end
