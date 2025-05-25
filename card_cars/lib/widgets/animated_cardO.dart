import 'package:card_cars/widgets/car_card_widget.dart' show OpponentCarCardWidget;
import 'package:flutter/material.dart';
import '../models/car_card.dart';


class AnimatedOpponentCarCard extends StatefulWidget {
  final CarCard card;

  const AnimatedOpponentCarCard({super.key, required this.card});

  @override
  State<AnimatedOpponentCarCard> createState() => _AnimatedOpponentCarCardState();
}

class _AnimatedOpponentCarCardState extends State<AnimatedOpponentCarCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggleCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFront() {
    return GestureDetector(
      onTap: _toggleCard,
      child: SizedBox(
        height: 100,
        child: Card(
          color: Colors.teal.shade600,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 1,
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                "Tap to Reveal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBack() {
    return GestureDetector(
      onTap: _toggleCard,
      child: OpponentCarCardWidget(card: widget.card),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeTransition(
          opacity: _animation,
          child: _buildBack(),
        ),
        FadeTransition(
          opacity: ReverseAnimation(_animation),
          child: _buildFront(),
        ),
      ],
    );
  }
}
