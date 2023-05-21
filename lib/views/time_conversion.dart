import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:valorant_app/common/styles.dart';

class TimeConversion extends StatefulWidget {
  const TimeConversion({super.key});
  static const routeName = '/time_conversion';

  @override
  TimeConversionState createState() => TimeConversionState();
}

class TimeConversionState extends State<TimeConversion> {
  String _timeZone = 'WIB';
  late Timer _timer;
  late DateFormat _dateFormat;
  late DateFormat _timeFormat;
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _dateFormat = DateFormat('EEEE, dd MMMM yyyy');
    _timeFormat = DateFormat('HH:mm:ss');
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _changeTimeZone(String timeZone) {
    setState(() {
      _timeZone = timeZone;
    });
  }

  String _getFormattedTime(DateTime dateTime) {
    switch (_timeZone) {
      case 'WIB':
        return _timeFormat.format(dateTime);
      case 'WIT':
        return _timeFormat.format(dateTime.add(const Duration(hours: 2)));
      case 'WITA':
        return _timeFormat.format(dateTime.add(const Duration(hours: 1)));
      case 'BST':
        return _timeFormat.format(dateTime.add(const Duration(hours: -6)));
      default:
        return '';
    }
  }

  String _getFormattedDate(DateTime dateTime) {
    switch (_timeZone) {
      case 'WIB':
        return _dateFormat.format(dateTime);
      case 'WIT':
        return _dateFormat.format(dateTime.add(const Duration(hours: 2)));
      case 'WITA':
        return _dateFormat.format(dateTime.add(const Duration(hours: 1)));
      case 'BST':
        return _dateFormat.format(dateTime.add(const Duration(hours: -6)));
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Never Miss a Beat!',
          style: TextStyle(
            color: secondaryColor,
            fontFamily: 'Tungsten-Bold',
            fontSize: 32,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _getFormattedDate(_dateTime),
            style: const TextStyle(fontFamily: 'URW DIN W05 Medium', color: primaryColor, fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            "${_getFormattedTime(_dateTime)} $_timeZone",
            style: const TextStyle(fontFamily: 'URW DIN W05 Bold', color: accentColor, fontSize: 32),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _changeTimeZone('WIB'),
                child: const Text('WIB'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => _changeTimeZone('WIT'),
                child: const Text('WIT'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => _changeTimeZone('WITA'),
                child: const Text('WITA'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => _changeTimeZone('BST'),
                child: const Text('BST'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
