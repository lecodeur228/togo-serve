class Place {
  final int id;
  final String nom;
  final String imageUrl;
  final String categorie;
  final String latitude;
  final String longitude;
  final String? phone;
  final String etoile;
  final String? description;
  final String createdAt;
  final String updatedAt;

  Place({
    required this.id,
    required this.nom,
    required this.imageUrl,
    required this.categorie,
    required this.latitude,
    required this.longitude,
    this.phone,
    required this.etoile,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      nom: json['nom'],
      imageUrl: json['imageUrl'],
      categorie: json['categorie'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      phone: json['phone'],
      etoile: json['etoile'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'imageUrl': imageUrl,
      'categorie': categorie,
      'latitude': latitude,
      'longitude': longitude,
      'phone': phone,
      'etoile': etoile,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
