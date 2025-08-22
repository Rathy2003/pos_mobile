import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 330,
          height: 230,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(131, 107, 155, 209),
              width: 15,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 85,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(width: 48),
              SizedBox(
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => incrementCounter(),
                      icon: Icon(Icons.arrow_drop_up, size: 80),
                    ),

                    IconButton(
                      onPressed: () => decrementCounter(),
                      icon: Icon(Icons.arrow_drop_down, size: 80),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
