import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GachaAlertDialog {
  final String? message;
  final String? dialogTitle;
  final Widget? child;
  final bool? showCancel;
  final bool? showCommit;
  final VoidCallback? onCancelTap;
  final VoidCallback? onCommitTap;
  final String cancelText;
  final String commitText;

  GachaAlertDialog(
      {this.message,
      this.dialogTitle = '提示',
      this.showCancel = true,
      this.showCommit = true,
      this.onCancelTap,
      this.onCommitTap,
      this.cancelText = '取消',
      this.commitText = '确定',
      this.child}) {}

  AlertDialog build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      // title: const Text('Dialog Title'),
      content: SizedBox(
        width: 200,
        height: 200,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    "提示",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )),
              Container(
                width: 500,
                color: const Color(0xffe9e9e9),
                height: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                flex: 1,
                child: (child ??
                    const Text(
                      'This is the content of the dialog.',
                      style: TextStyle(color: Color(0xff333333), fontSize: 14),
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              buildBottomButtonContainer(context)
            ],
          ),
        ),
      ),
    );
  }

  Container buildBottomButtonContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: buildCancelButton(context),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 1,
            child: buildCommitButton(context),
          ),
        ],
      ),
    );
  }

  Widget buildCommitButton(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: const Color(0xffffb400),
      ),
      child: InkWell(
        onTap: onCommitTap ?? () => Navigator.of(context).pop(),
        child: Container(
            height: 35, alignment: Alignment.center, child: Text(commitText)),
      ),
    );
  }

  Widget buildCancelButton(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(
            color: const Color(0xff1a1b1f), // 边框颜色
            width: 1.0, // 边框宽度
          ),
        ),
        child: InkWell(
          onTap: onCancelTap ?? () => Navigator.of(context).pop(),
          child: Container(
            height: 35,
            alignment: Alignment.center,
            child: Text(cancelText),
          ),
        ));
  }
}

class MyDialogs {
  static AlertDialog getDefaultDialog(BuildContext context, {Widget? child}) {
    return GachaAlertDialog(
      dialogTitle: '提示',
      showCommit: false,
      onCancelTap: () {
        Navigator.of(context).pop();
      },
    ).build(context);
  }

  static void showMaterialAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialogs.getDefaultDialog(context);
      },
    );
  }

  static void showAlertDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: CupertinoAlertDialog(
            content: Container(
              color: Colors.red,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(child: Text('This is an alert dialog.'))
                ],
              ),
            ),
            // actions: <Widget>[
            //   CupertinoDialogAction(
            //     child: Text('Cancel'),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            //   CupertinoDialogAction(
            //     child: Text('OK'),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          ),
        );
      },
    );
  }
}
