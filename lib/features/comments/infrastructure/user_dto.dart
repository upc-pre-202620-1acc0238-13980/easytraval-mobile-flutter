class UserDto {
  final String firstName;
  final String lastName;
  final String email;

  const new({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }
}