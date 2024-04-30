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

  late List<DateTime> dates; // Déclarer dates ici
  late List<String> hoursOfDay; // Déclarer hoursOfDay ici
  void initState() {
    super.initState();

    final today = DateTime.now();
    final now = DateTime.now(); // Ajoutez cette ligne pour déclarer la variable now
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    dates = List<DateTime>.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    final formatter = DateFormat('MMM dd');

    hoursOfDay = List.generate(10, (index) => (index + 8).toString() + ":00");
  }
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

    // Récupérer la date sélectionnée

    final selectedDate = dates[index];

    // Imprimer la date sélectionnée
    print('Date sélectionnée: $selectedDate');

    // Imprimer l'heure sélectionnée
    if (selectedHourIndex != -1) {
      final selectedHour = hoursOfDay[selectedHourIndex];
      print('Heure sélectionnée: $selectedHour');
    }
  }



  void _selectHour(int index) {
    setState(() {
      selectedHourIndex = index;
    });

    // Récupérer l'heure sélectionnée
    final selectedHour = hoursOfDay[index];

    // Imprimer l'heure sélectionnée
    print('Heure sélectionnée: $selectedHour');

    // Imprimer la date sélectionnée
    if (selectedIndex != -1) {
      final selectedDate = dates[selectedIndex];
      print('Date sélectionnée: $selectedDate');
    }
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
                  final isToday = date.year == today.year && date.month == today.month && date.day == today.day;

                  return GestureDetector(
                    onTap: () => _selectChip(index),
                    child: Container(
                      color: isToday ? Colors.green : Colors.red, // Mettre en vert si c'est aujourd'hui
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
