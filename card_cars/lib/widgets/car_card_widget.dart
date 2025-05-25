import 'package:flutter/material.dart';
import '../models/car_card.dart';

// Player's card - your existing one, larger
class PlayerCarCardWidget extends StatelessWidget {
  final CarCard card;
  final bool isBack;

  const PlayerCarCardWidget({
    required this.card,
    this.isBack = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isBack) {
      return SizedBox(
        height: 00,
        child: Card(
          color: Colors.grey.shade800,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 2,
          child: Center(
            child: Text(
              "Car Card Back",
              style: TextStyle(color: Colors.white70, fontSize: 24),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 300,
      child: Card(
        color: Colors.blueGrey.shade900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildStat('Speed', card.speed.toString()),
              _buildStat('Horsepower', card.horsepower.toString()),
              _buildStat('Torque', card.torque.toString()),
              _buildStat('0-100 km/h', '${card.acceleration}s'),
              _buildStat('Handling', card.handling.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
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

// Opponent's smaller card widget
class OpponentCarCardWidget extends StatelessWidget {
  final CarCard card;
  final bool isBack;

  const OpponentCarCardWidget({
    required this.card,
    this.isBack = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isBack) {
      return SizedBox(
        height: 40,
        child: Card(
          color: Colors.grey.shade800,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: Center(
            child: Text(
              "Car Card Back",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 250,
      child: Card(
        color: Colors.blueGrey.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                card.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              _buildStat('Speed', card.speed.toString()),
              _buildStat('Horsepower', card.horsepower.toString()),
              _buildStat('Torque', card.torque.toString()),
              _buildStat('0-100 km/h', '${card.acceleration}s'),
              _buildStat('Handling', card.handling.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
