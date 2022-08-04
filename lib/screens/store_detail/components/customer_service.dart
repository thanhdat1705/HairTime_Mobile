class CustomerService {
  int id;
  String name;
  String phone;
  bool isChoose;
  List<dynamic> servicePerCus = new List();

  CustomerService(this.id, this.name, this.phone, this.isChoose);
}