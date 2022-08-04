import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

class DropdownService extends StatefulWidget {
  final String name;
  final String id;
  final List<dynamic> service;
  final IStoreDetailScreenPresenter presenter;
  final List<dynamic> dataSource;
  const DropdownService(
      {Key key,
      this.name,
      this.service,
      this.presenter,
      this.dataSource,
      this.id})
      : super(key: key);

  @override
  _DropdownServiceState createState() => _DropdownServiceState();
}

class _DropdownServiceState extends State<DropdownService> {
  List<dynamic> _myActivities;

  String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = this.widget.service;
    if (_myActivities == null) {
      _myActivities = [];
    } else {
      _myActivities = this.widget.service;
      // globalListService = _myActivities;
    }

    // _myActivitiesResult = '';
  }

  void callSetSate() {
    setState(() {});
  }

  List<dynamic> dataSource() {
    List<dynamic> dataSourceAfterSort = new List();
    myService.forEach((element) {
      if (element["categoryID"] == this.widget.id) {
        dataSourceAfterSort.add(element);
      }
    });
    return dataSourceAfterSort;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Form(
          key: formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  // width: SizeConfig.screenWidth * 0.8,
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: MultiSelectFormField(
                    fillColor: Colors.blue[50],
                    autovalidate: false,
                    chipBackGroundColor: Colors.red,
                    chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                    dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                    checkBoxActiveColor: Colors.blue[200],
                    checkBoxCheckColor: Colors.black,
                    dialogShapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    title: Text(
                      this.widget.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    // validator: (value) {
                    //   if (value == null || value.length == 0) {
                    //     return 'Please select services';
                    //   }
                    //   return null;
                    // },
                    dataSource: dataSource(),
                    textField: 'display',
                    valueField: 'id',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    hintWidget: Text('Please select services'),
                    initialValue: this
                        .widget
                        .presenter
                        .getCheckedServiceOfCategory(this.widget.id),
                    // getCheckedService(),
                    onSaved: (value) {
                      if (value == null) {
                        this.widget.presenter.removeListStoreService(this
                            .widget
                            .presenter
                            .getCheckedServiceOfCategory(this.widget.id));
                      } else {
                        this.widget.presenter.removeListStoreService(this
                            .widget
                            .presenter
                            .getCheckedServiceOfCategory(this.widget.id));
                        this.widget.presenter.addListService(value);
                      }

                      // setState(() {
                      //   _myActivities = value;
                      //   var form = formKey.currentState;
                      //   // if (form.validate()) {
                      //   // form.save();
                      //   _myActivitiesResult = value.toString();
                      //   globalListService = value;
                      //   // }
                      // });
                      // this._saveForm(value);
                    },
                  ),
                ),
              ),
              // Expanded(
              //   flex: 3,
              //   child: Container(
              //     color: Colors.white,
              //     padding: EdgeInsets.all(8),
              //     child: RaisedButton(
              //       child: Text(
              //         'Add to card',
              //         textAlign: TextAlign.center,
              //       ),
              //       onPressed: _saveForm,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
