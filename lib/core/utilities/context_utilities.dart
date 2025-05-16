import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/core/theme/extensions/brand_theme.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  ThemeData get theme => Theme.of(this);
}

extension AppThemeExtension on ThemeData {
  BrandTheme get brandTheme => extension<BrandTheme>() ?? fallbackBrandTheme;

}
