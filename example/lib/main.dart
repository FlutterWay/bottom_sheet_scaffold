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
      draggableBody: true,
      backgroundColor: Colors.white,
      
      bottomSheet: DraggableBottomSheet(
        draggableBody: true,
        gradientOpacity: true,
        maxHeight: MediaQuery.of(context).size.height,
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
          child: const Center(
              child: Text(
            'Gradient Opacity',
            style: TextStyle(fontSize: 24, color: Colors.white),
          )),
        ),
      ),
      appBar: AppBar(
        title: const Text("Bottom Sheet Scaffold"),
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
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
