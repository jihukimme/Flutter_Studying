import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const WidgetTestPage());
} //flutter의 처음 시작 진입점 ..



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

class _BodyWidgetState extends State<BodyWidget> with TickerProviderStateMixin {// 탭 컨트롤러를 위해서 mixin
  List<bool> toggleSelection = [true, false]; //togglebutton에 사용하는 ..

  bool isChecked = false; //check박스에 사용하기 위해서..

  late ScrollController scrollCtrl =
      ScrollController(); //listview에 screencontroller 지정하기 위해..

  List<String> tempList = ['국어', '수학', '영어', '과학'];

  late TextEditingController textCtrl;

  late TabController tabCtrl;

  final List<Widget> tabs = [
    const Tab(
      child: Text('1번째 탭'),
    ),
    const Tab(
      child: Text('2번째 탭'),
    ),
  ];

  @override
  void initState() {
    //초기화
    scrollCtrl = ScrollController();
    textCtrl = TextEditingController();

    //탭 컨트롤러
    tabCtrl = TabController(
        length: tabs.length,
        vsync: this); //vsync: this .. > tickerproviderstatemixin필요..

    //데이터를 불러오는 활동들
    tempList.add('미술');
    super.initState();
  }

  @override
  void dispose() {
    //해제
    scrollCtrl.dispose();
    textCtrl.dispose();
    tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Container(
      child: TabBar(
        labelColor: Colors.black,
        controller: tabCtrl,
        tabs: tabs,
        onTap: (value) {
          //탭이 변경될 때 이벤트
          print('탭이 변경되었습니다.');

          //화면에 실제로 띄우기
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('탭이 변경되었습니다')));
        },
      ),
    );

    /*
    //리스트뷰, 텍스트필드, 이미지넣기
    return Column(
      children: [
        Container(),
        //_buildListView(),
        _buildTextField(),
        _buildImages(),
      ],
    );
    */
  }

  Widget _buildTextField() {
    //텍스트 필드
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      height: 50,
      child: TextField(
        //obscureText: true, // 비밀번호
        controller: textCtrl,
        decoration: const InputDecoration(
          hintText: '값을 입력해주세요.',
        ),
        onChanged: (_) {
          print('\r\n ${textCtrl.text}'); //값을 가져옴
        },
      ),
    );
  }

  //List<String> tempList = ['국어', '수학', '영어', '과학'];

  /* listview */
  Widget _buildListView() {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height,
      child: tempList.isEmpty
          ? const Text('항목이 존재하지 않습니다')
          : ListView.builder(
              //listview.builder ..> 스크롤을 내렸을 때 컨트롤을 생성해서 퍼포먼스 향상 기여..
              //컨트롤러 등장 ..
              controller: scrollCtrl, //controller를 통해서 위치값을 받아올 수 있다..
              //itemCount: 10, //10개의 item 생성
              itemCount: tempList.length,
              itemBuilder: (context, index) {
                //listview.builder 기능 정의
                return _buildListItem(index);
              },
            ),
    );
  }

  /* listview를 위한 위젯 */
  Widget _buildListItem(int index) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
        height: 100,
        color: index.isOdd ? Colors.red : Colors.blue,
        child: Text(tempList[index]));
  }

  /* 이미지 넣기 위한 위젯 */
  Widget _buildImages() {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(
                  width: screenSize.width / 3,
                  height: screenSize.height / 3,
                  child: Image.asset(
                    'asset/images/1.jpg',
                    fit: BoxFit.cover, //이미지 fit 설정
                  )), //파일에 대한 경로 .. 이미지 표시
              GestureDetector(
                //circleavatar에 제스처를 주는 방법..
                onTap: () {
                  //기능정의
                  showDialog(
                      context: context,
                      builder: (BuildContext constext) {
                        return AlertDialog(
                          title: const Text('확인 메시지'),
                          content: const SizedBox(
                            width: 200,
                            height: 100,
                            child: Text(
                                '이것이 다이얼로그가 맞나요? 다이얼로그가 맞다면 확인버튼을 눌러주시고 아니라면 취소버튼을 눌러주세요.'),
                          ),
                          actions: [
                            TextButton(
                                //텍스트 버튼 형태
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('확인')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('취소')),
                          ],
                        );
                      });
                },
                child: CircleAvatar(
                  radius: screenSize.width / 6,
                  backgroundImage: Image.asset(
                    'asset/images/2.jpg',
                    fit: BoxFit.cover, //이미지 fit 설정
                  ).image,
                ),
              ),

              SizedBox(
                  width: screenSize.width / 3,
                  height: screenSize.height / 3,
                  child: Image.asset(
                    'asset/images/3.jpg',
                    fit: BoxFit.cover, //이미지 fit 설정
                  )), //파일에 대한 경로 .. 이미지 표시
            ],
          ),
        ),
      ],
    );
  }

  /* 버튼 생성 */
  Widget _buildBottons() {
    //버튼위젯 생성
    return Column(
      children: [
        //onpressed 정의 필수
        TextButton(
            onPressed: () {
              //기능 정의
              showDialog(
                  context: context,
                  builder: (BuildContext constext) {
                    return AlertDialog(
                      title: const Text('확인 메시지'),
                      content: const SizedBox(
                        width: 200,
                        height: 100,
                        child: Text(
                            '이것이 다이얼로그가 맞나요? 다이얼로그가 맞다면 확인버튼을 눌러주시고 아니라면 취소버튼을 눌러주세요.'),
                      ),
                      actions: [
                        TextButton(
                            //텍스트 버튼 형태
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('취소')),
                      ],
                    );
                  });
            },
            child: const Text('텍스트 버튼')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //일반적인 버튼형태
            ElevatedButton.icon(
              //버튼에 icon 달기
              icon: const Icon(Icons.check),
              label: const Text("확인"),
              onPressed: () {
                //기능정의
                showDialog(
                    context: context,
                    builder: (BuildContext constext) {
                      return CupertinoAlertDialog(
                        title: const Text('확인 메시지'),
                        content: const SizedBox(
                          width: 200,
                          height: 100,
                          child: Text(
                              '이것이 다이얼로그가 맞나요? 다이얼로그가 맞다면 확인버튼을 눌러주시고 아니라면 취소버튼을 눌러주세요.'),
                        ),
                        actions: [
                          TextButton(
                              //텍스트 버튼 형태
                              onPressed: () {
                                //기능정의
                                //터치시 닫음
                                Navigator.pop(context);
                              },
                              child: const Text('확인')),
                          TextButton(
                              onPressed: () {
                                //기능정의
                                //터치시 닫음
                                Navigator.pop(context);
                              },
                              child: const Text('취소')),
                        ],
                      );
                    });
              },
            ),
            const SizedBox(width: 10),
            OutlinedButton.icon(
              icon: const Icon(Icons.close, color: Colors.redAccent),
              label: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "취소",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
              //다른형태의 버튼
              onPressed: () {},
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.check)), //icon 버튼
          ],
        ),
        ToggleButtons(
            //toggle 버튼
            onPressed: (index) {
              for (int i = 0; i < toggleSelection.length; i++) {
                toggleSelection[i] = false;
              }
              toggleSelection[index] = true;
              setState(() {}); //화면을 갱신하는 함수
            },
            selectedColor: Colors.blue,
            disabledColor: Colors.white,
            isSelected: toggleSelection,
            children: const [Text('확인'), Text('취소')]),
        Checkbox(
            value: isChecked,
            onChanged: (value) {
              //check박스의 기능, 동작 정의
              setState(() {
                //화면을 갱신
                //isChecked = value!;
                isChecked = !isChecked;
              });
            })
      ],
    );
  }

  Widget _buildExample() {
    return Row(
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
    );
  }
}
