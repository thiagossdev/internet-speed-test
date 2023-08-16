require 'serializers/uuid_serializer'

class Place < ApplicationRecord
  attr_readonly :external_id
  attribute :external_id, :binary, default: -> { SecureRandom.uuid }
  serialize :external_id, UUIDSerializer

  def self.find_by_external_id!(external_id)
    place = find_by(external_id: external_id)
    raise ActiveRecord::RecordNotFound, "Couldn't find Place with external_id=#{external_id}" unless place
    place
  end
end
