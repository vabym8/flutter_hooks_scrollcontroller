import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _hideFabAnimationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _hideFabAnimationController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
      value: 1,
    );

    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          _hideFabAnimationController.forward();
          break;
        case ScrollDirection.reverse:
          _hideFabAnimationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Scroll"),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          for (int i = 0; i < 5; i++)
            const Card(
              child: FittedBox(
                child: FlutterLogo(),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FadeTransition(
        opacity: _hideFabAnimationController,
        child: ScaleTransition(
          scale: _hideFabAnimationController,
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Useless Floating Action Button'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _hideFabAnimationController.dispose();
    super.dispose();
  }
}
