//REVIEW - this class contains helpers codes to macke code more clean

import 'package:flutter/cupertino.dart';

T conditionGetter<T>(bool condition, T whileTrue, T whileFalse) =>
    condition ? whileTrue : whileFalse;

extension S on State {
  Map getArgument(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as Map;
  }
}

extension Args on StatelessWidget {
  Map getArgument(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as Map;
  }
}
