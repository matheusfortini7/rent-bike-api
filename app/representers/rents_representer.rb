class RentsRepresenter
  def initialize(rents)
    @rents = rents
  end

  def as_json
    @rents.map do |rent|
      {
        id: rent.id,
        start_date: rent.start_date,
        end_date: rent.end_date,
        value: rent.value,
        local: rent.local,
        bike_id: rent.bike_id,
        client_id: rent.client_id
      }
    end
  end
end
