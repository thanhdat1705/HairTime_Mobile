import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/header_profile/header_profile.dart';

class UpdateProfilePage extends StatefulWidget {
  UpdateProfilePage({Key key}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage>
    with SingleTickerProviderStateMixin {
  String _userName, _userEmail, _userPhone, _userProvider, _userPhotoURL;
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _userEmailController = new TextEditingController();
  TextEditingController _userPhoneController = new TextEditingController();
  TextEditingController _userProviderController = new TextEditingController();
  TextEditingController _userPhotoURLController = new TextEditingController();
  TextEditingController _userDescriptionController =
      new TextEditingController();
  final String _avatarPic =
      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/wolf.jpg';
  Color _beginColor = Colors.cyan[200];
  Color _endColor = Colors.cyan;
  FocusNode _onFocusedName = new FocusNode();
  FocusNode _onFocusedPhoneNumber = new FocusNode();
  FocusNode _onFocusedEmail = new FocusNode();
  FocusNode _onFocusedDescription = new FocusNode();
  AnimationController _controller;
  Color _unfocusedTextFieldColor = Color(0xFFBDBDBD);
  Color _unfocusedBorderTextFieldColor = Color(0xFFBDBDBD);
  Color _onfocusedTextFieldColor = Color(0xFF80DEEA);

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) _controller.reverse();
      });
    _userProviderController.text = 'Google';
    _userNameController.text = 'Nguyen Thanh Dat';
    _userEmailController.text = 'dat.ngthanh1705@gmail.com';
    _userDescriptionController.text = 'Hi, Im Dat.';
    this._onFocusedName.addListener(
      () {
        setState(
          () {},
        );
      },
    );
    this._onFocusedPhoneNumber.addListener(
      () {
        setState(
          () {},
        );
      },
    );
    this._onFocusedEmail.addListener(
      () {
        setState(
          () {},
        );
      },
    );
    this._onFocusedDescription.addListener(
      () {
        setState(
          () {},
        );
      },
    );
  }

  @override
  void dispose() {
    this._onFocusedName.dispose();
    this._onFocusedPhoneNumber.dispose();
    this._onFocusedEmail.dispose();
    this._onFocusedDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderProfile(
                headerName: 'Edit Profile',
                paddingIcon: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(15),
                    0,
                    getProportionateScreenWidth(65),
                    0),
                heightContainer: getProportionateScreenHeight(30),
                widthContainer: getProportionateScreenWidth(30),
                widthIcon: getProportionateScreenWidth(30),
                widthText: getProportionateScreenWidth(30),
                textColor: Colors.black,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.fromLTRB(55, 0, 50, 0),
                    height: getProportionateScreenHeight(140),
                    width: getProportionateScreenWidth(300),
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.fromLTRB(55, 0, 50, 0),
                      width: getProportionateScreenWidth(125),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            this._avatarPic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: getProportionateScreenHeight(500),
                width: getProportionateScreenWidth(350),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: getProportionateScreenHeight(20)),
                    TextFormField(
                      focusNode: this._onFocusedName,
                      controller: _userNameController,
                      style: TextStyle(
                        color: Color(0xDD000000),
                      ),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: _unfocusedBorderTextFieldColor,
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Color(0xFF26C6DA), width: 1.0),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: this._onFocusedName.hasFocus
                              ? this._onfocusedTextFieldColor
                              : this._unfocusedTextFieldColor,
                        ),
                      ),
                      onChanged: (text) {},
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    TextFormField(
                      focusNode: this._onFocusedPhoneNumber,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: _unfocusedBorderTextFieldColor,
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Color(0xFF26C6DA), width: 1.0),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: this._onFocusedPhoneNumber.hasFocus
                              ? this._onfocusedTextFieldColor
                              : this._unfocusedTextFieldColor,
                        ),
                      ),
                      onChanged: (text) {},
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    TextFormField(
                      focusNode: this._onFocusedEmail,
                      controller: _userEmailController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: _unfocusedBorderTextFieldColor,
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Color(0xFF26C6DA), width: 1.0),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: this._onFocusedEmail.hasFocus
                              ? this._onfocusedTextFieldColor
                              : this._unfocusedTextFieldColor,
                        ),
                      ),
                      onChanged: (text) {},
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    TextFormField(
                      focusNode: this._onFocusedDescription,
                      controller: _userDescriptionController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: _unfocusedBorderTextFieldColor,
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Color(0xFF26C6DA), width: 1.0),
                        ),
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: this._onFocusedDescription.hasFocus
                              ? this._onfocusedTextFieldColor
                              : this._unfocusedTextFieldColor,
                        ),
                      ),
                      onChanged: (text) {},
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    TextFormField(
                      readOnly: true,
                      controller: _userProviderController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Color(0xFFBDBDBD), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Color(0xFFBDBDBD), width: 1.0),
                        ),
                        labelText: 'Provider',
                        labelStyle: TextStyle(
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: getProportionateScreenWidth(150),
                alignment: Alignment.center,
                child: new AnimatedBuilder(
                  child: Text(
                    'Update Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  animation: _controller,
                  builder: (BuildContext context, Widget child) {
                    return new RaisedButton(
                      color: new ColorTween(
                        begin: _beginColor,
                        end: _endColor,
                      ).animate(_controller).value,
                      child: child,
                      onPressed: () {
                        _controller.forward();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
