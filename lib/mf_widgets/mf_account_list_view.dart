import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MFAccountListController {
  List<Widget> children;
  ItemScrollController _itemScrollController;

  void scrollTo({@required int index}) {
    if (_itemScrollController != null) {
      _itemScrollController.scrollTo(index: index, duration: Duration(milliseconds: 200));
    }
  }

  bool checkAll() {
    bool check = true;
    if (children != null) {
      for (final item in children) {
        if (item is MFAccountCheck) {
          final temp = item as MFAccountCheck;
          if (temp.check().isNotEmpty) {
            if (check) {
              final index = children.indexOf(item);
              scrollTo(index: index);
            }
            check = false;
          }
        }
      }
    }
    return true;
  }
}

class MFAccountListView extends StatefulWidget {
  final MFAccountListController controller;
  final List<Widget> children;

  const MFAccountListView({
    Key key,
    this.children,
    this.controller,
  }) : super(key: key);

  @override
  _MFAccountListViewState createState() => _MFAccountListViewState();
}

class _MFAccountListViewState extends State<MFAccountListView> {
  final itemScrollController = ItemScrollController();

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller._itemScrollController = itemScrollController;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.children = widget.children;
    return ScrollablePositionedList.builder(
      itemScrollController: itemScrollController,
      itemCount: widget.children.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (ctx, index) {
        return widget.children[index];
      },
    );
  }
}

abstract class MFAccountCheck {
  String check();
}
