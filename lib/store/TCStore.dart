import 'package:mobx/mobx.dart';

part 'TCStore.g.dart';

class TCStore = TCStoreBase with _$TCStore;

abstract class TCStoreBase with Store {
  @observable
  bool isOptionVisible = false;

  @action
  Future<void> toggleFABOption() async {
    isOptionVisible = !isOptionVisible;
  }
}
