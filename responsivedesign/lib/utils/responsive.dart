import 'package:flutter/cupertino.dart';
import 'package:responsivedesign/utils/sizes.dart';

class ResponsiveWidget extends StatelessWidget {
  final bool portraitOnly;
  final bool isResponsive;

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

  ResponsiveWidget.builder({
    Key? key,
    this.portraitOnly = false,
    this.isResponsive = true,
    Widget? child,
    Widget? phoneWidget,
    Widget? tabletWidget,
    Widget? portraitWidget,
    Widget? landscapeWidget,
    Widget? smallPhoneWidget,
    Widget? mediumPhoneWidget,
    Widget? largePhoneWidget,
    Widget? smallTabletWidget,
    Widget? largeTabletWidget,
    Widget? phoneLandscapeWidget,
    Widget? tabletLandscapeWidget,
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
