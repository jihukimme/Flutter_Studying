enum ItemStatus {loaded, added, modified, deleted}


void main() {
//1. hello world
  
  for (int i = 0; i < 5; i++) {
    print('hello World!');
  }
  
  
//2. 변수
  /*
  String name = '김지후';
  int age = 24;
  double height = 174.2;
  bool isMan = true;
  */
  
//3. var과 dynamic
  /*
  var name = 1;
  print(name);

  var name2 = '김지후';    
  name = 2;
  //name2 = 4;  <-에러
  //var타입은 타입이 한번 선언되면 그 형태로 고정(첫번째값을 초기화 할 때 타입 결정)
    
  dynamic age = 40;
  age = '김지후';
    
  print(age);
  //dynamic타입은 가능(타입에 종속되지 않는 자유로운 변수)
  */
    
    
//4. const와 final변수(플러터에서 중요한 키워드) <- 중요하다*****
  /*
  const int age = 40;
  //age = 40; <-에러발생
  print(age);
  //const = 초기화 반드시 해야하는..
  //선언과 동시에 초기화를 해줘야함.
    
  final String name;
  name = '김지후';
  print(name);
  //final변수는 한번 초기화하면 변경 불가능
  //에러발생->  name = '홍길동';
  */
  

//5. nullable과 late변수
  /*
  int? age;  // int? <- null값을 포함한..
  print(age);
    
  late int age2; //값을 나중에 주겠다.
  age2 = 24;
  print(age2);
  */
  
  
//6. list
  /*
  List<int> score = [50, 60 ,70];
  print(score);
  
  score.add(80);
  print(score);
  print(score.length);
  
  List<int> newScore = score.where((element) => element ==50 || element == 70).toList();
  
  print(newScore);
  
  
  
  //toList
  List<int> newScore = score.map((element) => element + 5).toList();
  print(newScore);
  
  
  //reduce
  List<String> subject = ['국어', '영어', '수학'];
  print(subject);
  
  String newValue = subject.reduce((value, element) => value + ',' + element);
  print(newValue);
  
  
  //fold
  List<double> width = [10.5, 20.0, 21.5];
  double totalWidth = width.fold(0, (value, element) => value + element);
  */
  
  
//7. map
  /*
  //key와 value를 사용해서
  //json .. key와 value를 사용해서.. map을 많이 사용한다.
  
  Map<String, int> score = {'국어':50, '영어':60, '수학':70, '과학':80};
  print(score['영어']);
  print(score.keys);
  print(score.keys.toList());
  */
  
  
//8. for문과 if문
  /*
  //while문은 거의 사용하지 않는다.
  //가장 기본적인 문법
  List<int> score = [90, 91,92,93];
  
  //for
  for(int i=0; i<score.length; i++){
    if(score[i].isOdd){
      print(score[i]);
    }
  }
  
  for(int item in score){
    if(item.isOdd){
      print(item);
    }
  }
  
  score.forEach((item) => print(item));
  
  
  //null을 포함한..
  List<String?> score2 = ['국어', null, '영어'];
  
  for(String? item in score2){
    String str = (item == null ? 'NaN' : item);
    print(str);
  }
  
  for(String? item in score2){
    String str = item ?? 'NaN';
    
    print(str);
  }
  */
  
  
//9. switch
  /*
  //enum ItemStatus {loaded, added, modified, deleted} <-- 메인문 밖에
  
  ItemStatus status = ItemStatus.deleted;
  
  if(status == ItemStatus.loaded){
    print('로딩되었습니다.');
  }else if (status == ItemStatus.added){
    print('추가되었습니다.');
  }else if (status == ItemStatus.modified){
    print('수정되었습니다.');
  }else if (status == ItemStatus.deleted){
    print('삭제되었습니다.');
  }else{
    print('');
  }
  
  
  switch(status){
    case ItemStatus.loaded:
      print('로딩되었습니다.');
      break;
    case ItemStatus.added:
      print('추가되었습니다.');
      break;
    case ItemStatus.modified:
      print('수정되었습니다.');
      break;
    case ItemStatus.deleted:
      print("삭제되었습니다.");
      break;
    default:
      print('');
      break;
  }
  */
  
  
  
//10. 함수 선언
  /*
  int add(int a, int b){
    int total = a + b;
    return total;
  }
  
  int add2({required int a, required int b}){
    return a + b;
  }
  
  int add3(int a, {required int b, int c = 3}){
    return a+b+c;
  }
  
  print(add(1, 2));
  print(add2(a:1, b:2));
  
  print(add3(1, b:2));
  print(add3(1, b:2, c:4));
  */
  
  
  
//11. 람다함수
  /*
  List<int> score = [50,60,70];
  
  //일반함수
  final int total = score.reduce((value, e){
    return value + e;
  });
  print(total);
  
  //람다
  final int total2 = score.reduce((value, e) => value + e);
  print(total2);
  */
  
  
  
//12. try와 catch
  /*
  try{
    String name = '김지후';
    
    throw Exception('내가 만든 에러');
    
    print(name);
  }catch(err){
    print(err);
  }
  */
  
  
}


