import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/models/fields/fields.dart';
// import 'package:project_hair_time_mobile/data/data.dart';

import 'package:project_hair_time_mobile/widgets/list/list_field.dart';

class HomeSearch extends StatefulWidget {
  final List<Field> listField;

  HomeSearch({Key key, this.listField}) : super(key: key);
  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0x88999999),
            offset: Offset(0, 5),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50.0,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
                hintText: "Search any places",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {
                    print('Hello');
                  },
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          ListField(
            fields: this.widget.listField,
          )
        ],
      ),
    );
  }
}
