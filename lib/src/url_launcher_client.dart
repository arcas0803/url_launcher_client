import 'package:common_classes/common_classes.dart';

import 'url_launcher_failure.dart';

/// [UrlLauncherClient] is an interface for the local storage client
///
abstract class UrlLauncherClient {
  /// [launchUrl] launches a url
  ///
  /// [url] is the url to be launched
  ///
  /// Throws a [CanNotLaunchFailure] if the url can not be launched
  ///
  Future<Result<void>> launchUrl({required String url});

  /// [launchEmail] launches an email
  ///
  /// [email] is the email to be launched
  ///
  /// [subject] is the subject of the email. It is optional
  ///
  /// [body] is the body of the email. It is optional
  ///
  /// Throws a [CanNotLaunchFailure] if the email can not be launched
  ///
  Future<Result<void>> launchEmail({
    required String email,
    String? subject,
    String? body,
  });

  /// [launchPhone] launches a phone
  ///
  /// [phone] is the phone to be launched
  ///
  /// Throws a [CanNotLaunchFailure] if the phone can not be launched
  ///
  Future<Result<void>> launchPhone({required String phone});

  /// [launchSms] launches a sms
  ///
  /// [phone] is the phone to be launched
  ///
  /// Throws a [CanNotLaunchFailure] if the sms can not be launched
  ///
  Future<Result<void>> launchSms({required String phone});

  /// [launchFile] launches a file
  ///
  /// [path] is the path to be launched
  ///
  /// Throws a [CanNotLaunchFailure] if the file can not be launched
  ///
  Future<Result<void>> launchFile({required String path});
}
