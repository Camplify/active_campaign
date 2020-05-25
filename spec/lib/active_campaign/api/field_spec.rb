# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ActiveCampaign::API::Fields do #, :vcr do
  let(:client) { ActiveCampaign.client }

  describe '#create_field', :with_text_field_params do
    subject(:response) { client.create_field(field_params) }

    after do
      client.delete_field(response.dig(:field, :id))
    end

    it 'returns a field hash' do
      expect(response).to include_json(field: expected_field_response)
    end
  end

  describe '#show_field', :with_existing_text_field do
    subject(:response) { client.show_field(field_id) }

    it 'returns a field hash' do
      expect(response).to include_json(field: expected_field_response)
    end
  end

  # TODO:
  describe '#show_fields', :with_existing_text_field do
    subject(:response) { client.show_fields }

    it 'returns a field hash' do
      puts response
      expect(response).to include_json(fields: [expected_field_response])
    end
  end

  # TODO:
  describe '#update_user', :with_existing_user do
    subject(:response) { client.update_user(user_id, update_params) }

    let(:new_first_name) { 'Mika' }
    let(:new_last_name)  { 'Hel' }
    let(:new_email)      { 'mika@hel.de' }
    let(:new_username)   { 'mikahel' }
    let(:new_password)   { 'hokuspokus' }
    let(:update_params) do
      {
        first_name: new_first_name,
        last_name: new_last_name,
        email: new_email,
        group: group_id,
        username: new_username,
        password: new_password
      }
    end
    let(:expected_user_response) do
      update_params.except(:password, :group)
    end

    it 'returns a user hash' do
      expect(response).to include_json(user: expected_user_response)
    end
  end
end
