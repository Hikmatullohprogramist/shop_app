import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class BottomSheetBarPage extends StatefulWidget {
  final String title;

  const BottomSheetBarPage({Key? key, this.title = ''}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomSheetBarPageState createState() => _BottomSheetBarPageState();
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomSheetBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        bottomAppBarColor: Colors.lightBlueAccent,
      ),
      home: const BottomSheetBarPage(title: 'BottomSheetBar'),
    );
  }
}

class _BottomSheetBarPageState extends State<BottomSheetBarPage> {
  final bool _isLocked = false;
  bool _isCollapsed = true;
  bool _isExpanded = false;
  int _listSize = 5;
  final _bsbController = BottomSheetBarController();
  final _listSizeController = TextEditingController(text: '5');

  @override
  void initState() {
    _bsbController.addListener(_onBsbChanged);
    _listSizeController.addListener(_onListSizeChanged);
    super.initState();
  }

  @override
  void dispose() {
    _bsbController.removeListener(_onBsbChanged);
    super.dispose();
  }

  void _onListSizeChanged() {
    _listSize = int.tryParse(_listSizeController.text) ?? 5;
  }

  void _onBsbChanged() {
    if (_bsbController.isCollapsed && !_isCollapsed) {
      setState(() {
        _isCollapsed = true;
        _isExpanded = false;
      });
    } else if (_bsbController.isExpanded && !_isExpanded) {
      setState(() {
        _isCollapsed = false;
        _isExpanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      actions: [
        if (_isCollapsed)
          IconButton(
            icon: const Icon(Icons.open_in_full),
            onPressed: _bsbController.expand,
          ),
        if (_isExpanded)
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: _bsbController.collapse,
          ),
      ],
    ),
    body: BottomSheetBar(
      willPopScope: true,
      // backButtonListener: true,
      backdropColor: Colors.green.withOpacity(0.8),
      locked: false,
      controller: _bsbController,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
      borderRadiusExpanded: const BorderRadius.only(
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(0.0),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5.0,
          blurRadius: 32.0,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
      expandedBuilder: (scrollController) {
        final itemList =
        List<int>.generate(_listSize, (index) => index + 1);

        // Wrapping the returned widget with [Material] for tap effects
        return Material(
          color: Colors.transparent,
          child: CustomScrollView(
            controller: scrollController,
            shrinkWrap: true,
            slivers: [
              SliverFixedExtentList(
                itemExtent: 56.0, // I'm forcing item heights
                delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                    title: Text(
                      itemList[index].toString(),
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          itemList[index].toString(),
                        ),
                      ),
                    ),
                  ),
                  childCount: _listSize,
                ),
              ),
            ],
          ),
        );
      },
      collapsed: TextButton(
        onPressed: () => _bsbController.expand(),
        child: Text(
          'Click${_isLocked ? "" : " or swipe"} to expand',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('BottomSheetBar is'),



          ],
        ),
      ),
    ),

  );


}