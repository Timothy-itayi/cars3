import 'package:flutter/material.dart';
import '../models/car_card.dart';

class CarCardWidget extends StatelessWidget {
  final CarCard card;

  const CarCardWidget({required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              card.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            _buildStat('Speed', card.speed.toString()),
            _buildStat('Horsepower', card.horsepower.toString()),
            _buildStat('Torque', card.torque.toString()),
            _buildStat('0-100 km/h', '${card.acceleration}s'),
            _buildStat('Handling', card.handling.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
