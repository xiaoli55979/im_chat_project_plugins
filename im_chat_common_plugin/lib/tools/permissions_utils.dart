// import 'package:connectivity/connectivity.dart';
import 'package:permission_utils/permission_utils.dart';

// class NetworkStatus {
//   final bool isConnected;
//   final String connectionType;
//
//   NetworkStatus({required this.isConnected, required this.connectionType});
// }

class PermissionsUtils {
  PermissionsUtils._();
  // static StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  //
  // // 获取网络状态
  // static Future<NetworkStatus> checkNetworkStatus() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   String connectType = "None";
  //   if (connectivityResult == ConnectivityResult.wifi) {
  //     connectType = "Wifi";
  //   } else if (connectivityResult == ConnectivityResult.mobile) {
  //     connectType = "Mobile";
  //   }
  //   bool status = connectivityResult != ConnectivityResult.none;
  //   return NetworkStatus(isConnected: status, connectionType: connectType);
  // }
  //
  // // 监听网络状态
  // static void listenNetwork(void Function(bool isConnected) callback) {
  //   _connectivitySubscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     if (result != ConnectivityResult.none) {
  //       callback(true);
  //     } else {
  //       callback(false);
  //     }
  //   });
  // }
  //
  // // 停止监听网络状态
  // static void stopListeningNetwork() {
  //   _connectivitySubscription?.cancel();
  //   _connectivitySubscription = null;
  // }

  /// 获取相机权限
  static void requestCameraPermission(void Function(bool status) callback) async {
    final permissionUtilsPlugin = PermissionUtils();
    String? status = await permissionUtilsPlugin.requestCameraPermission();
    callback(status != null && status == "true");
  }

  /// 获取相册权限
  static void requestAlbumPermission(void Function(bool status) callback) async {
    final permissionUtilsPlugin = PermissionUtils();
    String? status = await permissionUtilsPlugin.requestAlbumPermission();
    callback(status != null && status == "true");
  }

  /// 获取麦克风权限
  static void requestMicrophonePermission(void Function(bool status) callback) async {
    final permissionUtilsPlugin = PermissionUtils();
    String? status = await permissionUtilsPlugin.requestMicrophonePermission();
    callback(status != null && status == "true");
  }

  /// 获取所有权限
  static void requestAllPermission(void Function(bool status) callback) async {
    final permissionUtilsPlugin = PermissionUtils();
    String? status = await permissionUtilsPlugin.requestAllPermission();
    callback(status != null && status == "true");
  }
}
