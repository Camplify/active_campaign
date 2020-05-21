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

  let(:expected_user_response) do
    user_params.except(:group, :password)
  end
end

RSpec.shared_context 'with existing custom text field', with_existing_custom_text_field: true do
  include_context 'with custom text field params'

  let!(:field) do
    response = client.create_user(field_params)
    response.fetch(:field) { raise "HELL (custom text field creation failed) #{response}" }
  end
  let(:field_id) { field[:id] }

  after do
    client.delete_field(field_id) if field_id
  end
end
