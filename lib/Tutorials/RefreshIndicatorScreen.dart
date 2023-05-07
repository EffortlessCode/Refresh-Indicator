import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorScreen extends StatefulWidget {
  const RefreshIndicatorScreen({Key? key}) : super(key: key);

  @override
  State<RefreshIndicatorScreen> createState() => _RefreshIndicatorScreenState();
}

class _RefreshIndicatorScreenState extends State<RefreshIndicatorScreen> {
  List<String> _items = List.generate(20, (index) => 'Item $index');

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _items = List.generate(20, (index) => 'ITEM  ${index + 20}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refresh Indicator"),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        onRefresh: _refresh,
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(18)),
                child: Center(
                  child: Text(
                    _items[index],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
