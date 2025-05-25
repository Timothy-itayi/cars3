// opponent animated car

import 'package:flutter/material.dart';
import '../models/car_card.dart';
import 'car_card_widget.dart';

class AnimatedCarCard extends StatefulWidget {
  final CarCard card;

  const AnimatedCarCard({super.key, required this.card});

  @override
  State<AnimatedCarCard> createState() => _AnimatedCarCardState();
}

class _AnimatedCarCardState extends State<AnimatedCarCard>
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



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Back card fades in as animation progresses
        FadeTransition(
          opacity: _animation,
          
        ),

        // Front card fades out as animation progresses
        FadeTransition(
          opacity: ReverseAnimation(_animation),
          
        ),
      ],
    );
  }
}
