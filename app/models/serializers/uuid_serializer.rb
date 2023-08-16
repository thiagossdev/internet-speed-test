class UUIDSerializer
  def self.parse_uuid_string(str)
    case str.size
    when 16 then uuid = UUIDTools::UUID.parse_raw(str)
    when 32 then uuid = UUIDTools::UUID.parse_hexdigest(str)
    when 36 then uuid = UUIDTools::UUID.parse(str)
    end
  ensure
    unless uuid # Guard for both exceptions and nil return values
      raise ArgumentError, "Expected string which is 16, 32, or 36 " +
        "characters long, and represents UUID, but #{str.inspect} was given"
    end
  end

  def self.cast_to_uuid(value)
    case value
    when UUIDTools::UUID, nil
      value
    when String
      parse_uuid_string(value)
    else
      m = "UUID, String, or nil required, but '#{value.inspect}' was given"
      raise ArgumentError, m
    end
  end

  # Serializes an UUID value to a raw of bytes that will be stored in the database.
  def self.dump(value)
    case value
    when UUIDTools::UUID, nil
      value.raw
    when String
      parse_uuid_string(value).raw
    else
      m = "UUID, String, or nil required, but '#{value.inspect}' was given"
      raise ArgumentError, m
    end
  end

  # Deserializes a raw of bytes from the database to an UUID value.
  def self.load(value)
    uuid = cast_to_uuid(value)
    uuid.to_s
  end

  private_class_method :parse_uuid_string
  private_class_method :cast_to_uuid
end