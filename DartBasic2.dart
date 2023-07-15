//1. class
//상속과 믹스인

mixin Worker on Person{
  void working(){
    print('$name이 일을 합니다.');
  }
}


class Person{
  static String me = '나는';
  static void SayMe(){
    print('나는 나입니다.');
  }
  
  final String name; //final값이 붙으면 반드시 초기화해야 함
  final int age;
    //final String _name; -> 캡슐화
  
  
  Person(String name, int age) : this.name = name, this.age = age; //생성자
  
  void sayName(){
    print('저의 이름은 $name이고 저의 나이는 $age입니다.');
  }
}


class Student extends Person with Worker{
  Student(super.name, super.age);
  
  void study(){
    print('$name이 공부를 합니다.');
  }
}


void main() {
  Student person = Student('김지후', 24);
  person.sayName();
  person.study();
  person.working();
  
  Person person = Person('김지후', 24);
  person.sayName();
  
  Person.SayMe(); //static변수 사용
  print(Person.me);
  
  
  //List<T> arr = ['국어', 4];
  List<String> arr = ['국어'];
  List<Student> arr2 = [Student('김지후', 24)];
  
}
