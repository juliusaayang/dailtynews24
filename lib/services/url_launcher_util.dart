import 'dart:async';

import 'package:dailynews24/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  static Future<void> launchUrlLink(
    BuildContext context, {
    required String url,
    String? scheme,
    Map<String, dynamic>? queries,
  }) async {
    final uri = Uri(
      scheme: scheme,
      path: Uri.encodeFull(url),
      queryParameters: queries,
    );
    if (await canLaunchUrl(
      uri,
    )) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      if (!context.mounted) return;
      unawaited(
        Fluttertoast.showToast(
          msg: '$url was not able to open',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.lighterGray,
          textColor: AppColors.black,
          fontSize: 16.0,
        ),
      );
    }
  }
}
