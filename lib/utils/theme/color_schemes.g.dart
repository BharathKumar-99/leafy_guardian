import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF7FD8AB), // Washed-out version of primary color
  onPrimary: Color(0xFFFFFFFF), // Keep white unchanged
  primaryContainer:
      Color(0xFFD5FBD9), // Washed-out version of primary container color
  onPrimaryContainer: Color(0xFFFFFFFF), // Keep white unchanged
  secondary: Color(0xFF7FD8AA), // Washed-out version of secondary color
  onSecondary: Color(0xFFFFFFFF), // Keep white unchanged
  secondaryContainer:
      Color(0xFFD6FBD8), // Washed-out version of secondary container color
  onSecondaryContainer: Color(0xFFFFFFFF), // Keep white unchanged
  tertiary: Color(0xFF6CC0E7), // Washed-out version of tertiary color
  onTertiary: Color(0xFFFFFFFF), // Keep white unchanged
  tertiaryContainer:
      Color(0xFFE4EEFF), // Washed-out version of tertiary container color
  onTertiaryContainer: Color(0xFFFFFFFF), // Keep white unchanged
  error: Color(0xFFB26666), // Washed-out version of error color
  errorContainer:
      Color(0xFFFFE8E8), // Washed-out version of error container color
  onError: Color(0xFFFFFFFF), // Keep white unchanged
  onErrorContainer: Color(0xFFFFFFFF), // Keep white unchanged
  background: Color(0xFFF5F9F2), // Washed-out version of background color
  onBackground: Color(0xFF191C19), // Adjusted to maintain contrast
  surface: Color(0xFFF5F9F2), // Washed-out version of surface color
  onSurface: Color(0xFF191C19), // Adjusted to maintain contrast
  surfaceVariant:
      Color(0xFFE1EAE1), // Washed-out version of surface variant color
  onSurfaceVariant: Color(0xFF414942), // Adjusted to maintain contrast
  outline: Color(0xFFB3B3B3), // Washed-out version of outline color
  onInverseSurface:
      Color(0xFFF5F6F0), // Washed-out version of onInverseSurface color
  inverseSurface: Color(0xFF2E312E), // Keep white unchanged
  inversePrimary:
      Color(0xFFA3E2B2), // Washed-out version of inversePrimary color
  shadow: Color(0xFF7F7F7F), // Washed-out version of shadow color
  surfaceTint: Color(0xFF7FD8AB), // Washed-out version of surfaceTint color
  outlineVariant:
      Color(0xFFD5DBD3), // Washed-out version of outlineVariant color
  scrim: Color(0x80000000), // Adjusted opacity to make it washed-out
);

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(lightColorScheme.tertiary),
  foregroundColor: MaterialStateProperty.all(lightColorScheme.onTertiary),
  shape: MaterialStateProperty.all(
    const BeveledRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
    ),
  ),
  fixedSize: MaterialStateProperty.all(const Size(double.infinity, 56)),
));

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF7CDA9B),
  onPrimary: Color(0xFF00391C),
  primaryContainer: Color(0xFF00522C),
  onPrimaryContainer: Color(0xFF98F7B6),
  secondary: Color(0xFF7DDA9B),
  onSecondary: Color(0xFF00391C),
  secondaryContainer: Color(0xFF00522B),
  onSecondaryContainer: Color(0xFF99F7B5),
  tertiary: Color(0xFFA5C8FF),
  onTertiary: Color(0xFF00315E),
  tertiaryContainer: Color(0xFF004785),
  onTertiaryContainer: Color(0xFFD4E3FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C19),
  onBackground: Color(0xFFE1E3DE),
  surface: Color(0xFF191C19),
  onSurface: Color(0xFFE1E3DE),
  surfaceVariant: Color(0xFF414942),
  onSurfaceVariant: Color(0xFFC0C9BF),
  outline: Color(0xFF8B938A),
  onInverseSurface: Color(0xFF191C19),
  inverseSurface: Color(0xFFE1E3DE),
  inversePrimary: Color(0xFF006D3C),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF7CDA9B),
  outlineVariant: Color(0xFF414942),
  scrim: Color(0xFF000000),
);
