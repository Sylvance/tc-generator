# frozen_string_literal: true

RSpec.describe Tc::Generator::Dataset do
  let(:dataset_path) { "examples/dataset.json" }
  let(:section_join_character) { ";" }
  let(:dataset) { Tc::Generator::Dataset.call(path: dataset_path, section_join_char: section_join_character) }
  let(:expected_dataset) do
    {
      clauses: ["The quick brown fox", "jumps over the lazy dog", "And dies", "The white horse is white"],
      sections: ["The quick brown fox;jumps over the lazy dog"]
    }
  end

  it "generates formatted dataset" do
    expect(dataset).to eq(expected_dataset)
  end
end
