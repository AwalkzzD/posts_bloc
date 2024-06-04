import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:posts_bloc/base/screens/base_widget.dart';

class Test extends BaseWidget {
  const Test({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() => _TestState();
}

class _TestState extends BaseWidgetState<Test> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card.outlined(
              elevation: 10,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8)),
                      width: 100,
                      height: 120,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Phillips Bulb"),
                        Text("Very Bright"),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          children: [
                            Text("Qty: "),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                            Text("$counter"),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  counter--;
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Card.outlined(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 3),
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*ElevatedButton(
  onPressed: _getNetworkDetails,
  child: const Text("Get Wifi Networks")),*/

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
