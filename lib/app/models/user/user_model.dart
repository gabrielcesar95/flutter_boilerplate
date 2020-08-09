class UserModel {
  int id;
  String name;
  String email;
  String avatar;
  bool active;
  DateTime get emailVerifiedAt => emailVerifiedAt;
  DateTime get createdAt => createdAt;
  DateTime get updatedAt => updatedAt;

  set emailVerifiedAt(datetime) {
    if (datetime is String) {
      this.emailVerifiedAt = DateTime.tryParse(datetime);
    }
  }

  set createdAt(datetime) {
    if (datetime is String) {
      this.createdAt = DateTime.tryParse(datetime);
    }
  }

  set updatedAt(datetime) {
    if (datetime is String) {
      this.updatedAt = DateTime.tryParse(datetime);
    }
  }

  UserModel(this.id, this.name);

  UserModel.fromMap(Map user) {
    this.id = user['id'];
    this.name = user['name'];
    this.email = user['email'];
    this.avatar = user['avatar'];
    this.active = user['active'];
    this.emailVerifiedAt = user['email_verified_at'];
    this.createdAt = user['created_at'];
    this.updatedAt = user['updated_at'];
  }
}
