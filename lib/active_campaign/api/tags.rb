# frozen_string_literal: true

module ActiveCampaign
  module API
    #
    # Interface to contact tag endpoints
    #
    # @author Tim Chaston <timchaston@gmail.com>
    #
    module Tags
      #
      # Create a tag
      #
      # @param [Hash] params create a tag with this data
      # @param params [String] :tag Name of the new tag
      # @param params [String] :tagType Tag-type of the new tag. Possible values: template, contact
      # @param params [String] :description Description of the new tag
      #
      # @return [Hash] a hash with the information of the newly created tag
      #
      def create_contact_tag(params)
        post('tags', tag: params)
      end

      # TODO:
      def show_tag
      end

      # TODO:
      def show_tags
      end

      # TODO:
      def update_tag
      end

      #
      # Delete a tag
      #
      # @param [Integer] id the id of the contact tag to delete
      #
      # @return [Hash] an empty hash
      #
      def delete_contact_tag(id)
        delete("tags/#{id}")
      end
    end
  end
end
