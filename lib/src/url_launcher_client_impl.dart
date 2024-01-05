import 'dart:async';

import 'package:common_classes/common_classes.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:url_launcher_client/src/url_launcher_client.dart';

import 'url_launcher_failure.dart';

/// [UrlLauncherClient] is an interface for the local storage client
///

class UrlLauncherClientImpl implements UrlLauncherClient {
  final Logger? _logger;

  final FutureOr<void> Function(Failure)? _telemetryOnError;

  final FutureOr<void> Function()? _telemetryOnSuccess;

  UrlLauncherClientImpl({
    Logger? logger,
    FutureOr<void> Function(Failure)? telemetryOnError,
    FutureOr<void> Function()? telemetryOnSuccess,
  })  : _logger = logger,
        _telemetryOnError = telemetryOnError,
        _telemetryOnSuccess = telemetryOnSuccess;

  @override
  Future<Result<void>> launchEmail(
      {required String email, String? subject, String? body}) {
    return Result.asyncGuard(
      () async {
        _logger?.d('[START] launching email $email');

        final url = Uri.parse('mailto:$email?subject=$subject&body=$body');

        final canLaunch = await launcher.launchUrl(url);

        if (!canLaunch) {
          throw CanNotLaunchFailure(
            url: url.toString(),
            error: 'Can not launch email',
            stackTrace: StackTrace.current,
          );
        }

        _telemetryOnSuccess?.call();
      },
      onError: (e, s) {
        final failure = CanNotLaunchFailure(
          url: email,
          error: e.toString(),
          stackTrace: s,
        );

        _logger?.e(
          '[ERROR] launching email $email',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> launchFile({required String path}) {
    return Result.asyncGuard(
      () async {
        _logger?.d('[START] launching file $path');

        final url = Uri.parse('file://$path');

        final canLaunch = await launcher.launchUrl(url);

        if (!canLaunch) {
          throw CanNotLaunchFailure(
            url: url.toString(),
            error: 'Can not launch file',
            stackTrace: StackTrace.current,
          );
        }

        _telemetryOnSuccess?.call();
      },
      onError: (e, s) {
        final failure = CanNotLaunchFailure(
          url: path,
          error: e.toString(),
          stackTrace: s,
        );

        _logger?.e(
          '[ERROR] launching file $path',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> launchPhone({required String phone}) {
    return Result.asyncGuard(
      () async {
        _logger?.d('[START] launching phone $phone');

        final url = Uri.parse('tel:$phone');

        final canLaunch = await launcher.launchUrl(url);

        if (!canLaunch) {
          throw CanNotLaunchFailure(
            url: url.toString(),
            error: 'Can not launch phone',
            stackTrace: StackTrace.current,
          );
        }

        _telemetryOnSuccess?.call();
      },
      onError: (e, s) {
        final failure = CanNotLaunchFailure(
          url: phone,
          error: e.toString(),
          stackTrace: s,
        );

        _logger?.e(
          '[ERROR] launching phone $phone',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> launchSms({required String phone}) {
    return Result.asyncGuard(
      () async {
        _logger?.d('[START] launching sms $phone');

        final url = Uri.parse('sms:$phone');

        final canLaunch = await launcher.launchUrl(url);

        if (!canLaunch) {
          throw CanNotLaunchFailure(
            url: url.toString(),
            error: 'Can not launch sms',
            stackTrace: StackTrace.current,
          );
        }

        _telemetryOnSuccess?.call();
      },
      onError: (e, s) {
        final failure = CanNotLaunchFailure(
          url: phone,
          error: e.toString(),
          stackTrace: s,
        );

        _logger?.e(
          '[ERROR] launching sms $phone',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> launchUrl({required String url}) {
    return Result.asyncGuard(
      () async {
        _logger?.d('[START] launching url $url');

        final canLaunch = await launcher.launchUrl(Uri.parse(url));

        if (!canLaunch) {
          throw CanNotLaunchFailure(
            url: url,
            error: 'Can not launch url',
            stackTrace: StackTrace.current,
          );
        }

        _telemetryOnSuccess?.call();
      },
      onError: (e, s) {
        final failure = CanNotLaunchFailure(
          url: url,
          error: e.toString(),
          stackTrace: s,
        );

        _logger?.e(
          '[ERROR] launching url $url',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }
}
