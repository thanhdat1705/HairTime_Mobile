import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking/booking_screen.dart';

class ProfileAvatar extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String name;
  // final bool isActive;

  const ProfileAvatar({
    Key key,
    this.imageUrl,
    this.name,
    this.id,
  }) : super(key: key);

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  bool isActive = true;

  // void abc() {
  //   globalStylist.clear();
  //   globalStylist.addAll([this.widget.id]);
  //   if(!globalStylist.isEmpty){
  //     globalStylist.forEach((element) {

  //     })
  //   }
  //   isActive = !isActive;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {});
            print('id: ${widget.id}');
          },
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.amberAccent[400],
            child: CircleAvatar(
              radius: isActive ? 27.0 : 30.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            child: Center(
              child: Text(
                '${widget.name}',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
