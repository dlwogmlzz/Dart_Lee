import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

void main() async {
  // Future로도 비동기 처리가 가능한데, 문제가 발생한다!?
  // await, Future는 1회성으로 한번 보내고 끝남..
  // var firstUser = await getUserName();
  // var secondUser = await getUserName();
  // var ThirdUser = await getUserName();

  // async await 방식으로 받는경우.
  print('헬로 stream');
  // await for (var user in getUserNameStream()) {
  //   // for - 반복적으로 getUserNameStream 하나하나가 들어오게 됨.
  //   // 하나하나 받아서 출력
  //   print('user : $user');
  // }
  // print('바이 stream');

  // var userNameStream = getUserNameStream(); // stream을 변수에 담음.

  // asBroadcastStream() - 두번 구독시 에러 발생을 막을 수있음.
  // var userNameStream = getUserNameStream().asBroadcastStream(); // stream을 변수에 담음.

  // 구독을 여러가지 형태로 변환도 가능함.
  var userNameStream = getUserNameStream()
      .asyncMap((username) {
        return '$username is awesome!';
      })
      .distinct()
      .asBroadcastStream(); // distinct() - 이벤트가 똑같은 것이 나오면 못바꾸게끔 하는 기능.

  // StreamSubscription - 구독을 컨트롤 할 수 있다.
  StreamSubscription<String>? subscription;

  // listen - onData가 이벤트가 발생할때마다 들어온다.
  subscription = userNameStream.listen(
    (user) {
      print('user : $user님이 구독완료하였습니다.');

      // Bob이 들어올 경우, 이벤트 처리를 더 이상 안받게 하려면?
      if (user == 'Bob') {
        subscription?.cancel(); // subscription을 캔슬하고 더이상 이벤트를 안받겠다.
      }
    },
    // onError: () {}, // 에러 발생시 처리 구문
    onDone: () {
      // 더 이상 들어올 stream이 없을때, 끝냄.
      print('onDone');
    },
  );

  // 두번 구독하면 에러가 발생.. 왜 유튜브 한 계정에 두번 구독 하는걸 방지??하는 개념.
  // DartError: Bad state: Stream has already been listened to.
  // userNameStream.listen(
  //   (user) {
  //     print('user : $user님이 구독완료하였습니다.');

  //     // Bob이 들어올 경우, 이벤트 처리를 더 이상 안받게 하려면?
  //     if (user == 'Bob') {
  //       subscription?.cancel(); // subscription을 캔슬하고 더이상 이벤트를 안받겠다.
  //     }
  //   },
  //   // onError: () {}, // 에러 발생시 처리 구문
  //   onDone: () {
  //     // 더 이상 들어올 stream이 없을때, 끝냄.
  //     print('onDone');
  //   },
  // );
}

// 한번에 여러번 보내고 싶을때.. stream을 쓴다. *줄의 흐름, 연속적으로 이어짐이라는 뜻 처럼 비동기 흐름이 이어지는 기능
// 계속해서 비동기로 보내는 처리가 가능.
// Stream으로 받는 방식.
Stream<String> getUserNameStream() async* {
  List<String> names = ["John", "Suzan", "Bob", "Sansa", "Brand"];
  // async* - async가 복수개가 나간다.
  await Future.delayed(const Duration(seconds: 1));
  // yield names[Random().nextInt(names.length)]; // yield = return이랑 같은의미
  yield "Bob";
  await Future.delayed(const Duration(seconds: 3));
  // yield names[Random().nextInt(names.length)]; // yield = return이랑 같은의미
  yield "Bob";
  await Future.delayed(const Duration(seconds: 2));
  yield names[Random().nextInt(names.length)]; // yield = return이랑 같은의미
}

Future<String> getUserName() async {
  List<String> names = ["John", "Suzan", "Bob", "Sansa", "Brand"];
  await Future.delayed(const Duration(seconds: 1));
  return names[Random().nextInt(names.length)];
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
