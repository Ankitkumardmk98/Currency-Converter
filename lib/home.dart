import 'package:flutter/material.dart';
import 'constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert'; // For converting API response to JSON

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Fetch live conversion rate
  Future<void> fetchConversionRate() async {
    final url = Uri.parse(
        'https://api.exchangerate-api.com/v4/latest/USD'); // Example API URL
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          conversionRate = data['rates']
              ['INR']; // Adjust this if the API uses a different structure
        });
      } else {
        setState(() {
          output = "Failed to load conversion rate";
        });
      }
    } catch (e) {
      setState(() {
        output = "Error fetching data";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchConversionRate(); // Fetch the conversion rate when the app starts
  }

  @override
  void dispose() {
    currencyController.dispose(); // Clean up the controller
    super.dispose();
  }

  //Variables to be used in Code
  String output = "";
  double conversionRate = 0;
  TextEditingController currencyController = TextEditingController();

  //Logic of the app
  void convertCurrency() {
    String userInput = currencyController.text;
    if (userInput.isNotEmpty) {
      try {
        double usdValue = double.parse(userInput);
        String finalRate = (usdValue * conversionRate).toStringAsFixed(2);
        if (usdValue < 0) {
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
        output = "Please enter a value";
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
