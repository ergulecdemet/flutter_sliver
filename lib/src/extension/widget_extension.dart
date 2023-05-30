import 'package:flutter/material.dart';
import 'package:sliver_delegate/src/widget/gradient_background_widget.dart';
import '../../sliver_header_delegate.dart';
import '../widget/flexible_text_widget.dart';
import '../widget/header_item_widget.dart';
import '../widget/mutable_background_widget.dart';

extension XWidget on Widget {
  Widget transform(double progress) {
    if (this is FlexibleTextItem) {
      return FlexibleTextItemWidget(this as FlexibleTextItem?, progress);
    } else if (this is FlexibleHeaderItem) {
      return HeaderItemWidget(this as FlexibleHeaderItem?, progress);
    } else if (this is MutableBackground) {
      return MutableBackgroundWidget(progress, this as MutableBackground?);
    } else if (this is GradientBackground) {
      return GradientBackgroundWidget(progress, this as GradientBackground?);
    }

    return this;
  }
}
