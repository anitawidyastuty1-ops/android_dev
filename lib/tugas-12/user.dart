class User {
  final int? id;
  final String nama;
  final String email;
  final String nomorHp;
  final String password;
  final String asalKota;

  User({
    this.id,
    required this.nama,
    required this.email,
    required this.nomorHp,
    required this.password,
    required this.asalKota,
  });

  // Mengubah object User menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'nomor_hp': nomorHp,
      'password': password,
      'asal_kota': asalKota,
    };
  }

  // Mengubah data Map dari database menjadi object User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nama: map['nama'],
      email: map['email'],
      nomorHp: map['nomor_hp'],
      password: map['password'],
      asalKota: map['asal_kota'],
    );
  }
}
