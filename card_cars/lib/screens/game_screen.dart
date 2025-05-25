import 'package:flutter/material.dart';
import '../widgets/stat_button.dart';
import '../models/car_card.dart';
import '../widgets/animated_card.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String? _selectedStat;
  String? _selectedValue;

  // Dummy car data
  final CarCard dummyCar = CarCard(
    name: "Apex X7",
    speed: 320,
    horsepower: 680,
    torque: 720,
    acceleration: 2.9,
    handling: 89,
  );

  void _onStatSelected(String stat) {
    try {
      setState(() {
        _selectedStat = stat;
        _selectedValue = _getStatValue(stat);
      });
      debugPrint("Selected stat: $stat -> Value: $_selectedValue");
    } catch (e, stackTrace) {
      debugPrint("Error selecting stat: $e");
      debugPrint("Stack trace: $stackTrace");
    }
  }

  String _getStatValue(String stat) {
    switch (stat) {
      case 'Speed':
        return dummyCar.speed.toString();
      case 'Horsepower':
        return dummyCar.horsepower.toString();
      case 'Torque':
        return dummyCar.torque.toString();
      case 'Acceleration':
        return '${dummyCar.acceleration}s';
      case 'Handling':
        return dummyCar.handling.toString();
      default:
        throw ArgumentError('Unknown stat: $stat');
    }
  }

  @override
  Widget build(BuildContext context) {
    final stats = ['Speed', 'Horsepower', 'Torque', 'Acceleration', 'Handling'];

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Your Car",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              SizedBox(
                height: 350,
                width: double.infinity,
                child: AnimatedCarCard(card: dummyCar),
              ),

              // Show selected stat value if available
              if (_selectedStat != null && _selectedValue != null)
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      "Selected: $_selectedStat",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      _selectedValue!,
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: stats.map((stat) {
                  final isSelected = stat == _selectedStat;
                  return StatButton(
                    label: stat,
                    onPressed: () => _onStatSelected(stat),
                    isSelected: isSelected,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
