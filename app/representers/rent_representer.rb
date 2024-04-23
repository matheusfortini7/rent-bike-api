class RentRepresenter
  def initialize(rent)
    @rent = rent
  end

  def as_json
    {
      id: @rent.id,
      start_date: @rent.start_date,
      end_date: @rent.end_date,
      value: @rent.value,
      local: @rent.local,
      bike_id: @rent.bike_id,
      client_id: @rent.client_id
    }
  end
end
