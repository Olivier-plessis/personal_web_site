import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_item_tool_bar_provider.g.dart';

@riverpod
class SelectedToolbarIndex extends _$SelectedToolbarIndex {
  @override
  int build() {
    return 0;
  }

  @override
  set state(int newState) => super.state = newState;
  int update(int Function(int state) cb) {
    if (cb(state) >= 0) {
      return state = cb(state);
    }
    return 0;
  }
}
