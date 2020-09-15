class UserModel {
  int id;
  String name;
  String email;
  String avatar;
  bool active;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  set email_verified_at(String dateTime) {
    if (dateTime is String) {
      emailVerifiedAt = DateTime.tryParse(dateTime);
    }
  }

  set created_at(String dateTime) {
    if (dateTime is String) {
      createdAt = DateTime.tryParse(dateTime);
    }
  }

  set updated_at(String dateTime) {
    if (dateTime is String) {
      updatedAt = DateTime.tryParse(dateTime);
    }
  }

  UserModel(this.id, this.name);

  UserModel.fromMap(Map user) {
    id = user['id'];
    name = user['name'];
    email = user['email'];
    avatar = user['avatar'];
    active = user['active'];
    email_verified_at = user['email_verified_at'];
    created_at = user['created_at'];
    updated_at = user['updated_at'];
  }
}
