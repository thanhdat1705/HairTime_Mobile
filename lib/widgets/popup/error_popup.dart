import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';

class ErrorPopup extends StatelessWidget {
  final int statusCode;
  final String errorMessage;

  const ErrorPopup({Key key, this.statusCode, this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: 170,
        decoration: BoxDecoration(
            color: Colors.blue[300],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  SADICON,
                  height: 20,
                  width: 20,
                ),
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   '$statusCode',
            //   style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold),
            // ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Text(
                this.errorMessage,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
              onPressed: () {
                return Navigator.of(context).pop(true);
              },
              child: Text('Ok',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              color: Colors.white,
              textColor: Colors.redAccent,
            )
          ],
        ),
      );
}
