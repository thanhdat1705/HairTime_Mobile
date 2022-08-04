import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/header_profile/header_profile.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage>
    with SingleTickerProviderStateMixin {
  final Color _colorOriginalBorderBug = Colors.grey[200];
  final Color _colorOnClickedBorderBug = Colors.lightBlue[100];
  final Color _colorOriginalBug = Colors.white;
  final Color _colorOnClickedBug = Colors.black;
  bool _onClickedBugRadio = false;
  final Color _colorOriginalBorderSuggestion = Colors.grey[200];
  final Color _colorOnClickedBorderSuggestion = Colors.lightBlue[100];
  final Color _colorOriginalSuggestion = Colors.white;
  final Color _colorOnClickedSuggestion = Colors.yellow;
  bool _onClickedSuggestionRadio = false;
  final Color _colorOriginalBorderOthers = Colors.grey[200];
  final Color _colorOnClickedBorderOthers = Colors.lightBlue[100];
  final Color _colorOriginalOthers = Colors.white;
  final Color _colorOnClickedOthers = Colors.blue;
  bool _onClickedOthersRadio = false;

  Color _beginColor = Colors.cyan[200];
  Color _endColor = Colors.cyan;
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) _controller.reverse();
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               HeaderProfile(
                headerName: 'Feedback App',
                paddingIcon: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(15),
                    0,
                    getProportionateScreenWidth(90),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Container(
                  child: Text(
                    "Found any good ideas, ",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Container(
                  child: Text(
                    "or wanna us improve something?",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Container(
                  child: Text(
                    "How was your experience?",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Container(
                  child: RatingBar(
                    initialRating: 0,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.red,
                          );
                        case 1:
                          return Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.orangeAccent,
                          );
                        case 2:
                          return Icon(
                            Icons.sentiment_neutral,
                            color: Colors.yellow[600],
                          );
                        case 3:
                          return Icon(
                            Icons.sentiment_satisfied,
                            color: Colors.lightGreen,
                          );
                        case 4:
                          return Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                          );
                      }
                    },
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                child: Container(
                  height: getProportionateScreenHeight(450),
                  width: getProportionateScreenWidth(350),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: Text(
                          "Describe your experience here",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: getProportionateScreenHeight(370),
                          child: TextField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
                child: Container(
                  height: getProportionateScreenHeight(50),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey),
                          color: this._onClickedBugRadio
                              ? this._colorOnClickedBorderBug
                              : this._colorOriginalBorderBug,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.bug_report),
                          color: this._onClickedBugRadio
                              ? this._colorOnClickedBug
                              : this._colorOriginalBug,
                          alignment: Alignment.center,
                          padding: new EdgeInsets.all(2.0),
                          onPressed: () {
                            setState(
                              () {
                                if (!this._onClickedBugRadio) {
                                  this._onClickedSuggestionRadio = false;
                                  this._onClickedOthersRadio = false;
                                  this._onClickedBugRadio = true;
                                } else {
                                  this._onClickedBugRadio = false;
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 10),
                        child: Text('Bug'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey),
                          color: this._onClickedSuggestionRadio
                              ? this._colorOnClickedBorderSuggestion
                              : this._colorOriginalBorderSuggestion,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.lightbulb),
                          color: this._onClickedSuggestionRadio
                              ? this._colorOnClickedSuggestion
                              : this._colorOriginalSuggestion,
                          alignment: Alignment.center,
                          padding: new EdgeInsets.all(2.0),
                          onPressed: () {
                            setState(
                              () {
                                if (!this._onClickedSuggestionRadio) {
                                  this._onClickedBugRadio = false;
                                  this._onClickedOthersRadio = false;
                                  this._onClickedSuggestionRadio = true;
                                } else {
                                  this._onClickedSuggestionRadio = false;
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 10),
                        child: Text('Suggestion'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey),
                          color: this._onClickedOthersRadio
                              ? this._colorOnClickedBorderOthers
                              : this._colorOriginalBorderOthers,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.more_horiz),
                          color: this._onClickedOthersRadio
                              ? this._colorOnClickedOthers
                              : this._colorOriginalOthers,
                          alignment: Alignment.center,
                          padding: new EdgeInsets.all(2.0),
                          onPressed: () {
                            setState(
                              () {
                                if (!this._onClickedOthersRadio) {
                                  this._onClickedBugRadio = false;
                                  this._onClickedSuggestionRadio = false;
                                  this._onClickedOthersRadio = true;
                                } else {
                                  this._onClickedOthersRadio = false;
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 10),
                        child: Text('Others'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: getProportionateScreenHeight(40),
                child: new AnimatedBuilder(
                  child: Text(
                    'Send Feedback',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(18),
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
