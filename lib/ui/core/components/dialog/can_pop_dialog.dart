import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';

class CanPopDialog extends StatelessWidget {
  const CanPopDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Deseja sair do aplicativo ?',
        style: TextStyles.largeBold,
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
          child: Text('Sim', style: TextStyles.mediumRegular),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Não', style: TextStyles.mediumRegular),
        ),
      ],
    );
  }
}
