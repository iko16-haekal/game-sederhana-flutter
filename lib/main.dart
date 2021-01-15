import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int angka = Random().nextInt(1000);
  final navigatorKey = GlobalKey<NavigatorState>();

  void check(String tipe, int angka) async {
    final context = navigatorKey.currentState.overlay.context;
    if (tipe == "genap") {
      if (angka % 2 == 0) {
        Alert(
          style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
          context: context,
          type: AlertType.success,
          title: "BENAR",
          desc: "selamat anda benar",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  this.angka = Random().nextInt(1000);
                });
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
          type: AlertType.error,
          title: "salah",
          desc: "selamat anda salah",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  this.angka = Random().nextInt(1000);
                });
              },
              width: 120,
            )
          ],
        ).show();
      }
    }

    if (tipe == "ganjil") {
      if (angka % 2 != 0) {
        Alert(
          context: context,
          style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
          type: AlertType.success,
          title: "BENAR",
          desc: "selamat anda benar",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  this.angka = Random().nextInt(1000);
                });
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
          type: AlertType.error,
          title: "salah",
          desc: "selamat anda salah",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  this.angka = Random().nextInt(1000);
                });
              },
              width: 120,
            )
          ],
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ini game"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Draggable<int>(
                  data: angka,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 101,
                    height: 101,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "$angka",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  feedback: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 101,
                    height: 101,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "$angka",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 101,
                    height: 101,
                    decoration: BoxDecoration(
                        color: Colors.transparent, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "11",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: DragTarget<int>(
                      builder: (cotext, candidateData, rejectedData) {
                        return Container(
                          height: 170,
                          color: Colors.green,
                          child: Center(
                            child: Text("GENAP",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          ),
                        );
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        check("genap", data);
                      },
                    )),
                Flexible(
                    flex: 1,
                    child: DragTarget<int>(
                        builder: (context, candidateData, rejectedDAta) {
                      return Container(
                        color: Colors.lime,
                        height: 170,
                        child: Center(
                          child: Text("ganjil",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                        ),
                      );
                    }, onWillAccept: (data) {
                      return true;
                    }, onAccept: (data) {
                      check("ganjil", data);
                    }))
              ],
            )
          ],
        ),
      ),
    );
  }
}
