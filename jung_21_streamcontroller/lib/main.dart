import 'package:flutter/material.dart';
import 'dart:async';

// Stream Controller - 이벤트를 보낼 수 있는 구독 시스템(Controller)을 만드는 기능.
void main() async {
  // var controller = StreamController<String>(); // StreamController() - <> 제네릭을 지정하지 않으면 기본이 dynamic 이다.
  var controller = StreamController<String>.broadcast();
  // .broadcast를 해주면 Stream has already been listened 에러 해결.
  // + 추가내용, .broadcast가 멀티스트림 controller인 여러 구독자를 관리할 수 있는 기능을 가진 추상클래스 타입으로 동작함.?
  var subscription01 = controller.stream; // controller.stream 이게 stream

  subscription01.listen(
    (data) {
      print('[01 Listen] onData - data: $data');
    },
    onDone: () {
      print('[01 Listen] onDone');
    },
    onError: (err) {
      print('[01 Listen] onError - err: $err');
    },
    cancelOnError: true,
  );

  // DartError: Bad state: Stream has already been listened to.
  var subscription02 = controller.stream; // controller.stream 이게 stream

  subscription02.listen(
    (data) {
      print('[02 Listen] onData - data: $data');
    },
    onDone: () {
      print('[02 Listen] onDone');
    },
    onError: (err) {
      print('[02 Listen] onError - err: $err');
    },
    cancelOnError: true,
  );

  // Listener를 가지고 있는지 확인.
  print('controller.hasListener: ${controller.hasListener}');

  // 제네릭을 지정하면 controller를 통해서 이벤트를 보낼 수 있다.
  controller.add("안녕하세요! 1"); // add를 통해서 데이터를 보낸다.
  controller.add("안녕하세요! 2"); // add를 통해서 데이터를 보낸다.

  controller.close(); // close() - 이렇게 해도 이후 코드는 출력안됨.

  controller.add("안녕하세요! 3"); // add를 통해서 데이터를 보낸다.
  // controller.addError('에러입니다.'); // add를 통해서 데이터를 보낸다.

  controller.add("안녕하세요! 4"); // add를 통해서 데이터를 보낸다.
  // someDelayedWords();
  controller.addStream(someDelayedWords());
}

Stream<String> someDelayedWords() async* {
  await Future.delayed(Duration(seconds: 2));
  yield '오늘도';
  await Future.delayed(Duration(seconds: 2));
  yield '빡코딩!!';
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
