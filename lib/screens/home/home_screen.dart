import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/home/components/home_body.dart';
import 'package:project_hair_time_mobile/shared/models/fields/fields.dart';

class HomeScreen extends StatefulWidget {
  final List<Field> listField;

  const HomeScreen({Key key, this.listField}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeBody(
      listFields: this.widget.listField,
    );
  }
}
