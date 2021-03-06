class SavedBook {

  final String id;
  final String title;
  final String image;
  final String author;

  SavedBook({
    this.id,
    this.title,
    this.image,
    this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'author': author,
    };
  }

}