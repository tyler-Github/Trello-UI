import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trallo/model/PersonalBoardsModel.dart';

part 'TCBoardStore.g.dart';

class TCBoardStore = TCBoardStoreBase with _$TCBoardStore;

abstract class TCBoardStoreBase with Store {
  @observable
  var personalBoardModel = ObservableList<PersonalBoardModel>();

  @observable
  bool isStarred = false;

  @action
  void toggleStarred() {
    isStarred = !isStarred;
  }

  @action
  void addItem(PersonalBoardModel data) {
    personalBoardModel.add(data);

    log(personalBoardModel.length);
  }

  @action
  void removeItem(PersonalBoardModel data) {
    personalBoardModel.remove(data);
  }
}
