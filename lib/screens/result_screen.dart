import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final int weight;
  final int height;
  final int age;
  final String gender;

  const ResultsScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    // BMI calculation
    final double heightInMeters = height / 100;
    final double bmi = weight / (heightInMeters * heightInMeters);

    // BMI classification
    String classification;

    if (bmi < 18.5) {
      classification = 'Underweight';
    } else if (bmi < 25) {
      classification = 'Normal Weight';
    } else if (bmi < 30) {
      classification = 'Overweight';
    } else if (bmi < 35) {
      classification = 'Obesity Class I';
    } else if (bmi < 40) {
      classification = 'Obesity Class II';
    } else {
      classification = 'Obesity Class III';
    }

    // Daily calories calculation
    double bmr;

    if (gender == 'Male') {
      bmr = (10 * weight) +
          (6.25 * height) -
          (5 * age) +
          5;
    } else {
      bmr = (10 * weight) +
          (6.25 * height) -
          (5 * age) -
          161;
    }

    final int calories = (bmr * 1.2).round();

    // Daily water
    final double water = weight * 0.035;

    // Macronutrients
    final double proteins = weight * 1.2;
    final double fats = calories * 0.30 / 9;
    final double carbohydrates =
        (calories - (proteins * 4) - (fats * 9)) / 4;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Results'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil(
                (route) => route.isFirst,
              );
            },
            child: const Text('Exit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Return'),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your calories needed per day : $calories calories',
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 20),

            Text(
              'Your BMI : ${bmi.toStringAsFixed(1)} - $classification',
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 20),

            Text(
              'Your water needed per day : ${water.toStringAsFixed(1)} Litres',
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 20),

            Text(
              'Your proteins needed per day : ${proteins.round()} g',
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 20),

            Text(
              'Your carbohydrates needed per day : ${carbohydrates.round()} g',
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 20),

            Text(
              'Your fats needed per day : ${fats.round()} g',
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}