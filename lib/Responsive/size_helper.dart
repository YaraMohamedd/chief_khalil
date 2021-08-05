import 'package:flutter/cupertino.dart';

class SizeHelper {
  SizeHelper._internal(this._current, this._size, this._orientation);
  int _current;
  Size _size;
  Orientation _orientation;

  static SizeHelper of(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    final orientation =
        width > height ? Orientation.landscape : Orientation.portrait;

    final current =
        (orientation == Orientation.portrait ? height : width).toInt();

    return SizeHelper._internal(current, size, orientation);
  }

  T help<T>({
    T mobileSmall,
    T mobileSmallLandScape,
    T mobileNormal,
    T mobileNormalLandScape,
    T mobileLarge,
    T mobileLargeLandScape,
    T mobileExtraLarge,
    T mobileExtraLargeLandScape,
    T tabletSmall,
    T tabletSmallLandScape,
    T tabletNormal,
    T tabletNormalLandScape,
    T tabletLarge,
    T tabletLargeLandScape,
    T tabletExtraLarge,
    T tabletExtraLargeLandScape,
    T desktopSmall,
    T desktopSmallLandScape,
    T desktopNormal,
    T desktopNormalLandScape,
    T desktopLarge,
    T desktopLargeLandScape,
    T desktopExtraLarge,
    T desktopExtraLargeLandScape,
  }) {
    var screenSizePrinted = false;
    var isPortrait = _orientation == Orientation.portrait;

    if (_current < _BreakPoints.mobileNormal) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: mobileSmall | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (mobileSmall != null) return mobileSmall;
      } else {
        if (mobileSmallLandScape != null) return mobileSmallLandScape;
      }
    }

    if (_current < _BreakPoints.mobileLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: mobileNormal | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (mobileNormal != null) return mobileNormal;
      } else {
        if (mobileNormalLandScape != null) return mobileNormalLandScape;
      }
    }

    if (_current < _BreakPoints.mobileExtraLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: mobileLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (mobileLarge != null) return mobileLarge;
      } else {
        if (mobileLargeLandScape != null) return mobileLargeLandScape;
      }
    }

    if (_current < _BreakPoints.tabletSmall) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: mobileExtraLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (mobileExtraLarge != null) return mobileExtraLarge;
      } else {
        if (mobileExtraLargeLandScape != null) return mobileExtraLargeLandScape;
      }
    }

    if (_current < _BreakPoints.tabletNormal) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: tabletSmall | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (tabletSmall != null) return tabletSmall;
      } else {
        if (tabletSmallLandScape != null) return tabletSmallLandScape;
      }
    }

    if (_current < _BreakPoints.tabletLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: tabletNormal | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (tabletNormal != null) return tabletNormal;
      } else {
        if (tabletNormalLandScape != null) return tabletNormalLandScape;
      }
    }

    if (_current < _BreakPoints.tabletExtraLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: tabletLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (tabletLarge != null) return tabletLarge;
      } else {
        if (tabletLargeLandScape != null) return tabletLargeLandScape;
      }
    }

    if (_current < _BreakPoints.desktopSmall) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: tabletExtraLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (tabletExtraLarge != null) return tabletExtraLarge;
      } else {
        if (tabletExtraLargeLandScape != null) return tabletExtraLargeLandScape;
      }
    }

    if (_current < _BreakPoints.desktopNormal) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: desktopSmall | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (desktopSmall != null) return desktopSmall;
      } else {
        if (desktopSmallLandScape != null) return desktopSmallLandScape;
      }
    }

    if (_current < _BreakPoints.desktopLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: desktopNormal | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (desktopNormal != null) return desktopNormal;
      } else {
        if (desktopNormalLandScape != null) return desktopNormalLandScape;
      }
    }

    if (_current < _BreakPoints.desktopExtraLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: desktopLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (desktopLarge != null) return desktopLarge;
      } else {
        if (desktopLargeLandScape != null) return desktopLargeLandScape;
      }
    } else {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: desktopExtraLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (desktopExtraLarge != null) return desktopExtraLarge;
      } else {
        if (desktopExtraLargeLandScape != null)
          return desktopExtraLargeLandScape;
      }
    }

    // If the `_current` size is bigger than `desktopExtraLarge`
    // OR
    // smaller than `desktopExtraLarge` but couldn't find its option,
    // THEN
    // return the closest and smaller than _current `_current`.
    if (isPortrait) {
      if (desktopLarge != null) return desktopLarge;
    } else {
      if (desktopLargeLandScape != null) return desktopLargeLandScape;
    }
    if (isPortrait) {
      if (desktopNormal != null) return desktopNormal;
    } else {
      if (desktopNormalLandScape != null) return desktopNormalLandScape;
    }
    if (isPortrait) {
      if (desktopSmall != null) return desktopSmall;
    } else {
      if (desktopSmallLandScape != null) return desktopSmallLandScape;
    }
    if (isPortrait) {
      if (tabletExtraLarge != null) return tabletExtraLarge;
    } else {
      if (tabletExtraLargeLandScape != null) return tabletExtraLargeLandScape;
    }
    if (isPortrait) {
      if (tabletLarge != null) return tabletLarge;
    } else {
      if (tabletLargeLandScape != null) return tabletLargeLandScape;
    }
    if (isPortrait) {
      if (tabletNormal != null) return tabletNormal;
    } else {
      if (tabletNormalLandScape != null) return tabletNormalLandScape;
    }
    if (isPortrait) {
      if (tabletSmall != null) return tabletSmall;
    } else {
      if (tabletSmallLandScape != null) return tabletSmallLandScape;
    }
    if (isPortrait) {
      if (mobileExtraLarge != null) return mobileExtraLarge;
    } else {
      if (mobileExtraLargeLandScape != null) return mobileExtraLargeLandScape;
    }
    if (isPortrait) {
      if (mobileLarge != null) return mobileLarge;
    } else {
      if (mobileLargeLandScape != null) return mobileLargeLandScape;
    }
    if (isPortrait) {
      if (mobileNormal != null) return mobileNormal;
    } else {
      if (mobileNormalLandScape != null) return mobileNormalLandScape;
    }
    if (isPortrait) {
      if (mobileSmall != null) return mobileSmall;
    } else {
      if (mobileSmallLandScape != null) return mobileSmallLandScape;
    }

    throw Exception(
        'Screen size not specified or there is no options passed from the parameters [current: `$_current`, orientation: `$_orientation`]');
  }

  /// Takes  `T Function(double width, double height)` as a parameter
  T helpBuilder<T>({
    T Function(double width, double height) mobileSmall,
    T Function(double width, double height) mobileSmallLandScape,
    T Function(double width, double height) mobileNormal,
    T Function(double width, double height) mobileNormalLandScape,
    T Function(double width, double height) mobileLarge,
    T Function(double width, double height) mobileLargeLandScape,
    T Function(double width, double height) mobileExtraLarge,
    T Function(double width, double height) mobileExtraLargeLandScape,
    T Function(double width, double height) tabletSmall,
    T Function(double width, double height) tabletSmallLandScape,
    T Function(double width, double height) tabletNormal,
    T Function(double width, double height) tabletNormalLandScape,
    T Function(double width, double height) tabletLarge,
    T Function(double width, double height) tabletLargeLandScape,
    T Function(double width, double height) tabletExtraLarge,
    T Function(double width, double height) tabletExtraLargeLandScape,
    T Function(double width, double height) desktopSmall,
    T Function(double width, double height) desktopSmallLandScape,
    T Function(double width, double height) desktopNormal,
    T Function(double width, double height) desktopNormalLandScape,
    T Function(double width, double height) desktopLarge,
    T Function(double width, double height) desktopLargeLandScape,
    T Function(double width, double height) desktopExtraLarge,
    T Function(double width, double height) desktopExtraLargeLandScape,
  }) {
    var screenSizePrinted = false;
    final isPortrait = _orientation == Orientation.portrait;
    if (_current < _BreakPoints.mobileNormal) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: mobileSmall | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (mobileSmall != null) return mobileSmall(_size.width, _size.height);
      } else {
        if (mobileSmallLandScape != null)
          return mobileSmallLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.mobileLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: mobileNormal | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (mobileNormal != null)
          return mobileNormal(_size.width, _size.height);
      } else {
        if (mobileNormalLandScape != null)
          return mobileNormalLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.mobileExtraLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: mobileLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (mobileLarge != null) return mobileLarge(_size.width, _size.height);
      } else {
        if (mobileLargeLandScape != null)
          return mobileLargeLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.tabletSmall) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: mobileExtraLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (mobileExtraLarge != null)
          return mobileExtraLarge(_size.width, _size.height);
      } else {
        if (mobileExtraLargeLandScape != null)
          return mobileExtraLargeLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.tabletNormal) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: tabletSmall | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (tabletSmall != null) return tabletSmall(_size.width, _size.height);
      } else {
        if (tabletSmallLandScape != null)
          return tabletSmallLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.tabletLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: tabletNormal | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (tabletNormal != null)
          return tabletNormal(_size.width, _size.height);
      } else {
        if (tabletNormalLandScape != null)
          return tabletNormalLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.tabletExtraLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: tabletLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (tabletLarge != null) return tabletLarge(_size.width, _size.height);
      } else {
        if (tabletLargeLandScape != null)
          return tabletLargeLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.desktopSmall) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: tabletExtraLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (tabletExtraLarge != null)
          return tabletExtraLarge(_size.width, _size.height);
      } else {
        if (tabletExtraLargeLandScape != null)
          return tabletExtraLargeLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.desktopNormal) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: desktopSmall | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (desktopSmall != null)
          return desktopSmall(_size.width, _size.height);
      } else {
        if (desktopSmallLandScape != null)
          return desktopSmallLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.desktopLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: desktopNormal | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (desktopNormal != null)
          return desktopNormal(_size.width, _size.height);
      } else {
        if (desktopNormalLandScape != null)
          return desktopNormalLandScape(_size.width, _size.height);
      }
    }

    if (_current < _BreakPoints.desktopExtraLarge) {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: desktopLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        if (desktopLarge != null)
          return desktopLarge(_size.width, _size.height);
      } else {
        if (desktopLargeLandScape != null)
          return desktopLargeLandScape(_size.width, _size.height);
      }
    } else {
      if (!screenSizePrinted) {
        print(
            'SizeHelper: desktopExtraLarge | Width: ${_size.width} | Height: ${_size.height}');
        screenSizePrinted = true;
      }
      if (isPortrait) {
        {
          if (desktopExtraLarge != null)
            return desktopExtraLarge(_size.width, _size.height);
        }
      } else {
        if (desktopExtraLargeLandScape != null)
          return desktopExtraLargeLandScape(_size.width, _size.height);
      }
    }

    // If the `_current` size is bigger than `desktopExtraLarge`
    // OR
    // smaller than `desktopExtraLarge` but couldn't find its option,
    // THEN
    // return the closest and smaller than _current `_current`.
    if (isPortrait) {
      if (desktopLarge != null) return desktopLarge(_size.width, _size.height);
    } else {
      if (desktopLargeLandScape != null)
        return desktopLargeLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (desktopNormal != null)
        return desktopNormal(_size.width, _size.height);
    } else {
      if (desktopNormalLandScape != null)
        return desktopNormalLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (desktopSmall != null) return desktopSmall(_size.width, _size.height);
    } else {
      if (desktopSmallLandScape != null)
        return desktopSmallLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (tabletExtraLarge != null)
        return tabletExtraLarge(_size.width, _size.height);
    } else {
      if (tabletExtraLargeLandScape != null)
        return tabletExtraLargeLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (tabletLarge != null) return tabletLarge(_size.width, _size.height);
    } else {
      if (tabletLargeLandScape != null)
        return tabletLargeLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (tabletNormal != null) return tabletNormal(_size.width, _size.height);
    } else {
      if (tabletNormalLandScape != null)
        return tabletNormalLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (tabletSmall != null) return tabletSmall(_size.width, _size.height);
    } else {
      if (tabletSmallLandScape != null)
        return tabletSmallLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (mobileExtraLarge != null)
        return mobileExtraLarge(_size.width, _size.height);
    } else {
      if (mobileExtraLargeLandScape != null)
        return mobileExtraLargeLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (mobileLarge != null) return mobileLarge(_size.width, _size.height);
    } else {
      if (mobileLargeLandScape != null)
        return mobileLargeLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (mobileNormal != null) return mobileNormal(_size.width, _size.height);
    } else {
      if (mobileNormalLandScape != null)
        return mobileNormalLandScape(_size.width, _size.height);
    }
    if (isPortrait) {
      if (mobileSmall != null) return mobileSmall(_size.width, _size.height);
    } else {
      if (mobileSmallLandScape != null)
        return mobileSmallLandScape(_size.width, _size.height);
    }

    throw Exception(
        'Screen size not specified or there is no options passed from the parameters [current: `$_current`, orientation: `$_orientation`]');
  }
}

class _BreakPoints {
  static const mobileSmall = 320;
  static const mobileNormal = 375;
  static const mobileLarge = 414;
  static const mobileExtraLarge = 480;
  static const tabletSmall = 600;
  static const tabletNormal = 768;
  static const tabletLarge = 850;
  static const tabletExtraLarge = 900;
  static const desktopSmall = 950;
  static const desktopNormal = 1920;
  static const desktopLarge = 3840;
  static const desktopExtraLarge = 4096;
}
