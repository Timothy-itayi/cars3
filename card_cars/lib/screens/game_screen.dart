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
  late CarCard playerCard;
  late CarCard opponentCard;
  String? selectedStat;
  String result = "";
  bool showComparison = false;

  @override
  void initState() {
    super.initState();
    _initializeCards();
  }

  void _initializeCards() {
    playerCard = CarCard(
      name: "Apex X7",
      speed: 320,
      horsepower: 680,
      torque: 720,
      acceleration: 2.9,
      handling: 89,
    );

    opponentCard = CarCard(
      name: "Falcon GT",
      speed: 300,
      horsepower: 700,
      torque: 690,
      acceleration: 3.1,
      handling: 92,
    );

    selectedStat = null;
    result = "";
    showComparison = false;
  }

  void _onStatSelected(String stat) {
    final playerValue = _getStatValue(playerCard, stat);
    final opponentValue = _getStatValue(opponentCard, stat);

    setState(() {
      selectedStat = stat;
      showComparison = true;

      if (stat == "Acceleration") {
        result = playerValue < opponentValue ? "You Win!" : playerValue > opponentValue ? "You Lose!" : "It's a Draw!";
      } else {
        result = playerValue > opponentValue ? "You Win!" : playerValue < opponentValue ? "You Lose!" : "It's a Draw!";
      }

      debugPrint("Stat: $stat → You: $playerValue, Opponent: $opponentValue → $result");
    });
  }

  void _resetGame() {
    setState(() {
      _initializeCards();
    });
  }

  num _getStatValue(CarCard card, String stat) {
    switch (stat) {
      case 'Speed':
        return card.speed;
      case 'Horsepower':
        return card.horsepower;
      case 'Torque':
        return card.torque;
      case 'Acceleration':
        return card.acceleration;
      case 'Handling':
        return card.handling;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final stats = ['Speed', 'Horsepower', 'Torque', 'Acceleration', 'Handling'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: showComparison ? 1 : 0,
                child: Column(
                  children: [
                    const Text("Opponent's Car", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 200, child: AnimatedCarCard(card: opponentCard)),
                  ],
                ),
              ),

              const SizedBox(height: 2),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: 1,
                child: Column(
                  children: [
                    const Text("Your Car", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 200, child: AnimatedCarCard(card: playerCard)),
                  ],
                ),
              ),

              if (selectedStat != null)
                Text("Result: $result",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),

              const SizedBox(height: 20),

              if (!showComparison)
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: stats
                      .map((stat) => StatButton(
                            label: stat,
                            onPressed: () => _onStatSelected(stat),
                          ))
                      .toList(),
                ),

              if (showComparison)
                ElevatedButton.icon(
                  onPressed: _resetGame,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Play Again"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
