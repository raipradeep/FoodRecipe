import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/meal.dart';
import '../widgets/meal_card.dart';

class MealListScreen extends StatefulWidget {
  final String category;

  const MealListScreen({super.key, required this.category});

  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  List<Meal> meals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.category}'
        ),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          meals = (data['meals'] as List).map((e) => Meal.fromJson(e)).toList();
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        foregroundColor: Colors.white,
      ),
      body
          : isLoading ? const Center(child: CircularProgressIndicator())
          : meals.isEmpty ? const Center(child: Text("No Meal Found"))
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return MealListItem(
              meals : meal,
              onTap : () {
                /*Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) => MealDetailScreen(mealId: meal.idMeal)),
                );*/
              }
          );
        },
      ),
    );
  }
}
