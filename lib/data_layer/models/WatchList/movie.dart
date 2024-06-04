
class Movie {
  static const collectionName = 'Movies';
  String? id;
  String? title;
  String? posterImagePath;
  String? releaseData;
  bool? isSelected;

  Movie(
      {this.id,
        this.title,
        this.posterImagePath,
        this.releaseData,
        this.isSelected = false});

  // Get data from fireStore
  Movie.fromFireStore(Map<String, dynamic>? data)
      : this(
      id: data?['id'],
      title: data?['title'],
      posterImagePath: data?["posterImagePath"],
      releaseData: data?['releaseData'],
      isSelected: data?['isSelected']);

  //path data to fireStore
  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "title": title,
      "posterImagePath": posterImagePath,
      "releaseData": releaseData,
      "isSelected": isSelected,
    };
  }

// MovieEntity toMovieEntity() {
//   return MovieEntity(
//       id: id,
//       posterImagePath: posterImagePath,
//       title: title,
//       releaseData: releaseData,
//       isSelected: isSelected);
// }
}
