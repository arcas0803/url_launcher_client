import 'package:flutter/widgets.dart';
import 'package:url_launcher_client/localization/url_launcher_localizations.dart';
import 'package:url_launcher_client/src/url_launcher_failure.dart';

class UrlLauncherFailureUtil {
  static String getFailureNameUI({
    required BuildContext context,
    required UrlLauncherFailure failure,
  }) {
    return UrlLauncherLocalizations.of(context)!.canNotLaunchUrl;
  }
}
