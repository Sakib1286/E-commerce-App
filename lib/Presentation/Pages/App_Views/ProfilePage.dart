import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text(
                "Naruto Uzumaki", // replace with dynamic data
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "sakib@example.com", // replace with dynamic data
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 12),

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


              ElevatedButton.icon(
                onPressed: () {
                  // Handle Logout
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
