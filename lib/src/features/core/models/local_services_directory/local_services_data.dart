

class LocalService {
  final String name;
  final String description;
  final String address;
  final String contactInfo;
  final String imageUrl;

  LocalService({
    required this.name,
    required this.description,
    required this.address,
    required this.contactInfo,
    required this.imageUrl,
  });
}

class LocalCategory {
  final String name;

  LocalCategory({required this.name});
}

final List<LocalService> featuredServices = [
  LocalService(
    name: 'Central Bus Stand – Balangoda',
    description: 'Main bus stand in Balangoda.',
    address: 'Balangoda, Sri Lanka',
    contactInfo: '+94 11 2345678',
    imageUrl: 'assets/images/bus_stand.jpg',
  ),
  LocalService(
    name: 'Bank Of Ceylon – Balangoda',
    description: 'Leading bank in Balangoda.',
    address: 'Balangoda, Sri Lanka',
    contactInfo: '+94 11 2345678',
    imageUrl: 'assets/images/bank_of_ceylon.jpg',
  ),
];

final List<LocalCategory> categories = [
  LocalCategory(name: 'Banks'),
  LocalCategory(name: 'Clothing Stores'),
  LocalCategory(name: 'Grocery Stores'),
  LocalCategory(name: 'Public Services'),
  LocalCategory(name: 'Educational Institutions'),
];

final List<LocalService> localServices = [
  LocalService(
    name: 'Central Bus Stand – Balangoda',
    description: 'Main bus stand in Balangoda.',
    address: 'Balangoda, Sri Lanka',
    contactInfo: '+94 11 2345678',
    imageUrl: 'assets/images/bus_stand.jpg',
  ),
  LocalService(
    name: 'Bank Of Ceylon – Balangoda',
    description: 'Leading bank in Balangoda.',
    address: 'Balangoda, Sri Lanka',
    contactInfo: '+94 11 2345678',
    imageUrl: 'assets/images/bank_of_ceylon.jpg',
  ),
  // Add more services here...
];
