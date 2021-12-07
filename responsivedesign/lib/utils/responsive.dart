import 'package:flutter/cupertino.dart';
import 'package:responsivedesign/utils/sizes.dart';

class ResponsiveWidget extends StatelessWidget {
  final bool portraitOnly;
  final bool isResponsive;
  final bool useBreakpoints;
  final bool usePortraitWidgetsForLandscape;

  // For responsive!=true and portraitOnly==true
  late final Widget _child;

  // For responsive!=true and portraitOnly!=false
  late final Widget _portraitWidget;
  late final Widget _landscapeWidget;

  // For responsive==true and portraitOnly==false
  late final Widget _smallPhoneLandscapeWidget;
  late final Widget _mediumPhoneLandscapeWidget;
  late final Widget _largePhoneLandscapeWidget;
  late final Widget _smallTabletLandscapeWidget;
  late final Widget _largeTabletLandscapeWidget;

  // For responsive==true and portraitOnly==true
  late final Widget _smallPhonePortraitWidget;
  late final Widget _mediumPhonePortraitWidget;
  late final Widget _largePhonePortraitWidget;
  late final Widget _smallTabletPortraitWidget;
  late final Widget _largeTabletPortraitWidget;

  factory ResponsiveWidget.withBreakpoints({
    Key? key,
    bool portraitOnly = false,
    bool usePortraitWidgetsForLandscape = false,
    Widget? child,
    Widget? portraitWidget,
    Widget? landscapeWidget,
    Widget? smallPhoneLandscapeWidget,
    Widget? mediumPhoneLandscapeWidget,
    Widget? largePhoneLandscapeWidget,
    Widget? smallTabletLandscapeWidget,
    Widget? largeTabletLandscapeWidget,
    Widget? smallPhonePortraitWidget,
    Widget? mediumPhonePortraitWidget,
    Widget? largePhonePortraitWidget,
    Widget? smallTabletPortraitWidget,
    Widget? largeTabletPortraitWidget,
  }) {
    return ResponsiveWidget.builder(
      key: key,
      portraitOnly: portraitOnly,
      isResponsive: true,
      useBreakpoints: true,
      usePortraitWidgetsForLandscape: usePortraitWidgetsForLandscape,
      smallPhoneLandscapeWidget: smallPhoneLandscapeWidget,
      mediumPhoneLandscapeWidget: mediumPhoneLandscapeWidget,
      largePhoneLandscapeWidget: largePhoneLandscapeWidget,
      smallTabletLandscapeWidget: smallTabletLandscapeWidget,
      largeTabletLandscapeWidget: largeTabletLandscapeWidget,
      smallPhonePortraitWidget: smallPhonePortraitWidget,
      mediumPhonePortraitWidget: mediumPhonePortraitWidget,
      largePhonePortraitWidget: largePhonePortraitWidget,
      smallTabletPortraitWidget: smallTabletPortraitWidget,
      largeTabletPortraitWidget: largeTabletPortraitWidget,
    );
  }

  ResponsiveWidget.builder({
    Key? key,
    this.portraitOnly = false,
    this.isResponsive = true,
    this.useBreakpoints = false,
    this.usePortraitWidgetsForLandscape = false,
    Widget? child,
    Widget? portraitWidget,
    Widget? landscapeWidget,
    Widget? smallPhoneLandscapeWidget,
    Widget? mediumPhoneLandscapeWidget,
    Widget? largePhoneLandscapeWidget,
    Widget? smallTabletLandscapeWidget,
    Widget? largeTabletLandscapeWidget,
    Widget? smallPhonePortraitWidget,
    Widget? mediumPhonePortraitWidget,
    Widget? largePhonePortraitWidget,
    Widget? smallTabletPortraitWidget,
    Widget? largeTabletPortraitWidget,
  }) : super(key: key) {
    if (useBreakpoints) {
      // If useBreakpoints is true
      assert(useBreakpoints == true,
          "Breakpoints has to be enabled. Smaller screens will be used as replacement for bigger screens. Breakpoints will be applied as per order from small screen to big screens.");

      assert(
          smallPhonePortraitWidget != null ||
              mediumPhonePortraitWidget != null ||
              largePhonePortraitWidget != null ||
              smallTabletPortraitWidget != null ||
              largeTabletPortraitWidget != null,
          "At least one breakpoint widget must be provided for portrait mode");

      // Temporary variables to store breakpoint updated widgets
      Widget? tmpSmallPhoneWidget,
          tmpMediumPhoneWidget,
          tmpLargePhoneWidget,
          tmpSmallTabletWidget,
          tmpLargeTabletWidget;

      assert(smallPhonePortraitWidget != null,
          "smallPhonePortraitWidget must be provided");

      // For portrait mode, update widgets according to breakpoints
      if (smallPhonePortraitWidget != null) {
        tmpSmallPhoneWidget = smallPhonePortraitWidget;
        tmpMediumPhoneWidget =
            mediumPhonePortraitWidget ?? smallPhonePortraitWidget;
        tmpLargePhoneWidget =
            largePhonePortraitWidget ?? smallPhonePortraitWidget;
        tmpSmallTabletWidget =
            smallTabletPortraitWidget ?? smallPhonePortraitWidget;
        tmpLargeTabletWidget =
            largeTabletPortraitWidget ?? smallPhonePortraitWidget;
      }

      if (mediumPhonePortraitWidget != null) {
        tmpLargePhoneWidget =
            largePhonePortraitWidget ?? mediumPhonePortraitWidget;
        tmpSmallTabletWidget =
            smallTabletPortraitWidget ?? mediumPhonePortraitWidget;
        tmpLargeTabletWidget =
            largeTabletPortraitWidget ?? mediumPhonePortraitWidget;
      }

      if (largePhonePortraitWidget != null) {
        tmpSmallTabletWidget =
            smallTabletPortraitWidget ?? largePhonePortraitWidget;
        tmpLargeTabletWidget =
            largeTabletPortraitWidget ?? largePhonePortraitWidget;
      }

      if (smallTabletPortraitWidget != null) {
        tmpLargeTabletWidget =
            largeTabletPortraitWidget ?? smallTabletPortraitWidget;
      }

      // assign temp to original widgets
      smallPhonePortraitWidget = tmpSmallPhoneWidget;
      mediumPhonePortraitWidget = tmpMediumPhoneWidget;
      largePhonePortraitWidget = tmpLargePhoneWidget;
      smallTabletPortraitWidget = tmpSmallTabletWidget;
      largeTabletPortraitWidget = tmpLargeTabletWidget;

      if (portraitOnly == false) {
        assert(portraitOnly == false,
            "portraitOnly can't be true. Landscape mode must be supported here.");

        // If landscape mode is supported
        if (usePortraitWidgetsForLandscape == true) {
          // If usePortraitWidgetsForLandscape == true, use portrait widgets for landscape according to breakpoints for landscape
          smallPhoneLandscapeWidget = smallPhonePortraitWidget;
          mediumPhoneLandscapeWidget = mediumPhonePortraitWidget;
          largePhoneLandscapeWidget = largePhonePortraitWidget;
          smallTabletLandscapeWidget = smallTabletPortraitWidget;
          largeTabletLandscapeWidget = largeTabletPortraitWidget;
        } else {
          assert(usePortraitWidgetsForLandscape != true,
              "usePortraitWidgetsForLandscape must be false");

          // Temporary variables to store breakpoint updated widgets
          Widget? tmpSmallPhoneWidget1,
              tmpMediumPhoneWidget1,
              tmpLargePhoneWidget1,
              tmpSmallTabletWidget1,
              tmpLargeTabletWidget1;

          assert(
              smallPhoneLandscapeWidget != null ||
                  mediumPhoneLandscapeWidget != null ||
                  largePhoneLandscapeWidget != null ||
                  smallTabletLandscapeWidget != null ||
                  largeTabletLandscapeWidget != null,
              "At least one breakpoint widget must be provided for landscape mode");

          // For landscape mode, update widgets according to breakpoints
          assert(
              portraitOnly == false && usePortraitWidgetsForLandscape == false,
              "portraitOnly can't be true. Landscape mode must be supported here.");
          if (smallPhoneLandscapeWidget != null) {
            tmpSmallPhoneWidget1 = smallPhoneLandscapeWidget;
            tmpMediumPhoneWidget1 =
                mediumPhoneLandscapeWidget ?? smallPhoneLandscapeWidget;
            tmpLargePhoneWidget1 =
                largePhoneLandscapeWidget ?? smallPhoneLandscapeWidget;
            tmpSmallTabletWidget1 =
                smallTabletLandscapeWidget ?? smallPhoneLandscapeWidget;
            tmpLargeTabletWidget1 =
                largeTabletLandscapeWidget ?? smallPhoneLandscapeWidget;
          }

          if (mediumPhoneLandscapeWidget != null) {
            tmpLargePhoneWidget1 =
                largePhoneLandscapeWidget ?? mediumPhoneLandscapeWidget;
            tmpSmallTabletWidget1 =
                smallTabletPortraitWidget ?? mediumPhoneLandscapeWidget;
            tmpLargeTabletWidget1 =
                largeTabletLandscapeWidget ?? mediumPhoneLandscapeWidget;
          }

          if (largePhoneLandscapeWidget != null) {
            tmpSmallTabletWidget1 =
                smallTabletLandscapeWidget ?? largePhoneLandscapeWidget;
            tmpLargeTabletWidget1 =
                largeTabletPortraitWidget ?? largePhoneLandscapeWidget;
          }

          if (smallTabletLandscapeWidget != null) {
            tmpLargeTabletWidget1 =
                largeTabletLandscapeWidget ?? smallTabletLandscapeWidget;
          }

          // assign temp to original widgets
          smallPhoneLandscapeWidget = tmpSmallPhoneWidget1;
          mediumPhoneLandscapeWidget = tmpMediumPhoneWidget1;
          largePhoneLandscapeWidget = tmpLargePhoneWidget1;
          smallTabletLandscapeWidget = tmpSmallTabletWidget1;
          largeTabletLandscapeWidget = tmpLargeTabletWidget1;
        }
      } else {
        assert(useBreakpoints != true, "Breakpoints has not been enabled");
      }
    }

    // Here we assign the widgets as needed.
    if (portraitOnly) {
      // If portrait only,
      assert(portraitOnly == true, "Portrait mode only must is enabled");

      if (!isResponsive) {
        // If widget should not respond to different screen sizes
        assert(isResponsive == false, "Responsive mode must be false");
        assert(child != null,
            "Child cannot be null. At least one widget must be given to render.");
        _child = child!;
      } else {
        // widget is responsive and portrait only
        assert(isResponsive == true);
        assert(smallPhonePortraitWidget != null,
            "Small phone widget for portrait mode must be provided.");
        assert(mediumPhonePortraitWidget != null,
            "Medium phone widget for portrait mode must be provided.");
        assert(largePhonePortraitWidget != null,
            "Large phone widget for portrait mode must be provided.");
        assert(smallTabletPortraitWidget != null,
            "Small tablet widget for portrait mode must be provided.");
        assert(largeTabletPortraitWidget != null,
            "Large tablet widget for portrait mode must be provided.");
        _smallPhonePortraitWidget = smallPhonePortraitWidget!;
        _mediumPhonePortraitWidget = mediumPhonePortraitWidget!;
        _largePhonePortraitWidget = largePhonePortraitWidget!;
        _smallTabletPortraitWidget = smallTabletPortraitWidget!;
        _largeTabletPortraitWidget = largeTabletPortraitWidget!;
      }
    } else {
      assert(portraitOnly == false);
      // handles both landscape and portrait
      if (!isResponsive) {
        // If widget should not respond to different screen sizes
        assert(isResponsive == false);
        assert(portraitWidget != null,
            "portraitWidget widget must be given for this configuration.");
        assert(landscapeWidget != null,
            "landscapeWidget widget must be given for this configuration.");

        _portraitWidget = portraitWidget!;
        _landscapeWidget = landscapeWidget!;
      } else {
        // widget is responsive and portrait only
        assert(isResponsive == true, "Responsive mode must be true");
        assert(smallPhonePortraitWidget != null,
            "Small phone widget for portrait mode must be provided.");
        assert(mediumPhonePortraitWidget != null,
            "Medium phone widget for portrait mode must be provided.");
        assert(largePhonePortraitWidget != null,
            "Large phone widget for portrait mode must be provided.");
        assert(smallTabletPortraitWidget != null,
            "Small tablet widget for portrait mode must be provided.");
        assert(largeTabletPortraitWidget != null,
            "Large tablet widget for portrait mode must be provided.");

        _smallPhonePortraitWidget = smallPhonePortraitWidget!;
        _mediumPhonePortraitWidget = mediumPhonePortraitWidget!;
        _largePhonePortraitWidget = largePhonePortraitWidget!;
        _smallTabletPortraitWidget = smallTabletPortraitWidget!;
        _largeTabletPortraitWidget = largeTabletPortraitWidget!;

        assert(smallPhoneLandscapeWidget != null,
            "Small phone widget for landscape mode must be provided.");
        assert(mediumPhoneLandscapeWidget != null,
            "Medium phone widget for landscape mode must be provided.");
        assert(largePhoneLandscapeWidget != null,
            "Large phone widget for landscape mode must be provided.");
        assert(smallTabletLandscapeWidget != null,
            "Small tablet widget for landscape mode must be provided.");
        assert(largeTabletLandscapeWidget != null,
            "Large tablet widget for landscape mode must be provided.");
        _smallPhoneLandscapeWidget = smallPhoneLandscapeWidget!;
        _mediumPhoneLandscapeWidget = mediumPhoneLandscapeWidget!;
        _largePhoneLandscapeWidget = largePhoneLandscapeWidget!;
        _smallTabletLandscapeWidget = smallTabletLandscapeWidget!;
        _largeTabletLandscapeWidget = largeTabletLandscapeWidget!;
      }
    }
  }

  Widget _responsivePortraitLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <=
            ScreenSize.portraitPhone.smallPhoneMaxWidth) {
          // if small phone
          return _smallPhonePortraitWidget;
        } else if (constraints.maxWidth <=
            ScreenSize.portraitPhone.mediumPhoneMaxWidth) {
          // if medium phone
          return _mediumPhonePortraitWidget;
        } else if (constraints.maxWidth <=
            ScreenSize.portraitPhone.largePhoneMaxWidth) {
          // if large phone
          return _largePhonePortraitWidget;
        } else if (constraints.maxWidth <=
            ScreenSize.portraitTablet.smallTabletMaxWidth) {
          // if small tablet
          return _smallTabletPortraitWidget;
        } else if (constraints.maxWidth <=
            ScreenSize.portraitTablet.largeTabletMaxWidth) {
          // if large tablet
          return _largeTabletPortraitWidget;
        } else {
          // return default largeTablet screen if maxWidth greater than tablet widget
          return _largeTabletPortraitWidget;
        }
      },
    );
  }

  Widget _responsiveLandscapeLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <=
            ScreenSize.landscapePhone.smallPhoneMaxWidth) {
          // if small phone in landscape
          return _smallPhoneLandscapeWidget;
        } else if (constraints.maxWidth <=
            ScreenSize.landscapePhone.mediumPhoneMaxWidth) {
          // if medium phone in landscape
          return _mediumPhoneLandscapeWidget;
        } else if (constraints.maxWidth <=
            ScreenSize.landscapePhone.largePhoneMaxWidth) {
          // if large phone in landscape
          return _largePhoneLandscapeWidget;
        } else if (constraints.maxWidth <=
            ScreenSize.landscapeTablet.smallTabletMaxWidth) {
          // if small tablet in landscape
          return _smallTabletLandscapeWidget;
        } else if (constraints.maxWidth <=
            ScreenSize.landscapeTablet.largeTabletMaxWidth) {
          // if large tablet in landscape
          return _largeTabletLandscapeWidget;
        } else {
          // else if width >= largeTabletMaxWidth show large tablet in landscape
          return _largeTabletLandscapeWidget;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (portraitOnly) {
      // Portrait only
      if (!isResponsive) {
        // Portrait only and not responsive
        return _child;
      } else {
        // Portrait only and responsive
        assert(MediaQuery.of(context).orientation != Orientation.landscape,
            "Landscape orientation is not supported for this configuration. Consider disabling landscape orientation change.");
        return _responsivePortraitLayout();
      }
    } else {
      // supports both landscape and portrait orientation
      if (!isResponsive) {
        // supports both landscape and portrait, but not responsive
        return OrientationBuilder(
          builder: (ctx, orientation) {
            if (orientation == Orientation.portrait) {
              // if portrait but not responsive
              return _portraitWidget;
            } else {
              // if landscape but not responsive
              return _landscapeWidget;
            }
          },
        );
      } else {
        // supports both landscape and portrait, and is responsive
        return OrientationBuilder(
          builder: (ctx, orientation) {
            if (orientation == Orientation.portrait) {
              // responsive and on portrait orientation
              return _responsivePortraitLayout();
            } else {
              // responsive and on landscape orientation
              return _responsiveLandscapeLayout();
            }
          },
        );
      }
    }
  }
}
