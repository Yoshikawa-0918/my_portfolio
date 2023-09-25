import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/provider/duration_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final itemScrollControllerProvider = Provider((ref) {
  return ItemScrollControllerModel(ref);
});

class ItemScrollControllerModel {
  ItemScrollController itemScrollController = ItemScrollController();
  ItemScrollControllerModel(this.ref);

  final Ref ref;

  void scrollToTopic(int index) {
    itemScrollController.scrollTo(
        index: index, duration: ref.read(durationProvider));
  }
}
