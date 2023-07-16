import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //runApp -> 앱을 실행시켜라. const MyApp클래스
}// -> main ..   코드는 lib파일에 있다.

//플러터는 위젯의 집합이라고 표현할 수 있다.
class MyApp extends StatelessWidget { //statelesswidget을 상속 .. 상태를가지지 않는 위젯 
  const MyApp({super.key}); //기본 생성자

  @override
  Widget build(BuildContext context) {  //build 함수를 재정의
    return MaterialApp( 
      title: 'Flutter Demo',
      theme: ThemeData(
        //디자인.. 폰트
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


//count가 state다.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


// _ .. 외부에서 쓸 수 없다.
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: Center(
      
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
