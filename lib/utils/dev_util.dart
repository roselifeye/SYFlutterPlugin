import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:synchronized/synchronized.dart';

class DevUtil {
  static DevUtil _singleton;
  static DeviceInfoPlugin _deviceInfo;
  static IosDeviceInfo _iosDeviceInfo;
  static AndroidDeviceInfo _androidDeviceInfo;
  static Lock _lock = Lock();

  static Future<DevUtil> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(() async {
        if (_singleton == null) {
          // 保持本地实例直到完全初始化。
          var singleton = DevUtil._();
          await singleton._init();
          _singleton = singleton;
        }
      });
    }
    return _singleton;
  }

  DevUtil._();

  Future _init() async {
    _deviceInfo = await DeviceInfoPlugin();
    if (Platform.isIOS) {
      _iosDeviceInfo = await _deviceInfo.iosInfo;
    } else {
      _androidDeviceInfo = await _deviceInfo.androidInfo;
    }
  }

  static String getDevId() {
    if (_deviceInfo == null) return null;

    if (Platform.isIOS) {
      if (_iosDeviceInfo == null) return null;
      return _iosDeviceInfo.identifierForVendor;
    } else {
      if (_androidDeviceInfo == null) return null;
      return _androidDeviceInfo.androidId;
    }
  }
  static dynamic deviceInfo;
  static Future<void> getDeviceInfo() async {
    if (Platform.isAndroid) {
      deviceInfo = await _deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      deviceInfo = await _deviceInfo.iosInfo;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  static bool get isLowerThanAndroidQ {
    return (_deviceInfo as AndroidDeviceInfo).version.sdkInt < 29;
  }
}