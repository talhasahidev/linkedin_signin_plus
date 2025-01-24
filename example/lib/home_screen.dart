import 'package:flutter/material.dart';
import 'package:linkedin_signin_plus/linkedin_signin_plus.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LinkedInConfig _linkedInConfig = LinkedInConfig(
      clientId: 'YOUR_CLIENT_ID', // Replace with your LinkedIn client ID
      clientSecret:
          'YOUR_CLIENT_SECRET', // Replace with your LinkedIn client secret
      redirectUrl:
          'YOUR_REDIRECT_URL'); // Replace with your LinkedIn redirect URL
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () async {
                  await LinkedinSigninPlus.signInWithLinkedin(context,
                      config: _linkedInConfig, onGetAuthToken: (token) {
                    inspect(token);
                  }, onGetUserProfile: (user) {
                    inspect(user);
                  });
                },
                child: const Text('Signin with Linkedin'))));
  }
}
