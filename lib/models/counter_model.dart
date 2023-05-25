import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  final int value;

  const Counter({this.value = 0});

  //edit
  Counter copyWith({int? value}) {
    return Counter(value: value ?? this.value);
  }

  //convert to json
  Map<String, dynamic> toJson() {
    return {"value": value};
  }

  //create from json
  factory Counter.fromJson(Map<String, dynamic> json) {
    return Counter(value: json["value"]);
  }

  @override
  List<Object?> get props => [value];
}
