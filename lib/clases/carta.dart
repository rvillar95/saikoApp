class Carta {
  String nombreCarta;
  String imagenCarta;

  Carta(
      {this.nombreCarta,
      this.imagenCarta});

  factory Carta.fromJson(Map<String, dynamic> json) {
    return Carta(
      nombreCarta: json['nombreCarta'],
      imagenCarta: json['imagenCarta']
    );
  }
}
