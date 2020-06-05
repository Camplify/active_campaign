# frozen_string_literal: true

module ActiveCampaign
  module API
    #
    # Interface to contact tag endpoints
    #
    # @author Tim Chaston <timchaston@gmail.com>
    #
    module ContactTags
      #
      # Add a tag to a contact
      #
      # @param [Hash] params add a tag to a contact with this data
      # @param params [String] :contact ID of the contact you're adding the tag to
      # @param params [String] :tag ID of the tag to be added for the contact
      #
      # @return [Hash] a hash with the information of the newly created contact tag
      #
      def create_contact_tag(params)
        post('contactTags', contactTag: params)
      end

      #
      # Remove a tag from a contact
      #
      # @param [Integer] id the id of the contact tag to delete
      #
      # @return [Hash] an empty hash
      #
      def delete_contact_tag(id)
        delete("contactTags/#{id}")
      end
    end
  end
end
