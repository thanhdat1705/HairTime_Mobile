import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking/components/profile_avatar.dart';
import 'package:project_hair_time_mobile/screens/booking/models/stylist_model.dart';

class Rooms extends StatefulWidget {
  final List<Stylist> onlineStylist;
  const Rooms({
    Key key,
    @required this.onlineStylist,
  }) : super(key: key);

  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  bool isActive = false;
  List<Widget> itemProfile = new List<Widget>();

  @override
  void initState() {
    super.initState();
    instanceProfilAvatar();
  }

  void instanceProfilAvatar() {
    List<Widget> tmp = [];
    this.widget.onlineStylist.forEach((eachOnlineStylist) {
      tmp.add(Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                eachOnlineStylist.isActive = true;
                this.widget.onlineStylist.forEach((_eachOnlineStylist) {
                  if (_eachOnlineStylist.id != eachOnlineStylist.id) {
                    _eachOnlineStylist.isActive = false;
                  }
                });
              });
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.amberAccent[400],
              child: CircleAvatar(
                radius: eachOnlineStylist.isActive ? 27.0 : 30.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(eachOnlineStylist.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              child: Center(
                child: Text(
                  '${eachOnlineStylist.name}',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
            ),
          ),
        ],
      ));
    });
    setState(() {
      this.itemProfile = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    instanceProfilAvatar();
    return Row(
      children: [
        _CreateRoomButton(),
        Expanded(
          child: Container(
            height: 100.0,
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
              scrollDirection: Axis.horizontal,
              itemCount: widget.onlineStylist.length,
              itemBuilder: (BuildContext context, int index) {
                final Stylist stylist = widget.onlineStylist[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // child: ProfileAvatar(
                  //   imageUrl: stylist.imageUrl,
                  //   name: stylist.name,
                  //   id: stylist.id,
                  // ),
                  child: itemProfile[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 15, 35),
      height: 100.0,
      child: OutlineButton(
        onPressed: () => print('Create Room'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        borderSide: BorderSide(
          width: 3.0,
          color: Colors.amberAccent[400],
        ),
        // textColor: Palette.facebookBlue,
        child: Icon(
          Icons.people,
          size: 55.0,
          color: Colors.black87,
        ),
      ),
    );
  }
}
