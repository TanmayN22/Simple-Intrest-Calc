import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Interest Calculator',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController intrestController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  double? result;

  void calculation() {
    final double? principal = double.tryParse(principalController.text);
    final double? intrest = double.tryParse(intrestController.text);
    final double? time = double.tryParse(timeController.text);

    if (principal != null && intrest != null && time != null) {
      setState(() {
        result = (principal * intrest * time) / 100;
      });
    } else {
      setState(() {
        result = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Calculator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          // Added SingleChildScrollView
          child: SizedBox(
            height: 400,
            width: 600,
            child: Column(
              children: [
                Card(
                  color: const Color.fromARGB(255, 39, 39, 37),
                  child: Column(
                    children: [
                      CustomText(
                        labelText: 'Principal',
                        hintText: 'Enter your principal amount',
                        controller: principalController,
                      ),
                      CustomText(
                        hintText: 'Enter your interest rate per annum',
                        labelText: 'Interest',
                        controller: intrestController,
                      ),
                      CustomText(
                        hintText: 'Enter time in years',
                        labelText: 'Time',
                        controller: timeController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: calculation,
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.black45),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                if (result != null)
                  Text(
                    'Simple Interest: Rs.${result}',
                    style: const TextStyle(fontSize: 24, color: Colors.black87),
                  )
                else
                  const Text(
                    'Please enter valid numbers',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  const CustomText({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 0),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 22),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
