class ClientsRepresenter
  def initialize(clients)
    @clients = clients
  end

  def as_json
    @clients.map do |client|
      {
        id: client.id,
        brand: client.brand,
        model: client.model,
        color: client.color
      }
    end
  end
end
