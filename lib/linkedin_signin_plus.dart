library linkedin_signin_plus;

import 'package:flutter/material.dart';
import 'package:linkedin_signin_plus/src/core/linkedin_api.dart';
import '/src/model/models.dart';
import '/src/core/exceptions.dart';
import '/src/webview/linked_in_web_view_handler.dart';
export '/src/model/models.dart';

class LinkedinSigninPlus {
  static Future<dynamic> signInWithLinkedin(BuildContext context,
      {required LinkedInConfig config,
      PreferredSizeWidget? appBar,
      OnGetUserProfile? onGetUserProfile,
      OnGetAuthToken? onGetAuthToken,
      OnError? onError,
      bool destroySession = false}) async {
    LinkedInApi.instance.config = config;
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => LinkedInWebViewHandler(
              appBar: appBar,
              getUserProfile: onGetUserProfile != null,
              destroySession: destroySession),
          fullscreenDialog: true),
    );
    if (result is LinkedInAccessToken) {
      onGetAuthToken?.call(result);
    } else if (result is LinkedInUserModel) {
      onGetUserProfile?.call(result);
    } else if (result is HttpResponseException) {
      onError?.call(result);
    }
  }
}
