import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/utilities/extensions/shared_pref_provider.dart';

final usernameProvider =
    StateNotifierProvider<UsernameNotifier, String?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return UsernameNotifier(prefs);
});

class UsernameNotifier extends StateNotifier<String?> {
  final SharedPreferences prefs;

  UsernameNotifier(this.prefs) : super(prefs.getString('username'));

  Future<void> setUsername(String name) async {
    await prefs.setString('username', name);
    state = name;
  }

  Future<void> clearUsername() async {
    await prefs.remove('username');
    state = null;
  }
}
