// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'App name';

  @override
  String get error => 'Error';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get ok => 'OK';

  @override
  String get error_internetConnectionFailure => 'No Internet Connection';

  @override
  String get unexpectedErrorMessage_reassurance => 'Unexpected Error';

  @override
  String get cancel => 'Cancel';
}
