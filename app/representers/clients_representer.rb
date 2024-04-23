class ClientsRepresenter
  def initialize(clients)
    @clients = clients
  end

  def as_json
    @clients.map do |client|
      {
        id: client.id,
        brand: client.name,
        model: client.phone,
        color: client.address
      }
    end
  end
end
