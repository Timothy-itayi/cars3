import 'package:flutter/material.dart';
import 'learn_screen.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  static const double imageSize = 60;

  static const List<String> carLogos = [
    // URLs with higher resolution params (remove h=60&w=60 so Flutter gets natural size and scales cleanly)
    'https://images.pexels.com/photos/18920438/pexels-photo-18920438.jpeg?auto=compress&cs=tinysrgb', // Ferrari
    'https://images.pexels.com/photos/26954172/pexels-photo-26954172/free-photo-of-lamborghini-logo-badge-on-hood-of-black-glossy-sports-car.jpeg?auto=compress&cs=tinysrgb', // BMW
    'https://images.pexels.com/photos/5534978/pexels-photo-5534978.jpeg?auto=compress&cs=tinysrgb', // BMW emblem
    'https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb', // Audi
    'https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb', // Mercedes
    'https://images.pexels.com/photos/163774/star-vehicle-pkw-mercedes-163774.jpeg?auto=compress&cs=tinysrgb', // Audi again
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '🚗 Turn the Corner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),

                SizedBox(
                  height: 3 * (imageSize + 16),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: carLogos.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        carLogos[index],
                        height: imageSize,
                        width: imageSize,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high, // <-- improves image rendering quality
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),
                const Text(
                  'Compare stats to win.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LearnScreen()),
                    );
                  },
                  child: const Text(
                    'How to Play',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
