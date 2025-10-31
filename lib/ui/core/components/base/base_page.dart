import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/dialog/can_pop_dialog.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/components/state_widget/view_state_widget.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';
import 'package:flutter_shopping_cart_mvvm/utils/enums/view_states.dart';

class BasePage extends StatelessWidget {
  final String title;
  final Widget loadedWidget;
  final Widget errorWidget;
  final ViewState viewState;
  final int quantity;
  final bool disableCartAction;
  final bool canShowExitDialog;

  const BasePage({
    super.key,
    required this.title,
    required this.loadedWidget,
    required this.errorWidget,
    required this.viewState,
    required this.quantity,
    this.disableCartAction = false,
    this.canShowExitDialog = false,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        Future.delayed(Duration.zero, () {
          if (canShowExitDialog) {
            if (context.mounted) {
              showDialog(
                context: context,
                builder: (context) => CanPopDialog(),
              );
            }
          } else if (viewState != ViewState.loading) {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            if (!disableCartAction)
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: Badge(
                  backgroundColor: colorScheme.secondary,
                  label: Text(quantity.toString()),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart, size: 26),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cart');
                    },
                  ),
                ),
              ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: ViewStateWidget(
            viewState: viewState,
            loadingWidget: Center(child: const CircularProgressIndicator()),
            loadedWidget: loadedWidget,
            errorWidget: errorWidget,
          ),
        ),
      ),
    );
  }
}
