import 'package:flutter/material.dart';

class SleepTrackerScreen extends StatefulWidget {
  @override
  _SleepTrackerScreenState createState() => _SleepTrackerScreenState();
}

class _SleepTrackerScreenState extends State<SleepTrackerScreen> {
  int _selectedDay = 24; // Initially, the 24th is selected

  // Variables to track switch states
  bool _isBedTimeOn = true;
  bool _isAlarmOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting and Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Maya Ramon,\nGood Morning ☀️",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Sleep Notification
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "You have slept 09:30 that is above your recommendation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.close, color: Colors.white),
                )
              ],
            ),
            SizedBox(height: 20),

            // Sleep Calendar
            Text(
              "Your Sleep Calendar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Days Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(6, (index) {
                int day = 22 + index;
                bool isSelected =
                    day == _selectedDay; // Highlight the selected day
                return Column(
                  children: [
                    Text("Thu"),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = day; // Update the selected day
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          "$day",
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 20),

            // Sleep Data Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sleepInfoCard(
                    Icons.bedtime, "Bed time", "7H and 28Min", _isBedTimeOn,
                    (bool value) {
                  setState(() {
                    _isBedTimeOn =
                        value; // Update the state when switch is toggled
                  });
                }),
                sleepInfoCard(Icons.alarm, "Alarm", "16H and 18Min", _isAlarmOn,
                    (bool value) {
                  setState(() {
                    _isAlarmOn =
                        value; // Update the state when switch is toggled
                  });
                }),
              ],
            ),
            SizedBox(height: 20),

            // Help Section
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Have a problem\nSleeping?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          child: Text("Consult an expert"),
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/sleep.png', // Replace with your image
                      height: 250,
                      width: 250,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sleepInfoCard(IconData icon, String title, String time,
      bool switchValue, ValueChanged<bool> onChanged) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.purple),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(time, style: TextStyle(color: Colors.grey)),
            Switch(value: switchValue, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
