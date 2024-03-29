# bottom_sheet_scaffold

Slide your bottom sheet by sliding the body of the scaffold!. Very simple and customizable bottom sheet implementation.

<img width=1200 src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_views/bottomSheetPoster.png" />

## Features

- Easy usage
- Determine the height of the bottom sheet by sliding the body of the scaffold
- Draggable bottom sheet body
- Animated Opacity
- Fully customizable
- Listen the status of bottom sheet by using BottomSheetBuilder
- No need to set any header to slide bottom sheet

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>Scaffold Swipping</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_views/bottom_sheet_swipping_with_scaffold_body.gif" width="150" />
                  </tr>
                </table>
            </td>   
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>Header Swipping</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_views/bottom_sheet_swipping_with_header.gif" width="150" />
                  </tr>
                </table>
            </td>   
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>Gradient Opacity</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_views/bottom_sheet_gradient_opacity.gif" width="150" />
                  </tr>
                </table>
            </td>   
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>Fixed height</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_views/bottom_sheet_auto_swipping_closed.gif" width="150" />
                  </tr>
                </table>
            </td>   
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>Custom</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_views/bottom_sheet_custom.gif" width="150" />
                  </tr>
                </table>
            </td>   
        </tr> 
    </table>
</div>


## Usage

Change your Scaffold into BottomSheetScaffold. 

```dart
BottomSheetScaffold(
      draggableBody: true,
      dismissOnClick: true,
      barrierColor: Colors.black54,
      bottomSheet: DraggableBottomSheet(
        animationDuration: Duration(milliseconds: 200),
        body: BottomSheetBody(),
        header: BottomSheetHeader(),//header is not required
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScaffoldBody(),
    )
```

### You can customize OnWillPop of BottomSheet

```dart
BottomSheetScaffold(
      draggableBody: true,
      dismissOnClick: true,
      onWillPop: (() async {
        if (BottomSheetPanel.isOpen) {
          BottomSheetPanel.close();
          return false;
        } else {
          return true;
        }
      }),
      barrierColor: Colors.black54,
      bottomSheet: DraggableBottomSheet(
        animationDuration: Duration(milliseconds: 200),
        body: BottomSheetBody(),
        header: BottomSheetHeader(),//header is not required
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScaffoldBody(),
    )
```

## Barrier not being displayed in scaffold to be used inside
If you use Scaffold inside BottomSheetScaffold, you should wrap the body of the Scaffold with BarrierViewer. This way you can display the barrier color you defined when the bottom sheet is opened

```dart
return BottomSheetScaffold(
      bottomSheet: DraggableBottomSheet(
        animationDuration: const Duration(milliseconds: 200),
        body: Container(
            width: double.infinity,
            height: 500,
            alignment: Alignment.center,
            child: const Text(
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
      body: Scaffold(
        body: BarrierViewer(
          child: Center(
            child: Column(
```

## DraggableBottomSheet

```dart
DraggableBottomSheet(
    {super.key,
    this.maxHeight = 500,
    this.minHeight = 0,
    this.header,
    this.animationDuration = const Duration(milliseconds: 200),
    this.autoSwipped = true,
    this.draggableBody = true,
    this.gradientOpacity = true,
    this.headerVisibilityOnTap = true,
    this.backgroundColor = Colors.white60,
    this.onHide,
    this.radius = 30,
    this.onShow,
    required this.body})
```

## BottomSheetPanel

Open bottom sheet
```dart
BottomSheetPanel.open();
```
Close bottom sheet
```dart
BottomSheetPanel.close();
```
Update height of bottom sheet
```dart
BottomSheetPanel.close();
```
Check if bottom sheet is opened
```dart
BottomSheetPanel.isOpen;
```
Check if bottom sheet is expanded
```dart
BottomSheetPanel.isExpanded;
```
Check if bottom sheet is collapsed
```dart
BottomSheetPanel.isCollapsed;
```

## DraggableArea
If you set the parameter "draggableBody" in DraggableBottomSheet to false, you will need the DraggableArea widget to scroll the bottom sheet.

```dart
DraggableBottomSheet(
        draggableBody: false,
        body: Column(
          children: [
            DraggableArea(
              child: Container(
                height: 80,
                width: double.infinity,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Drag Me",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 500,
              color: Colors.red,
              child: const Center(
                  child: Text(
                "Bottom Sheet",
                style: TextStyle(fontSize: 36, color: Colors.white),
              )),
            )
          ],
        ),
      )
```
## BottomSheetBuilder
Use BottomSheetBuilder if you need to listen bottom sheet status to change something in your page.

```dart
BottomSheetBuilder(
        builder: (status, context) {
          return FloatingActionButton(
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
      )
```


## Example

```dart
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
```
