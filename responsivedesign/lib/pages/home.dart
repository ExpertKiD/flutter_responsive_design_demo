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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 840) {
          return const Center(
            child: Text("mw840-landscape-phone"),
          );
        } else {
          return const Center(
            child: Text("sw840-landscape-tablet"),
          );
        }
      },
    );
  }

  Widget _buildPortraitLayout() {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const Center(child: Text("mw600dp-portrait-phone"));
      } else {
        return const Center(child: Text("sw600dp-portrait-tablet"));
      }
    });
  }
}
