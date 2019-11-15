import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String name;
  final bool checked;

  CartItem(this.name, this.checked);

  CartItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        checked = json['checked'];

  Map<String, dynamic> toJson() => {'name': name, 'checked': checked};

  @override
  String toString() {
    return "$name: $checked";
  }

  @override
  List<Object> get props => [name, checked];
}
