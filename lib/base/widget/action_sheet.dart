import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../appearance/gaps.dart';

enum ActionSheetType {
  cupertino, // iOS风格
  flat,      // 扁平风格
}
extension on ActionSheetType {
  FLCupertinoActionSheetStyle get value {
    return this == ActionSheetType.cupertino ? FLCupertinoActionSheetStyle.roundedCard : FLCupertinoActionSheetStyle.filled;
  }
}

class ActionSheet {

  static void show({
    @required BuildContext context, 
    ActionSheetType type = ActionSheetType.flat, 
    Text title,
    @required List<CupertinoActionSheetAction> actions,
    CupertinoActionSheetAction cancelButton, 
  }) {
    showFLBottomSheet(context: context, builder: (BuildContext context) {
      return FLCupertinoActionSheet( 
        style: type.value,
        backgroundColor: Colors.white,
        cancelButton: cancelButton,
        child: Column(children: _sheetBody(title, actions)),
      );
    });
  }

  static List<Widget> _sheetBody(Text title, List<CupertinoActionSheetAction> actions) {
    List<Widget> widges = [];
    if (title != null) {
      widges.add(CupertinoActionSheetAction(child: title, onPressed: () => "",));
      widges.add(Gaps.line);
      for (var action in actions) { 
        widges.add(action);
        widges.add(Gaps.line);
      }
    } else {
      for (var action in actions) { 
        widges.add(action);
        widges.add(Gaps.line);
      }
    }

    return widges;
  }
}