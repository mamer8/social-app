import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'show_toast.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    final _url = Uri.parse(url);

    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      showToast(msg: 'Cannot launch $url', state: ToastStates.error);
    }
  }
}
