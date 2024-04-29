import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekPage extends StatefulWidget {
  @override
  _WeekPageState createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  int selectedIndex = -1;
  int selectedHourIndex = -1;
  bool isLoading = false; // Ajouter un état pour le chargement

  void _selectChip(int index) {
    setState(() {
      selectedIndex = index;
      selectedHourIndex = -1;
      isLoading = true; // Activer le chargement
    });
    // Simuler un délai de chargement
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Désactiver le chargement
      });
    });
  }

  void _selectHour(int index) {
    setState(() {
      selectedHourIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    final today = DateTime.now();
    final now = DateTime.now(); // Ajoutez cette ligne pour déclarer la variable now
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final dates = List<DateTime>.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    final formatter = DateFormat('MMM dd');

    final List<String> hoursOfDay = List.generate(10, (index) => (index + 8).toString() + ":00");

    return Scaffold(
      appBar: AppBar(
        title: Text('Week Days and Dates'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(7, (index) {
                  final date = dates[index];
                  final dayOfWeek = daysOfWeek[index];
                  final label = '$dayOfWeek${formatter.format(date)}';
                  final isSelected = index == selectedIndex;

                  return GestureDetector(
                    onTap: () => _selectChip(index),
                    child: Container(
                      color: Colors.red,
                      height: 100,
                      child: Chip(
                        labelPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 30),
                        label: Text("$dayOfWeek${formatter.format(date)}"),
                        backgroundColor: isSelected ? Colors.green : Colors.blue,
                        labelStyle: TextStyle(color: Colors.white),
                        padding: EdgeInsets.all(8.0),
                        elevation: 4.0,
                        shadowColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: isLoading
                    ? [CircularProgressIndicator()] // Affichez le cercle de progression si le chargement est en cours
                    : List.generate(hoursOfDay.length, (index) {
                  final hour = hoursOfDay[index];
                  final isSelected = index == selectedHourIndex;

                  final startOfCurrentDay = DateTime(today.year, today.month, today.day, 8);
                  final isPassed = now.isAfter(startOfCurrentDay.add(Duration(hours: index)));

                  return GestureDetector(
                    onTap: startOfCurrentDay.add(Duration(hours: index)).isBefore(now) ? null : () => _selectHour(index),
                    child: Chip(
                      labelPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      label: Text(hour),
                      backgroundColor: isSelected ? Colors.green : (isPassed ? Colors.grey : Colors.blue),
                      labelStyle: TextStyle(color: Colors.white),
                      padding: EdgeInsets.all(8.0),
                      elevation: 4.0,
                      shadowColor: Colors.grey[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
