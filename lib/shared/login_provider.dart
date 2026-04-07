import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void setEmail(String email) {
    state = email;
  }
}

final loginProvider = NotifierProvider<LoginNotifier, String>(
  LoginNotifier.new,
);
