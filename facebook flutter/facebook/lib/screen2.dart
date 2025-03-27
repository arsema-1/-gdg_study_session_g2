import 'notification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Text(
              'facebook',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SizedBox(width: 15),
Icon(FontAwesomeIcons.facebookMessenger, color: Colors.black),          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation icons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   const SizedBox(width: 20),
          FaIcon(FontAwesomeIcons.home, color: Colors.blue),
          const SizedBox(width: 20),
          FaIcon(FontAwesomeIcons.userFriends, color: Colors.grey),
          const SizedBox(width: 20),
          FaIcon(FontAwesomeIcons.user, color: Colors.grey),
          const SizedBox(width: 20),
          FaIcon(FontAwesomeIcons.video, color: Colors.grey),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.bell, color: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NotificationPage(), // Change null to false or true
                        ),
                      );
                    },
                  ),
 const FaIcon(FontAwesomeIcons.bars, color: Colors.grey),                ],
              ),
            ),
            const SizedBox(height: 5),
            // Profile and search bar
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    width: 70,
                    height: 50,
                    child: Image.asset('assets/man.png'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What's on your mind, Sanjay?",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
 suffixIcon: const FaIcon(FontAwesomeIcons.image),                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
const FaIcon(FontAwesomeIcons.search, color: Colors.grey),                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 235, 227, 165),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 25, width: 5),
                        Icon(
                          FontAwesomeIcons.film,
                          color: Color.fromARGB(255, 241, 223, 14),
                        ),
                        SizedBox(height: 5, width: 10),
                        Text(
                          "Reels",
                          style: TextStyle(
                            color: Color.fromARGB(255, 241, 231, 16),
                          ),
                        ),
                        SizedBox(height: 5, width: 5),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 180, 233, 182),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 25, width: 5),
                        Icon(
                          FontAwesomeIcons.video,
                          color: Color.fromARGB(255, 14, 248, 33),
                        ),
                        SizedBox(height: 5, width: 5),
                        Text(
                          "  Room ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 42, 254, 53),
                          ),
                        ),
                        SizedBox(height: 5, width: 5),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 240, 170, 165),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.users,
                          color: Color.fromARGB(255, 253, 11, 11),
                        ),
                        SizedBox(height: 5, width: 5),
                        Text(
                          "  Group ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 240, 52, 52),
                          ),
                        ),
                        SizedBox(height: 5, width: 5),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 171, 215, 250),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.tv,
                          color: Color.fromARGB(255, 32, 88, 243),
                        ),
                        SizedBox(height: 5, width: 5),
                        Text(
                          "  Live ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 25, 43, 238),
                          ),
                        ),
                        SizedBox(height: 5, width: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Story section
            // Story Section
            const SizedBox(),
            Container(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  addStoryTile(),
                  storyTile("assets/woman.png", "Vish Patil"),
                  storyTile("assets/lens.png", "Rakesh Shetty"),
                  storyTile("assets/yoda.png", "Akash Bolre"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Post
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/profile.png',
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Deven mestry",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" is with "),
                              Text(
                                "Mahesh Joshi",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(children: [
                            Text(
                              "1 h • Mumbai, Maharastra .",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              FontAwesomeIcons.users,
                              weight: 30,
                              color: Color.fromARGB(255, 87, 93, 96),
                            ),
                          ])
                        ],
                      ),
                      Spacer(),
                      Icon(FontAwesomeIcons.ellipsisH),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("Old is Gold..!! ❤️😍"),
                  const SizedBox(height: 10),
                  Image.asset('assets/car.png'),
                ],
              ),
            ),
            // Like, Comment, Share Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.thumbsUp, color: Colors.blue),
                  Icon(FontAwesomeIcons.heart, color: Colors.red),
                  SizedBox(width: 5),
                  Text("1.2K"),
                  Spacer(),
                  Text("4 comments"),
                ],
              ),
            ),

            // Liked by section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Liked by Sachin Kumar and 100 others",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const Divider(),

// Bottom Navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bottomNavItem(FontAwesomeIcons.thumbsUp, "Like"),
                  bottomNavItem(FontAwesomeIcons.comment, "Comment"),
                  bottomNavItem(FontAwesomeIcons.share, "Share"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

Widget storyWidget(String imagePath, String name) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    width: 80,
    child: Column(
      children: [
        CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 30),
        const SizedBox(height: 5),
        Text(name, overflow: TextOverflow.ellipsis),
      ],
    ),
  );
}

Widget addStoryTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("assets/profile.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(FontAwesomeIcons.plus, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Text("Your Story"),
      ],
    ),
  );
}

Widget storyTile(String imagePath, String name) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Column(
      children: [
        Container(
          width: 100,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(name),
      ],
    ),
  );
}