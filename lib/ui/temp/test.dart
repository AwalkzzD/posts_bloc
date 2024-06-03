import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:posts_bloc/base/screens/base_widget.dart';

class Test extends BaseWidget {
  const Test({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() => _TestState();
}

class _TestState extends BaseWidgetState<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: _getNetworkDetails,
                child: const Text("Get Wifi Networks")),
          ],
        ),
      ),
    );
  }

  void _getNetworkDetails() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      print("Mobile Connection Available");
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Note for Android: When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      print("Wifi Connection Available");
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      print("Bluetooth Connection Available");
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      print("No Connection Available");
    }
  }
}
