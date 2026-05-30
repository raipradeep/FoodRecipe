import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  const MealDetailScreen({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Detail')),
      body: Center(child: Text('Meal ID: $mealId')),
    );
  }
}