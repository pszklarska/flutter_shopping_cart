import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shopping_cart/actions.dart';

class AddItemDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AddItemDialogState();
}

class AddItemDialogState extends State<AddItemDialog> {
  String itemName;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<String>, OnAddCallback>(
        converter: (store) {
      return (itemName) => store.dispatch(AddItemAction(itemName));
    }, builder: (context, callback) {
      return new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Item name',
                    hintText: 'eg. Red Apples'),
                onChanged: _handleTextChanged,
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('ADD'),
              onPressed: () {
                Navigator.pop(context);
                callback(itemName);
              })
        ],
      );
    });
  }

  _handleTextChanged(String newItemName) {
    setState(() {
      itemName = newItemName;
    });
  }
}

typedef OnAddCallback = Function(String itemName);
