# linkedin_signin_plus

**A Flutter plugin for integrating LinkedIn authentication into your apps, powered by the latest "Sign In with LinkedIn" using OpenID Connect.**

---

## Key Features
- **Modern Authentication**: Utilizes LinkedIn’s latest OpenID Connect protocol for secure and reliable login.
- **Easy Integration**: Simplifies LinkedIn login implementation with straightforward setup steps.
- **Customizable**: Tailored for seamless integration with your app’s existing authentication flow.
- **Up-to-Date**: Supports the latest LinkedIn authentication standards. (Note: Deprecated "Sign In with LinkedIn" is no longer supported.)

---

## Why Choose `linkedin_signin_plus`?
- Stay ahead with **secure** and **future-proof** LinkedIn authentication.
- Designed for developers seeking **effortless** setup and robust functionality.
- Ideal for both **personal** and **enterprise-grade** applications.

---

## Installation
Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  linkedin_signin_plus: latest_version
```

Then run:
```bash
flutter pub get
```

---

## Setup Guide

Follow these simple steps to integrate `linkedin_signin_plus` into your Flutter project:

### 1. Create a LinkedIn App
1. Go to the [LinkedIn Developer Console](https://www.linkedin.com/developers/).
2. Create a new application.

### 2. Add OpenID Connect Product
1. Navigate to the **Products** tab in your LinkedIn app settings.
2. Add the product **Sign In with LinkedIn using OpenID Connect**.

### 3. Configure Authentication
1. Under the **Auth** tab of your app settings:
   - Add your **Authorized Redirect URL** (this is the URL to which LinkedIn will redirect after login).
2. Obtain your **Client ID**, **Client Secret**, and **Redirect URL**.

### 4. Update Your Flutter Code
1. Import the package:
    ```dart
    import 'package:linkedin_signin_plus/linkedin_signin_plus.dart';
    ```
2. Configure the plugin in your app. For example:

---

### Full Example Code

Here’s a complete example of how to integrate `linkedin_signin_plus` into your Flutter app:

```dart
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
      clientSecret: 'YOUR_CLIENT_SECRET', // Replace with your LinkedIn client secret
      redirectUrl: 'YOUR_REDIRECT_URL'); // Replace with your LinkedIn redirect URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () async {
                  await LinkedinSigninPlus.signInWithLinkedin(context,
                      config: _linkedInConfig, 
                      onGetAuthToken: (token) {
                        inspect(token); // Inspect or use the token as needed
                      }, 
                      onGetUserProfile: (user) {
                        inspect(user); // Inspect or use user profile data
                      });
                },
                child: const Text('Sign in with LinkedIn'))));
  }
}
```

---

### Explanation

- **LinkedInConfig**: Configure your plugin with `clientId`, `clientSecret`, and `redirectUrl` obtained from the LinkedIn Developer Console.
- **signInWithLinkedin()**: This function handles the authentication process. It takes a context and a configuration object.
  - `onGetAuthToken`: Callback function that provides the authentication token.
  - `onGetUserProfile`: Callback function that provides the user's LinkedIn profile details.

Replace the placeholders (`YOUR_CLIENT_ID`, `YOUR_CLIENT_SECRET`, `YOUR_REDIRECT_URL`) with the actual credentials from your LinkedIn app configuration.

---

## Example App
Check out the [example project](https://github.com/YOUR_GITHUB_REPO) for a complete demonstration of how to use `linkedin_signin_plus` in a Flutter application.

---

## Additional Notes
- Ensure you have added the **Authorized Redirect URL** in your LinkedIn app configuration.
- Use a **unique state parameter** to prevent Cross-Site Request Forgery (CSRF) attacks.

---

## Contributions
We welcome contributions! Feel free to open issues, submit pull requests, or suggest new features.

---

## License
This project is licensed under the [MIT License](LICENSE).

---

## Support
If you have any questions or run into issues, please open an issue on [GitHub](https://github.com/YOUR_GITHUB_REPO) or contact us directly.

---

### Thank you for choosing `linkedin_signin_plus`! Let's build something amazing together. 🚀

