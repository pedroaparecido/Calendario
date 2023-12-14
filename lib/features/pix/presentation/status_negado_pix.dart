import 'package:flutter/material.dart';

class StatusNegadoPix extends StatelessWidget {
  const StatusNegadoPix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
              width: 900,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0,
                )
              ]),
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: 900,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Pague antes de continuar, por favor!",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              )),
        ),
      ),
    );
  }
}
