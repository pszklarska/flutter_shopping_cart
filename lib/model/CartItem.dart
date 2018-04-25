class CartItem {
  String name;
  bool checked;

  CartItem(this.name, this.checked);

  @override
  String toString() {
    return "$name: $checked";
  }
}
