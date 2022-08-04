import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';

final List<dynamic> discountsList = [
  {
    'imageDiscount':
        APPLOGO,
    'description': 'Discount \$50 order from \$200',
    'discount': '50',
    'orderMin': '200',
    'discountType': '1'
  },
  {
    'imageDiscount':
        APPLOGO,
    'description': 'Discount \$40 order from \$150',
    'discount': '40',
    'orderMin': '150',
    'discountType': '1'
  },
  {
    'imageDiscount':
        APPLOGO,
    'description': 'Discount \$20 order from \$80',
    'discount': '20',
    'orderMin': '80',
    'discountType': '1'
  },
  {
    'imageDiscount':
        Discount25,
    'description': 'Discount \$25% up to \$40',
    'percentDiscount':'25',
    'maxDiscount': '40',
    'discountType': '0'
  },
  {
    'imageDiscount':
        Discount30,
    'description': 'Discount \$30% up to \$60',
    'percentDiscount':'30',
    'maxDiscount': '60',
    'discountType': '0'
  }
];
