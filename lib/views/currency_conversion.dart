import 'package:flutter/material.dart';

class CurrencyConversion extends StatefulWidget {
  const CurrencyConversion({super.key});

  @override
  CurrencyConversionState createState() => CurrencyConversionState();
}

class CurrencyConversionState extends State<CurrencyConversion> {
  double amount = 0.0;
  double convertedAmount = 0.0;
  String selectedCurrency = 'IDR';

  Map<String, double> conversionRates = {
    'IDR': 1.0,
    'MYR': 0.00028,
    'USD': 0.000069
  };

  void convertCurrency() {
    setState(() {
      convertedAmount = amount * conversionRates[selectedCurrency]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
            onChanged: (value) {
              setState(() {
                amount = double.parse(value);
              });
            },
          ),
          const SizedBox(height: 16.0),
          DropdownButton<String>(
            value: selectedCurrency,
            onChanged: (value) {
              setState(() {
                selectedCurrency = value!;
              });
            },
            items: conversionRates.keys.map((currency) {
              return DropdownMenuItem<String>(
                value: currency,
                child: Text(currency),
              );
            }).toList(),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: convertCurrency,
            child: const Text('Convert'),
          ),
          const SizedBox(height: 16.0),
          Text('Converted Amount: $convertedAmount'),
        ],
      ),
    );
  }
}
