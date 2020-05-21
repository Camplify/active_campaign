# frozen_string_literal: true

module ActiveCampaign
  module API
    #
    # Interface to custom field value endpoints
    #
    # @author Tim Chaston <timchaston@gmail.com>
    #
    module CustomFieldValues
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
        put("fieldValues/#{id}")
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
      # @option [String] filters_field_id the id of the field the value belongs to
      # @option [String] filters_val the value of the custom field for a specify contact
      #
      def show_field_values(filters_field_id = nil, filters_val = nil)
        # TODO: check that all of this is legit
        query_string = "?"
        query_string += "filters[fieldId]=#{filters_field_id}" if filters_field_id
        query_string += "filters[val]=#{filters_val}" if filters_val
        query_string = "" if query_string == "?"

        get('fieldValues#{query_string}')
      end
    end
  end
end
