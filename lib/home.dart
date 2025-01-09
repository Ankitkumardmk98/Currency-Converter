import 'package:flutter/material.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variables to be used in Code
  String output = "";
  double conversionRate = 82.5;
  TextEditingController currencyController = TextEditingController();

  //Logic of the app
  void convertCurrency() {
    String userInput = currencyController.text;
    if (userInput.isNotEmpty) {
      try {
        double usdValue = double.parse(userInput);
        String finalRate = (usdValue * conversionRate).toStringAsFixed(2);
        if (usdValue.isNegative) {
          setState(() {
            output = "Negative numbers are not allowed";
          });
        } else {
          setState(() {
            output = "Your \$$usdValue will be Rs $finalRate";
          });
        }
      } catch (e) {
        setState(() {
          output = "Invalid input. Please enter a valid number";
        });
      }
    } else {
      setState(() {
        output = "The field cannot be empty";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        title: Text(
          "Currency Converter",
          style: TextStyle(
            color: white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter Currency Amount",
            style: TextStyle(
              color: white,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 30,
              left: 40,
              right: 40,
            ),
            child: TextField(
              style: TextStyle(color: white),
              controller: currencyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter in USD",
                labelStyle: TextStyle(
                  color: white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                prefixIcon: Icon(
                  Icons.monetization_on,
                  color: white,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: convertCurrency,
            child: Text("Convert"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
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
