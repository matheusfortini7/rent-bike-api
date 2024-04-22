class BikesRepresenter
  def initialize(bikes)
    @bikes = bikes
  end

  def as_json
    @bikes.map do |bike|
      {
        brand: bike.brand,
        model: bike.model,
        color: bike.color
      }
    end
  end
end
