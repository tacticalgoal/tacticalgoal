class UserModel {
  final String id;
  final String email;
  final String name;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

  // Convert model to JSON for Supabase storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

  // Create model from Supabase response
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }
}
