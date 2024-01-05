import 'package:common_classes/common_classes.dart';

sealed class UrlLauncherFailure extends Failure {
  UrlLauncherFailure(
      {required super.message,
      required super.error,
      required super.stackTrace});
}

final class CanNotLaunchFailure extends UrlLauncherFailure {
  CanNotLaunchFailure({
    required String url,
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Can not launch $url',
          error: error,
          stackTrace: stackTrace,
        );
}
