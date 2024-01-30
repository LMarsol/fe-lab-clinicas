import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final class Messages {
  static void showInfo(BuildContext context, String message) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message));
  }

  static void showError(BuildContext context, String message) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.error(message: message));
  }

  static void showSuccess(BuildContext context, String message) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.success(message: message));
  }
}

mixin MessagesStateMixin {
  final Signal<String?> _infoMessage = signal(null);
  String? get infoMessage => _infoMessage();

  final Signal<String?> _errorMessage = signal(null);
  String? get errorMessage => _errorMessage();

  final Signal<String?> _successMessage = signal(null);
  String? get successMessage => _successMessage();

  void clearInfo() => _infoMessage.value = null;
  void clearError() => _errorMessage.value = null;
  void clearSuccess() => _successMessage.value = null;

  void clearAllMessages() {
    untracked(() {
      clearInfo();
      clearError();
      clearSuccess();
    });
  }

  void showInfo(String message) {
    untracked(() => clearInfo());
    _infoMessage.value = message;
  }

  void showError(String message) {
    untracked(() => clearError());
    _errorMessage.value = message;
  }

  void showSuccess(String message) {
    untracked(() => clearSuccess());
    _successMessage.value = message;
  }
}

mixin MessagesViewMixin<T extends StatefulWidget> on State<T> {
  void messageListener(MessagesStateMixin state) {
    effect(() {
      switch (state) {
        case MessagesStateMixin(:final infoMessage?):
          Messages.showInfo(context, infoMessage);
        case MessagesStateMixin(:final errorMessage?):
          Messages.showError(context, errorMessage);
        case MessagesStateMixin(:final successMessage?):
          Messages.showError(context, successMessage);
      }
    });
  }
}
