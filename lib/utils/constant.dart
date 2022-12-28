import 'package:flutter/cupertino.dart';
import 'package:ftoast/ftoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:todo_app_using_hive/utils/strings.dart';

import '../../main.dart';

emptyFieldsWarning(context) {
  return FToast.toast(
    context,
    msg: MyString.oopsMsg,
    subMsg: "You Must Fill All The Fields! ",
    corner: 20,
    duration: 2000,
    padding: EdgeInsets.all(20),
  );
}

nothigEnterOnUpdateTaskMode(context) {
  return FToast.toast(context,
      msg: MyString.oopsMsg,
      subMsg: "You Must Edit Tasks Then Try To Update it!",
      corner: 20,
      duration: 3000,
      padding: EdgeInsets.all(20));
}

dynamic warningNoTask(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(context,
      message:
          "There is no Task For Delete! Try adding some and then try to delete it!",
      buttonText: "Okay", onTapDismiss: () {
    Navigator.pop(context);
  }, panaraDialogType: PanaraDialogType.warning);
}

dynamic deleteAllTask(BuildContext context) {
  return PanaraConfirmDialog.show(context,
      message:
          "Do You really want to delete all tasks? You will no be able to undo this action!",
      confirmButtonText: "Yes",
      cancelButtonText: "No", onTapConfirm: () {
    BaseWidget.of(context).dataStore.box.clear();
    Navigator.pop(context);
  }, onTapCancel: () {
    Navigator.pop(context);
  }, panaraDialogType: PanaraDialogType.error, barrierDismissible: false);
}

String lottieURL = "assets/lottie/animate.json";
