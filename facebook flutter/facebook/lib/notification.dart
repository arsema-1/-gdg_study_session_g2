import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () {},
        ),
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(kToolbarHeight), // Adjust height as needed
          child: Container(
            color: Colors.white, // Optional background color for the navigation
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                IconButton(
                    icon: Icon(FontAwesomeIcons.home, color: Colors.grey),
                    onPressed: null),
                IconButton(
                    icon:
                        Icon(FontAwesomeIcons.userFriends, color: Colors.grey),
                    onPressed: null),
                IconButton(
                    icon: Icon(FontAwesomeIcons.userCircle, color: Colors.grey),
                    onPressed: null),
                Stack(
                  children: [
                    IconButton(
                        icon: Icon(FontAwesomeIcons.bell, color: Colors.blue),
                        onPressed: null),
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
                IconButton(
                    icon: Icon(FontAwesomeIcons.bars, color: Colors.grey),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SectionHeader(title: "New"),
          ...List.generate(6, (index) => const NotificationTile(isNew: true)),
          const SectionHeader(title: "Earlier"),
          ...List.generate(6, (index) => const NotificationTile(isNew: false)),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[200],
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final bool isNew;

  const NotificationTile({required this.isNew, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isNew
            ? const LinearGradient(
                colors: [Colors.blueAccent, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isNew ? Colors.blue[50] : Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/man.png'),
            radius: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Darrell Trivedi ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: "has a new story up. What's your reaction?"),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "2 hours ago",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(FontAwesomeIcons.ellipsisH, color: Colors.grey),
        ],
      ),
    );
  }
}
