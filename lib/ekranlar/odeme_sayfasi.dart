import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class OdemeSayfasi extends StatelessWidget {
  const OdemeSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Vibration.vibrate(duration: 150);
                  },
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Vibration.vibrate(duration: 150);
                  },
                  child: Text("Confirm"),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
