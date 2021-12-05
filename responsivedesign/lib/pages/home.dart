import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(
      builder: (ctx, orientation) {
        return orientation == Orientation.portrait
            ? _buildPortraitLayout()
            : _buildLandscapeLayout();
      },
    ));
  }

  Widget _buildLandscapeLayout() {
    return const Center(child: Text("Landscape"));
  }

  Widget _buildPortraitLayout() {
    return const Center(child: Text("Portrait"));
  }
}
