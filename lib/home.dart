import 'package:currency_convertor_app/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variables
  String output = "";
  double rate = 80;
  TextEditingController control = TextEditingController();

  //Currency Conversion Logic
  void currencyConvert() {
    String userInput = control.text;
    if (userInput.isNotEmpty) {
      try {
        double usdValue = double.parse(userInput);

        setState(() {
          output = "${usdValue * rate}";
        });
      } catch (e) {
        setState(() {
          output = "Invalid Number";
        });
      }
    } else {
      setState(() {
        output = "Please enter any number";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter Your Currency",
            style: TextStyle(
              color: white,
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 30,
              bottom: 30,
            ),
            child: TextField(
              controller: control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Enter in USD",
                labelStyle: TextStyle(
                  color: white,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: Icon(
                    Icons.monetization_on,
                    color: white,
                  ),
                ),
              ),
              style: TextStyle(
                color: white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: currencyConvert,
            child: Text("Convert"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 40,
            ),
            child: Text(
              output,
              style: TextStyle(
                color: white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
