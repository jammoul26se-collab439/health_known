import 'dart:async';
import 'package:flutter/material.dart';
import 'result_screen.dart';

class SecondLoadingScreen extends StatefulWidget {
  final int weight;
  final int height;
  final int age;
  final String gender;

  const SecondLoadingScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });

  @override
  State<SecondLoadingScreen> createState() =>
      _SecondLoadingScreenState();
}

class _SecondLoadingScreenState extends State<SecondLoadingScreen> {
  final List<String> loadingTexts = [
    'Loading ...',
    'Loading .',
    'Loading ..',
    'Loading ...',
  ];

  int currentIndex = 0;
  int repetitions = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        setState(() {
          currentIndex++;

          if (currentIndex == 4) {
            currentIndex = 0;
            repetitions++;
          }
        });

        if (repetitions == 3) {
          timer.cancel();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsScreen(
                weight: widget.weight,
                height: widget.height,
                age: widget.age,
                gender: widget.gender,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Stack(
          children: [
            Center(
              child: Text(
                loadingTexts[currentIndex],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(12),

                  child: const Text(
                    'By Jawad Jammoul',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}