import 'package:flutter/material.dart';
import 'second_loading_screen.dart';
import '../widgets/click_sound.dart';

class RequirementScreen extends StatefulWidget {
  const RequirementScreen({super.key});

  @override
  State<RequirementScreen> createState() => _RequirementScreenState();
}

class _RequirementScreenState extends State<RequirementScreen> {
  int? weight;
  int? height;
  int? age;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requirement'),
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text('Enter your weight:'),

            DropdownButton<int>(
              value: weight,
              hint: const Text('Select weight'),
              isExpanded: true,

              items: List.generate(161, (i) => i + 40)
                  .map((v) => DropdownMenuItem(
                        value: v,
                        child: Text('$v kg'),
                      ))
                  .toList(),

              onChanged: (v) {
                setState(() {
                  weight = v;
                });
              },
            ),

            const SizedBox(height: 15),

            const Text('Enter your height:'),

            DropdownButton<int>(
              value: height,
              hint: const Text('Select height'),
              isExpanded: true,

              items: List.generate(121, (i) => i + 100)
                  .map((v) => DropdownMenuItem(
                        value: v,
                        child: Text('$v cm'),
                      ))
                  .toList(),

              onChanged: (v) {
                setState(() {
                  height = v;
                });
              },
            ),

            const SizedBox(height: 15),

            const Text('Enter your age:'),

            DropdownButton<int>(
              value: age,
              hint: const Text('Select age'),
              isExpanded: true,

              items: List.generate(91, (i) => i + 10)
                  .map((v) => DropdownMenuItem(
                        value: v,
                        child: Text('$v'),
                      ))
                  .toList(),

              onChanged: (v) {
                setState(() {
                  age = v;
                });
              },
            ),

            const SizedBox(height: 15),

            const Text('Enter your gender:'),

            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (v) {
                    setState(() {
                      gender = v;
                    });
                  },
                ),

                const Text('Male'),

                Radio<String>(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (v) {
                    setState(() {
                      gender = v;
                    });
                  },
                ),

                const Text('Female'),
              ],
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await ClickSound.play();

                      if (weight == null ||
                          height == null ||
                          age == null ||
                          gender == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please complete all requirements!',
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SecondLoadingScreen(
                              weight: weight!,
                              height: height!,
                              age: age!,
                              gender: gender!,
                            ),
                          ),
                        );
                      }
                    },

                    child: const Text('Continue'),
                  ),
                ),

                const SizedBox(width: 5),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      await ClickSound.play();

                      setState(() {
                        weight = null;
                        height = null;
                        age = null;
                        gender = null;
                      });
                    },

                    child: const Text('Clear'),
                  ),
                ),

                const SizedBox(width: 5),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      await ClickSound.play();

                      Navigator.of(context).pop();
                    },

                    child: const Text('Exit'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}