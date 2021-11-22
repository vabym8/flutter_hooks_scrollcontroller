import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_test/hooks/scroll_controller_for_animation_hook.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hideFabAnimationController = useAnimationController(
      duration: kThemeAnimationDuration,
      initialValue: 1,
    );

    final scrollController = useScrollControllerForAnimation(
      hideFabAnimationController,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Scroll"),
      ),
      body: ListView(
        controller: scrollController,
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
        opacity: hideFabAnimationController,
        child: ScaleTransition(
          scale: hideFabAnimationController,
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Useless Floating Action Button'),
          ),
        ),
      ),
    );
  }
}
