# frozen_string_literal: true

module ActiveCampaign
  module API
    #
    # Interface to custom field value endpoints
    #
    # @author Tim Chaston <timchaston@gmail.com>
    #
    module FieldValues
      #
      # Create a custom field value
      #
      # @param [Hash] params create a new custom field value with this data
      # @param params [String] :contact ID of the contact whose field value you're updating
      # @param params [String] :field ID of the custom field whose value you're updating for the contact
      # @param params [String] :value Value for the field that you're updating. For multi-select options this needs to be in the format of ||option1||option2||
      #
      # @return [Hash] a hash with the information of the newly created field value and the contact it was created on
      #
      def create_field_value(params)
        post('fieldValues', fieldValue: params)
      end

      #
      # Retrieve a custom field value
      #
      # @param [Integer] id the id of the custom field value to show
      #
      # @return [Hash] a hash with the information of the custom field value
      #
      def show_field_value(id)
        get("fieldValues/#{id}")
      end

      #
      # Update a custom field value for contact
      #
      # @param [Integer] id the id of the custom field value to update
      # @param [Hash] params update the custom field value with this data
      # @param params [String] :contact the id of the contact whose field value you're updating
      # @param params [String] :field the id of the custom field whose value you're updating for the contact
      # @param params [String] :value the value for the field that you're updating
      #
      # @return [Hash] a hash with the information of the contact and the custom field value
      #
      def update_field_value(id, params)
        put("fieldValues/#{id}", field_value: params)
      end

      #
      # Delete a custom field value
      #
      # @param [Integer] id the id of the custom field value to delete
      #
      # @return [Hash]
      #
      def delete_field_value(id)
        delete("fieldValues/#{id}")
      end

      #
      # List all custom field values
      #
      # @option [Hash] filters a list
      # @option filter [String] :fieldid the id of the field the value belongs to
      # @option filter [String] :val the value of the custom field for a specify contact
      #
      def show_field_values(filters: {}, **params)
        params[:filters] = filters if filters.any?
        get('fieldValues', params)
      end
    end
  end
end
