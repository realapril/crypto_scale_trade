import 'package:crypto_scale_trade/model/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  PersonTile(this._person);

  final Person _person;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_person.name),
      subtitle: Text("${_person.age}세"),
      trailing: PersonHandIcon(_person.isLeftHand),
    );
  }
}

class PersonHandIcon extends StatelessWidget {
  PersonHandIcon(this._isLeftHand);

  final bool _isLeftHand;

  @override
  Widget build(BuildContext context) {
    if (_isLeftHand) return Icon(Icons.arrow_left);
    else return Icon(Icons.arrow_right);
  }
}