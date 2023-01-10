# bottom_sheet_scaffold

Slide your bottom sheet by sliding the body of the scaffold!. Very simple and customizable bottom sheet to implement.

## Features

- Easy usage
- Manage bottom sheet height by sliding the body of the scaffold
- Draggable bottom sheet body
- Full customizable
- Listen bottom sheet status by using BottomSheetBuilder
- No need to set any header to slide bottom sheet

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>Auto Swipping</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_auto_swipping.gif" width="150" />
                  </tr>
                </table>
            </td>   
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>Auto Swipping Closed</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_auto_swipping_closed.gif" width="150" />
                  </tr>
                </table>
            </td>   
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>Gradient Opacity</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_gradient_opacity.gif" width="150" />
                  </tr>
                </table>
            </td>   
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>No Header</h4>
                    <img src="https://raw.githubusercontent.com/FlutterWay/files/main/bottom_sheet_no_header.gif" width="150" />
                  </tr>
                </table>
            </td>   
            <td style="text-align: center">
                <table>
                 <tr>
                 	<h4>No Barrier</h4>
                    <img src="https://github.com/FlutterWay/files/blob/main/bottom_sheet_no_barrier.gif" width="150" />
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
      bottomSheet: DraggableBottomSheet(
        body: BottomSheetBody(),
        header: BottomSheetHeader(),//header is not required
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScaffoldBody(),
    )
```

## DraggableBottomSheet

```dart
const DraggableBottomSheet(
    {super.key,
    this.smoothness = Smoothness.low,
    this.maxHeight = 500,
    this.minHeight = 0,
    this.header,
    this.autoSwipped = true,
    this.draggableBody = true,
    this.toggleVisibilityOnTap = false,
    this.canUserSwipe = true,
    this.onHide,
    this.onShow,
    required this.body});
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
If you set the parameter called draggableBody in DraggableBottomSheet to false, you will need the DraggableArea widget to scroll the bottom sheet.

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
When you set state in Scaffold's body, the bottom sheet will close. If you need to listen bottom sheet status to change something in your page, use BottomSheetBuilder.

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
        draggableBody: false,
        body: Container(
          height: 500,
          color: Colors.red,
          child: const Center(
              child: Text(
            "Bottom Sheet",
            style: TextStyle(fontSize: 36, color: Colors.white),
          )),
        ),
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
        title: const Text("My AppBar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Body of scaffold',
            ),
          ],
        ),
      ),
      floatingActionButton: BottomSheetBuilder(
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
      ),
    );
  }
}

```

## Thanks to

This package is built on [solid_bottom_sheet](https://pub.dev/packages/solid_bottom_sheet). Thanks to him for allowing us to develop this package.