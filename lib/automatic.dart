import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final DecorationTween _decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(offset: Offset(0, 0), blurRadius: 30, spreadRadius: 0)
          ],
          border: Border.all(width: 10, color: Colors.orange)),
      end: BoxDecoration(
          color: Colors.purple,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(offset: Offset(20, 20), blurRadius: 30, spreadRadius: 0)
          ],
          border: Border.all(width: 50, color: Colors.red)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decorated Box Transition"),
        leading: GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(5),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/flutter.png',
                  scale: 2.5,
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: DecoratedBoxTransition(
                decoration: _decorationTween.animate(_controller),
                child:  const SizedBox(
                  width: 250,
                  height: 250,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
