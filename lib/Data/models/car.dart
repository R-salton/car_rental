class Car {
  final String model;
  final double pricePerHour;
  final double fuelCapacity;
  final double distance;
  final String imageUrl;

  Car(this.model, this.pricePerHour, this.fuelCapacity, this.distance,
      this.imageUrl);

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
     data['name'] ?? '',
      data['price']?.toDouble() ?? 0.0,
      data['mileage']?.toDouble() ?? 0.0,
      data['speed']?.toDouble() ?? 0.0,
      data['imageUrl'] ?? '',
    );
  }
}
