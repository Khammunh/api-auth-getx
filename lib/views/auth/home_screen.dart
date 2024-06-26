import 'package:api_auth/views/auth/screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                final SharedPreferences? prefs = await _prefs;
                prefs?.clear();
                Get.offAll(AuthScreen());
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Welcome home"),
            TextButton(
              onPressed: () async {
                final SharedPreferences? prefs = await _prefs;
                print(
                  prefs?.get('token'),
                );
              },
              child: Text("Print token"),
            ),
          ],
        ),
      ),
    );
  }
}
