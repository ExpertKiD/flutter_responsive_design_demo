class PhoneSize {
  final double smallPhoneMaxWidth;
  final double mediumPhoneMaxWidth;
  final double largePhoneMaxWidth;

  final double smallPhoneMaxHeight;
  final double mediumPhoneMaxHeight;
  final double largePhoneMaxHeight;

  PhoneSize({
    required this.smallPhoneMaxWidth,
    required this.mediumPhoneMaxWidth,
    required this.largePhoneMaxWidth,
    required this.smallPhoneMaxHeight,
    required this.mediumPhoneMaxHeight,
    required this.largePhoneMaxHeight,
  });
}

class TabletSize {
  final double smallTabletMaxWidth;
  final double largeTabletMaxWidth;
  final double smallTabletMaxHeight;
  final double largeTabletMaxHeight;

  TabletSize({
    required this.smallTabletMaxWidth,
    required this.largeTabletMaxWidth,
    required this.smallTabletMaxHeight,
    required this.largeTabletMaxHeight,
  });
}

class ScreenSize {
  static final TabletSize portraitTablet = TabletSize(
    smallTabletMaxWidth: 720,
    largeTabletMaxWidth: 840,
    smallTabletMaxHeight: 1024,
    largeTabletMaxHeight: 1280,
  );
  static final TabletSize landscapeTablet = TabletSize(
    smallTabletMaxWidth: 1024,
    largeTabletMaxWidth: 1280,
    smallTabletMaxHeight: 720,
    largeTabletMaxHeight: 840,
  );

  static final PhoneSize portraitPhone = PhoneSize(
    smallPhoneMaxWidth: 360,
    mediumPhoneMaxWidth: 400,
    largePhoneMaxWidth: 600,
    smallPhoneMaxHeight: 600,
    mediumPhoneMaxHeight: 720,
    largePhoneMaxHeight: 960,
  );

  static final PhoneSize landscapePhone = PhoneSize(
    smallPhoneMaxWidth: 600,
    mediumPhoneMaxWidth: 720,
    largePhoneMaxWidth: 960,
    smallPhoneMaxHeight: 360,
    mediumPhoneMaxHeight: 400,
    largePhoneMaxHeight: 600,
  );
}
