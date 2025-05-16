import 'package:flutter/material.dart';

class BrandTheme extends ThemeExtension<BrandTheme> {
  BrandTheme({
    required this.primary,
    required this.primary40,
    required this.secondary,
  });

  final Color primary;
  final Color primary40;
  final Color secondary;
 

  @override
  ThemeExtension<BrandTheme> copyWith({
    Color? primary,
    Color? primary20,
    Color? primary40,
    Color? secondary,

  }) =>
      BrandTheme(
        primary: primary ?? this.primary,
        primary40: primary40 ?? this.primary40, 
        secondary: secondary ?? this.secondary,
       
      );

  @override
  ThemeExtension<BrandTheme> lerp(covariant ThemeExtension<BrandTheme>? other, double t) {
    if (other is! BrandTheme) return this;
    return BrandTheme(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      primary40: Color.lerp(primary40, other.primary40, t) ?? primary40,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      
    );
  }
}
