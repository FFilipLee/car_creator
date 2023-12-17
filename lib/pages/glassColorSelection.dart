import 'package:flutter/material.dart';
import 'package:carcreator/pages/grillColorSelection.dart';
import 'package:carcreator/models/Car.dart';

class GlassColorSelection extends StatefulWidget {
  final Car ourCar;
  const GlassColorSelection({Key? key, required this.ourCar}) : super(key: key);

  @override
  GlassColorSelectionState createState() => GlassColorSelectionState();
}

class GlassColorSelectionState extends State<GlassColorSelection> {
  Color selectedColor = Colors.cyan;
  late Car ourCar;

  @override
  void initState() {
    super.initState();
    ourCar = widget.ourCar; // Initialize ourCar with the passed Car object
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: List.generate(
                  4,
                  (i) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      15,
                      (j) => Container(
                        width: MediaQuery.of(context).size.width / 15,
                        height: 25,
                        decoration: BoxDecoration(
                          color: (i % 2 == 0)
                              ? (j % 2 == 0)
                                  ? Colors.black
                                  : Colors.white
                              : (j % 2 == 0)
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -120,
            left: 20,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(0.4),
              ),
            ),
          ),
          Positioned(
            top: -10,
            left: -140,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(0.4),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose the',
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                  Text(
                    'glass color',
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 110.0, left: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            onPressed: () {
              ourCar.glassColor = selectedColor;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GrillColorSelection(ourCar: ourCar),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
