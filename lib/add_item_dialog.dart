import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(16.0),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Item name', hintText: 'eg. Red Apples'),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text('ADD'),
          onPressed: () => Navigator.pop(context, _textController.text),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }
}
