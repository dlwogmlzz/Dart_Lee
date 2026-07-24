import 'package:flutter/material.dart';
import 'dart:async';

void main() async {
  // Completer - 원하는 시점에 이벤트를 전달해줄 수 있는 기능.
  // import 'dart:async'; 임폴트 해줘야 함.
  // var completer = Completer();

  // // 콜백기반 함수 Future
  // Future.delayed(Duration(seconds: 2), () {
  //   // 이거는 async await 방식이 아님.
  //   print('2초뒤 작업');
  //   completer.completeError("error 발생!");
  //   // completer.complete('완료'); // completer.complete, 데이터를 보내줘야 된다.
  // });

  // completer.future.then(
  //   (value) {
  //     // 미래에 비동기 작업이 완료되면(future), 그 결과값을 가지고 다음에 무엇을 할지(then)정해주는 콜백 함수임.
  //     print('value: $value');
  //   },
  //   onError: (err) {
  //     print('onError: $err');
  //   },
  // );

  print('Hello, Flutter');
  // async await는 하나 기다리고 들어오는 방식.
  var result1 = await someDelayAsyncFunction();
  // var result2 = await someDelayAsyncFunction();

  // async await인데 동시에 하고 싶으면 await를 빼고, Future.wait를 걸면된다.
  
  // 동시에 들어옴.
  someDelayAsyncFunction().then((result) {

  });

  someDelayAsyncFunction().then((result) {

  });

  print(result1);
  multipleCallbackFunction((finalResult) {
    print(finalResult);
  });

  // async await로 바뀌면 await로 받아야된다.
  // var result = await completer.future; // async await 방식으로 받고 있음.
  // print('result: $result');

  // ** 이벤트를 받을 때 두 가지 타입으로 받을 수 있다.
  // 1. async await로 받는 방법.
  // 2. then을 사용해서 받는 방법.
}

// completer -> Future 방식으로 변경
Future<String> someDelayAsyncFunction([int delay = 2]) async {
  var completer =
      Completer(); // Completer를 활용해 어떤 조건에 따라서 내가 원하는 때에 이벤트를 줄 수 있다.

  Future.delayed(Duration(seconds: delay), () {
    // 이거는 async await 방식이 아님.
    print('완료!! $delay초 경과됨');
    completer.complete('완료!! $delay초 경과됨'); // complete는 한번밖에 안된다.
    // completer.isCompleted - 진짜 완료가 됐는지 안됐는지 확인
  });

  return await completer.future;
}

// 반환이 없는 위치 기반 매개변수를 가진 하나의 콜백함수.
void someDelayCallbackFunction(
  void Function(String) callback, {
  int delay = 2,
}) {
  Future.delayed(Duration(seconds: delay), () {
    // 이거는 async await 방식이 아님.
    print('완료!! $delay초 경과됨');
    callback('완료!! $delay초 경과됨');
  });
}

// 여러개의 콜백 함수를 한번에 받는 경우
void multipleCallbackFunction(void Function(List<String>) callback) {
  var firstCompleter = Completer<String>();
  var secondCompleter = Completer<String>();
  var thirdCompleter = Completer<String>();

  // 여러개를 호출해서 여러개의 결과를 한번에 처리하고 싶을때.
  someDelayCallbackFunction(delay: 3, (result1) {
    firstCompleter.complete(result1);
  });

  someDelayCallbackFunction(delay: 1, (result2) {
    secondCompleter.complete(result2);
  });

  someDelayCallbackFunction(delay: 2, (result3) {
    thirdCompleter.complete(result3);
  });

  Future.wait([
    firstCompleter.future,
    secondCompleter.future,
    thirdCompleter.future,
  ]).then((results) {
    callback(results);
  });
}

Future<List<String>> multipleAsyncFunction() async {
  var firstCompleter = Completer<String>();
  var secondCompleter = Completer<String>();
  var thirdCompleter = Completer<String>();

  // 여러개를 호출해서 여러개의 결과를 한번에 처리하고 싶을때.
  someDelayCallbackFunction(delay: 3, (result1) {
    firstCompleter.complete(result1);
  });

  someDelayCallbackFunction(delay: 1, (result2) {
    secondCompleter.complete(result2);
  });

  someDelayCallbackFunction(delay: 2, (result3) {
    thirdCompleter.complete(result3);
  });

  return Future.wait([
    firstCompleter.future,
    secondCompleter.future,
    thirdCompleter.future,
  ]);
}
// runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
