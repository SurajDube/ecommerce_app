import 'package:ecommerce_app/features/shippingAddress/model/address.dart';

class AddressRepository{
  List<Address> getAddress(){
    return const [
      Address(
          id: '1',
          label: 'Home',
          fullAddress: '123 Main Street, Apt 48',
          city: 'New York',
          state: 'NY',
          zipcode: '10001',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '2',
        label: 'Office',
        fullAddress: '324 Business Ave, Suite 200',
        city: 'New York',
        state: 'NY',
        zipcode: '10002',
        type: AddressType.office,
      ),
    ];
  }
  Address? getDefaultAddress(){
    return getAddress().firstWhere(
        (address) => address.isDefault,
      orElse: () => getAddress().first,
    );
  }
}