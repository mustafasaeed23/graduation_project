import 'package:flutter/material.dart';

class FeatureCardsScreen extends StatelessWidget {
  final List<_FeatureCardData> features = [
    _FeatureCardData(
      icon: Icons.videocam,
      title: 'Video Preview',
      subtitle: 'AI-generated content',
    ),
    _FeatureCardData(
      icon: Icons.auto_fix_high,
      title: 'Magic Edit',
      subtitle: 'One-click automation',
    ),
    _FeatureCardData(
      icon: Icons.smart_toy,
      title: 'AI Processing',
      subtitle: 'Smart optimization',
    ),
  ];

   FeatureCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF111111), Color(0xFF222200)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: features
                .map((feature) => FeatureCard(data: feature))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _FeatureCardData {
  final IconData icon;
  final String title;
  final String subtitle;

  _FeatureCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class FeatureCard extends StatelessWidget {
  final _FeatureCardData data;

  const FeatureCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.transparent],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.yellow.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(data.icon, color: Colors.yellow),
          const SizedBox(height: 10),
          Text(
            data.title,
            style: const TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}