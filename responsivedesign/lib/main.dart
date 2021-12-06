import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'app/app.dart';

final log = Logger();
const enableDevicePreview = false;

void main() {
  if (enableDevicePreview) {
    runApp(DevicePreview(
      builder: (builder) => const MyApp(),
      enabled: !kReleaseMode,
    ));
  } else {
    runApp(const MyApp());
  }
}
