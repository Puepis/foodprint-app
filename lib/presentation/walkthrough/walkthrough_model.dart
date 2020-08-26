import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/infrastructure/local_storage/onboarding_client.dart';

class WalkthroughModel extends ChangeNotifier {
  bool enabled;
  int screen = 0;
  final OnboardingClient _onboardingClient =
      OnboardingClient(const FlutterSecureStorage());

  void next() {
    screen++;
    notifyListeners();
  }

  void prev() {
    screen--;
    notifyListeners();
  }

  Future<void> finish(String username) async {
    enabled = false;
    screen = 0;
    await _onboardingClient.markWalkthroughFinished(username);
    notifyListeners();
  }

  WalkthroughModel({this.enabled});
}
