class User {
  String? id;
  String? email;

  User({
    this.id,
    this.email,
  });

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'email': email,
    };
  }

  User.fromFireStore(Map<String, dynamic>? data)
      : this(
          id: data?['id'],
          email: data?['email'],
        );
}
