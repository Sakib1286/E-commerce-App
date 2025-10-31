import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Onboarding_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/naruto.png'), // replace with user profile image
              ),
              const SizedBox(height: 12),

              // Name & Email
              StreamBuilder<DocumentSnapshot<Map<String ,dynamic>>>(
                  stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),

                builder: (context ,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading...", style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),);
                    }

                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return const Text(
                        "No user found",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    }

                    final userData = snapshot.data!.data();
                    final lastName = userData?['lastName'] ?? 'Unknown';
                    final firstName = userData?['firstName'] ?? 'Unknown';
                    final fullName = "$firstName $lastName";
                    final email = userData?['email'] ?? 'No email';

                    return Column(
                      children: [
                        Text(
                          fullName,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          email,
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 12),
                      ],
                    );
        }
        ),

              // Edit Profile Button
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to Edit Profile Page
                },
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile",style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                ),
              ),
              const SizedBox(height: 24),

              // Quick Links / Info Section
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: const Text("My Orders"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Navigate to Orders Page
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text("Wishlist"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Navigate to Wishlist
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Navigate to Settings Page
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),


              ElevatedButton.icon (
                onPressed: () async{
                  try {
                  // Firebase logout
                  await FirebaseAuth.instance.signOut();


                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const OnboardingPage()),
                  (route) => false,
                  );
                  } catch (e) {

                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logout failed: $e')),
                  );
                  }

                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout",style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
