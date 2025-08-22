import 'package:flutter/material.dart';
import 'package:learning/helper/session.dart';
import 'package:learning/helper/user.dart';
import 'package:learning/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User? currentUser = UserSession().currentUser;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section with purple background and profile picture
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD0BCFF), // Light purple color
                  ),
                  child: Image.asset("assets/images/bg.jpg", fit: BoxFit.cover),
                ),
                // This container creates the white background area
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.25),
                  height: screenHeight * 0.10,
                  width: double.infinity,
                  color: Colors.white,
                ),
                // Profile Picture
                Positioned(
                  top:
                      screenHeight *
                      0.15, // Adjust this value to position the avatar
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage(
                        "assets/images/profile_01.jpg",
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // User Info Section
            Column(
              children: [
                const Text(
                  'Thy Never Care',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                // Phone details (inlined)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      Text(
                        currentUser!.phone_number,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Mail details (inlined)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mail',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      Text(
                        currentUser!.email,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(indent: 20, endIndent: 20),
              ],
            ),

            // Menu List Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  // Profile Details (inlined)
                  const ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text(
                      'Profile details',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const Divider(indent: 20, endIndent: 20),
                  // Settings (inlined)
                  const ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text('Settings', style: TextStyle(fontSize: 16)),
                  ),
                  const Divider(indent: 20, endIndent: 20),
                  // Log Out (inlined)
                  ListTile(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    leading: const Icon(Icons.logout),
                    title: const Text('Log out', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
