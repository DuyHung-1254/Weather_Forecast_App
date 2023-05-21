class Clouds {
  final int? all;  // có thể có giá trị null 

  Clouds({this.all});

  factory Clouds.fromJson(dynamic json) { // fromJson : tạo đối tượng từ 1 file json 
    if (json == null) {
      return Clouds();
    }

    return Clouds(
      all: json['all'],
    );
  }
}
