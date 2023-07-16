import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetTestPage());
} //flutter의 처음 시작 진입점 ..

//stateful widget과 stateless widget

//ctrl + 마침표 -> import




/* statelesswidget */
class WidgetTestPage extends StatelessWidget {
  const WidgetTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //디버그배너 없애기..
        home: Scaffold(
          //scaffold == 도화지
          appBar: _buildAppbar(),
          body: const SafeArea(
              child: BodyWidget(
                  text: '이부분은 본문 영역')), //safe area = 모바일 가장자리 부분 잘리는 부분 없이..
        ));
  }




  //코드가 길어진다.. > 빌드하는 영역을 분리한다.     ->final변수 or final위젯으로 바꾸면 좋은 포퍼먼스를 만들어낼 수 있다.
  /* 앱바를 빌드하는 함수*/
  AppBar _buildAppbar() {
    return AppBar(
      //appbar == 다양한 기능 있다.. ctrl + 마침표 -> more actions
      backgroundColor: Colors.black12,
      title: const Center(
        child: Text(
          'Flutter Widgets',
          style: TextStyle(
              fontSize: 16, color: Colors.pink), //fontstize 조절, color조절
        ),
      ), //가운데 정렬
      elevation: 0.5, //앱바의 그림자
      leading:
          const Icon(Icons.more_horiz, color: Colors.black, size: 20), //icon
      actions: [
        TextButton(
            onPressed: () {},
            child: const Text(
              '저장',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}




/* statefulwidget */
class BodyWidget extends StatefulWidget {
  final String text;
  const BodyWidget({super.key, required this.text});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    //return Text(widget.text);

    Size screensize = MediaQuery.of(context).size;

    /* column과 listview는 높이를 가지지 않는다! -> sizebox or container를 먼저 설정한 뒤 크기를 지정해.. */
    //stack에서 특정위치를 positioned해줄 때 내부에 있는 모든 위젯을 감싸주어야 한다.
    return Column(
      mainAxisAlignment: MainAxisAlignment.start, //위젯 위치 정렬
      crossAxisAlignment: CrossAxisAlignment.start, //위젯 위치 정렬
      children: [
        Container(
          width: screensize.width,
          height: 50,
          //color: Colors.blue,
          //alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.orange, width: 5),
              borderRadius: BorderRadius.circular(10)),
          child: const Text('여기는 자식 위젯입니다.'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, //아이콘과 텍스트가 일직선상에 오도록
                  children: [
                    const Icon(Icons.call, color: Colors.blueAccent),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.orange, width: 5),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'CALL',
                        style: TextStyle(fontSize: 10, color: Colors.pink),
                      ),
                    )
                  ]),
            ),
            Container(
              child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, //아이콘과 텍스트가 일직선상에 오도록
                  children: [
                    const Icon(Icons.route, color: Colors.blueAccent),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.orange, width: 5),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'ROUTE',
                        style: TextStyle(fontSize: 10, color: Colors.pink),
                      ),
                    )
                  ]),
            ),
            Container(
              child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, //아이콘과 텍스트가 일직선상에 오도록
                  children: [
                    const Icon(Icons.share, color: Colors.blueAccent),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.orange, width: 5),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'SHARE',
                        style: TextStyle(fontSize: 10, color: Colors.pink),
                      ),
                    )
                  ]),
            ),
          ],
        ),
        const Text('Row Widget'),
        Expanded(
          //expanded를 이용해 column안에 column을 넣는 것
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 30,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.blue,
              ),
              const Text('Row에 추가된 위젯'),
            ],
          ),
        ),
        const Text('컬럼위젯 생성'),
        const Text('컬럼위젯 생성 두번째'),
      ],
    );
  }
}
