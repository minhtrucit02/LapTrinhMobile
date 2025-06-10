import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
      ),
      body:
         Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user?.photoURL ?? ""),
              ),
            ),
            Text('Name: ${user?.displayName}'),
            Text('Email: ${user?.email}'),
            // Text('Date of Birth: ${user?.}'),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Text('Logout'),
            ),
          ],
      ),
    );
  }
}