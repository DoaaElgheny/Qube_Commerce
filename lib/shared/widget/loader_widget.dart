import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../core/utils/app_colors.dart';

class LoaderWidget {
  static show(BuildContext context, Future Function() waitingFor) async {
    try {
      Loader.show(
        context,
        progressIndicator: circleProgressIndicator(),
      );
      await Future.delayed(Duration.zero);
      await waitingFor();
      Loader.hide();
    } catch (e) {
      log('LoaderWidget.show error is $e');
      showSimpleNotification(
          Text(
            e.toString(),
          ),
          background: Colors.red);
      Loader.hide();
    }
  }

  static circleProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(color: AppColors.primaryColor),
    );
  }
}
