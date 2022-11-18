class PlaceItem {
  final String name;
  final String imageUrl;

  PlaceItem({
    required this.name,
    required this.imageUrl,
  });

  PlaceItem copyWith({
    String? name,
    String? imageUrl,
  }) {
    return PlaceItem(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

List<PlaceItem> places = [
  PlaceItem(
    name: 'Cần Thơ',
    imageUrl: '/assets/images/hotel1.jpg',
  ),
  PlaceItem(
    name: 'Vũng Tàu',
    imageUrl: '/assets/images/hotel2.jpg',
  ),
  PlaceItem(
    name: 'Nha Trang',
    imageUrl: '/assets/images/hotel3.jpg',
  ),
  PlaceItem(
    name: 'Hồ Chí Minh',
    imageUrl: '/assets/images/hotel4.jpg',
  ),
  PlaceItem(
    name: 'Đà Lạt',
    imageUrl: '/assets/images/room1.jpg',
  ),
];
