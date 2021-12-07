import 'package:flutter/material.dart';

import '../main.dart';

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
        log.d(constraints);

        if (constraints.maxWidth < 840 && constraints.maxHeight < 600) {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("mw<840-mh<600-landscape-phone"),
              Text(
                  "Screen size: (${MediaQuery.of(context).size.width.toStringAsFixed(2)}, ${MediaQuery.of(context).size.height.toStringAsFixed(2)})"),
              Text(
                  "Screen Constraint size: (${constraints.minWidth}<=w<=${constraints.maxWidth.toStringAsFixed(2)}, ${constraints.minHeight}<=h<=${constraints.maxHeight.toStringAsFixed(2)})")
            ]),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("sw840-landscape-tablet"),
                Text(
                    "Screen size: (${MediaQuery.of(context).size.width.toStringAsFixed(2)}, ${MediaQuery.of(context).size.height.toStringAsFixed(2)})"),
                Text(
                    "Screen Constraint size: (${constraints.minWidth}<=w<=${constraints.maxWidth.toStringAsFixed(2)}, ${constraints.minHeight}<=h<=${constraints.maxHeight.toStringAsFixed(2)})")
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildPortraitLayout() {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("mw<600dp-portrait-phone"),
            Text(
                "Screen size: (${MediaQuery.of(context).size.width.toStringAsFixed(2)}, ${MediaQuery.of(context).size.height.toStringAsFixed(2)})"),
            Text(
                "Screen Constraint size: (${constraints.minWidth}<=w<=${constraints.maxWidth.toStringAsFixed(2)}, ${constraints.minHeight}<=h<=${constraints.maxHeight.toStringAsFixed(2)})")
          ]),
        );
      } else {
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("sw600dp-portrait-tablet"),
            Text(
                "Screen size: (${MediaQuery.of(context).size.width.toStringAsFixed(2)}, ${MediaQuery.of(context).size.height.toStringAsFixed(2)})"),
            Text(
                "Screen Constraint size: (${constraints.minWidth}<=w<=${constraints.maxWidth.toStringAsFixed(2)}, ${constraints.minHeight}<=h<=${constraints.maxHeight.toStringAsFixed(2)})")
          ]),
        );
      }
    });
  }
}
