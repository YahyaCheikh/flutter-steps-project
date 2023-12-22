class Hotel {
  final String hotelId;
  final String hotelName;
  final double hotelRating;
  bool isFavorit;
  final String imageUrl;

  Hotel(
      {required this.hotelId,
      required this.hotelName,
      required this.hotelRating,
      required this.isFavorit,
      required this.imageUrl});

  void toggleIsFavorite(){
    isFavorit = !isFavorit;
  }
}
