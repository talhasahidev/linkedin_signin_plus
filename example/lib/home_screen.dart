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
      clientId: '77h78sa9rr3z1j',
      clientSecret: 'WPL_AP1.Z5ysCBDTlFWh2Fvn.bCQUlQ==',
      redirectUrl: 'https://adspaper.online/api/auth/linkedin/callback');
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
                child: const Text('Signin with linkedin'))));
  }
}
