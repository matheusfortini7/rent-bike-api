class ClientRepresenter
  def initialize(client)
    @client = client
  end

  def as_json
    {
      id:    @client.id,
      brand: @client.brand,
      model: @client.model,
      color: @client.color
    }
  end
end
