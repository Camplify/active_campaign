# frozen_string_literal: true

RSpec.shared_context 'with custom text field params', with_custom_text_field_params: true do
  let(:field_title)             { 'Custom text' }
  let(:field_type)              { 'text' }
  let(:field_description)       { 'A custom text field' }
  let(:field_is_required)       { 0 }
  let(:field_personalized_tag)  { 'Personalized Tag' }
  let(:field_default_value)     { 'Default value' }
  let(:field_visible)           { 1 }
  let(:field_ordering_number)   { 1 }
  let(:field_params) do
    {
      title: field_title,
      type: field_type,
      descript: field_description,
      isrequired: field_is_required,
      perstag: field_personalized_tag,
      defval: field_default_value,
      visible: field_visible,
      ordernum: field_ordering_number
    }
  end

  let(:expected_field_response) do
    field_params
  end
end

RSpec.shared_context 'with existing custom text field', with_existing_custom_text_field: true do
  include_context 'with custom text field params'

  let!(:field) do
    response = client.create_field(field_params)
    response.fetch(:field) { raise "HELL (custom text field creation failed) #{response}" }
  end
  let(:field_id) { field[:id] }

  after do
    client.delete_field(field_id) if field_id
  end
end

RSpec.shared_context 'with custom field option params', with_custom_field_option_params: true do
  let(:option_1_title)  { 'Option 1' }
  let(:option_1_value)  { 'Option 1' }
  let(:option_2_title)  { 'Option 2' }
  let(:option_2_value)  { 'Option 2' }
  let(:field_option_params) do
    [
      {
        field: 1,
        label: option_1_title,
        value: option_1_value
      },
      {
        field: 1,
        label: option_2_title,
        value: option_2_value
      }
    ]
  end

  let(:expected_field_option_response) do
    field_option_params
  end
end

RSpec.shared_context 'with custom radio field params', with_custom_radio_field_params: true do
  let(:field_title)             { 'Custom radio' }
  let(:field_type)              { 'radio' }
  let(:field_description)       { 'A custom radio field' }
  let(:field_is_required)       { 0 }
  let(:field_personalized_tag)  { 'Personalized Tag' }
  let(:field_default_value)     { 'Default value' }
  let(:field_visible)           { 1 }
  let(:field_ordering_number)   { 1 }
  let(:radio_field_params) do
    {
      title: field_title,
      type: field_type,
      descript: field_description,
      isrequired: field_is_required,
      perstag: field_personalized_tag,
      visible: field_visible,
      ordernum: field_ordering_number,
    }
  end

  let(:expected_field_response) do
    field_params
  end
end

RSpec.shared_context 'with existing custom radio field', with_existing_custom_radio_field: true do
  include_context 'with custom radio field params'
  include_context 'with custom field option params'

  let!(:field) do
    response = client.create_field(field_params)
    response.fetch(:field) { raise "HELL (custom radio field creation failed) #{response}" }
  end
  let(:field_id) { field[:id] }

  field_option_params.each do |option|
    option[:field] = field[:id]
  end

  let!(:field_options) do
    response = client.create_field_options(field_option_params)
    response.fetch(:field_options) { raise "HELL (custom field options creation failed) #{response}" }
  end

  after do
    client.delete_field(field_id) if field_id
    # note that custom field options are deleted with their parent custom fields
  end
end
