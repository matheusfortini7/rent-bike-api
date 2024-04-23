class ClientRepresenter
  def initialize(client)
    @client = client
  end

  def as_json
    {
      id:    @client.id,
      brand: @client.name,
      model: @client.phone,
      color: @client.address
    }
  end
end
