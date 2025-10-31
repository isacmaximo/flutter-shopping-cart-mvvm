import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/utils/enums/view_states.dart';

class ViewStateWidget extends StatelessWidget {
  final ViewState viewState;
  final Widget loadingWidget;
  final Widget loadedWidget;
  final Widget errorWidget;

  const ViewStateWidget({
    super.key,
    required this.viewState,
    required this.loadingWidget,
    required this.loadedWidget,
    required this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    switch (viewState) {
      case ViewState.loading:
        return loadingWidget;
      case ViewState.value:
        return loadedWidget;
      case ViewState.error:
        return errorWidget;
    }
  }
}
