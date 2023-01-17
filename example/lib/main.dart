import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:bottom_sheet_scaffold/bottom_sheet_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      bottomSheet: DraggableBottomSheet(
        body: const Center(
            child: Text(
          "Bottom Sheet",
          style: TextStyle(fontSize: 36, color: Colors.black),
        )),
        header: Container(
          height: 60,
          color: Colors.blue,
          child: const Center(
              child: Text(
            "Drag me",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "My AppBar",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            BottomSheetBuilder(
              builder: (status, context) {
                return MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    if (BottomSheetPanel.isExpanded) {
                      BottomSheetPanel.close();
                    } else {
                      BottomSheetPanel.open();
                    }
                  },
                  child: Icon(!status.isExpanded
                      ? Icons.open_in_browser
                      : Icons.close_fullscreen),
                );
              },
            ),
            const Text(
              'Body of scaffold',
            ),
          ],
        ),
      ),
    );
  }
}
