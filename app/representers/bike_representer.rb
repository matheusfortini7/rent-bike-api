class BikeRepresenter
  def initialize(bike)
    @bike = bike
  end

  def as_json
    {
      brand: @bike.brand,
      model: @bike.model,
      color: @bike.color
    }
  end
end
