# frozen_string_literal: true

RSpec.shared_context 'with custom field value params', with_field_value_params: true do
  include_context 'with existing contact'
  # TODO: write 'with existing custom field' context, probably should do that as the first branch...
  # include_context 'with existing custom field'

  let(:field_value_contact_id)   { contact.id }
  let(:field_value_field_id)   { '2' } # TODO: use existing field context when it actually is written
  let(:field_value_value)   { 'Yes' }
  let(:field_value_params) do
    {
        contact: field_value_contact_id,
        field: field_value_field_id,
        value: field_value_value
    }
  end

  let(:expected_field_value_response) do
    user_params.except(:group, :password)
  end
end

RSpec.shared_context 'with existing custom field value', with_existing_custom_field_value: true do
  include_context 'with custom field value params'

  let!(:field_value) do
    response = client.create_field_value(field_value_params)
    response.fetch(:field_value) { raise "HELL (custom field value creation failed) #{response}" }
  end
  let(:field_value_id) { field_value[:id] }

  after do
    client.delete_field_value(field_value_id) if field_value_id
  end
end
