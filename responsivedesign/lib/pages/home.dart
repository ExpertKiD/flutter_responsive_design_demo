import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(
      builder: (ctx, orientation) {
        return orientation == Orientation.portrait
            ? _portraitOrientaitonWidget()
            : _landscapeOrientaitonWidget();
      },
    ));
  }

  Widget _landscapeOrientaitonWidget() {
    return const Center(child: Text("Landscape"));
  }

  Widget _portraitOrientaitonWidget() {
    return const Center(child: Text("Portrait"));
  }
}
