class CarCard {
  final String name;
  final int speed;
  final int horsepower;
  final int torque;
  final double acceleration; // 0–100 km/h
  final int handling;

  CarCard({
    required this.name,
    required this.speed,
    required this.horsepower,
    required this.torque,
    required this.acceleration,
    required this.handling,
  });
}
