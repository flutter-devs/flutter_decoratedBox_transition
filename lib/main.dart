import 'package:flutter/material.dart';
import 'package:flutter_decoratedbox_transition_example/splash_screen.dart';
import 'automatic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class DecoratedBoxTransitionWidget extends StatefulWidget {
  const DecoratedBoxTransitionWidget({Key? key}) : super(key: key);

  @override
  _DecoratedBoxTransitionWidgetState createState() =>
      _DecoratedBoxTransitionWidgetState();
}

class _DecoratedBoxTransitionWidgetState extends State
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _initial = true;
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.black45,
        style: BorderStyle.solid,
        width: 3.0,
      ),
      shape: BoxShape.circle,
      boxShadow: const [
        BoxShadow(
          color: Colors.black87,
          blurRadius: 10.0,
          spreadRadius: 4.0,
        )
      ],
    ),
    end: BoxDecoration(
      color: Colors.black,
      border: Border.all(
        color: Colors.black87,
        style: BorderStyle.solid,
        width: 1.0,
      ),
      shape: BoxShape.circle,
      // No shadow.
    ),
  );

  @override
  initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decorated Box Transition Example"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBoxTransition(
              position: DecorationPosition.background,
              decoration: decorationTween.animate(_animationController),
              child: Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(50),
                child: Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    'assets/flutter.png',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                if (_initial) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                _initial = !_initial;
              },
              child: const Text(
                "Tap To Change Transition!",
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text('Transition to Automatic Decorated Box'),
            )
          ],
        ),
      ),
    );
  }
}