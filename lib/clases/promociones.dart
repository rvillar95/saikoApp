class PromocionesC {
  String idPromocion;
  String nombrePromocion;
  String descripcionPromocion;
  String precioAntiguo;
  String precioNuevo;
  String imagenPromocion;
  String validaciones;
  String tipoPromocion;
  String link;
  String fechaInicio;
  String fechaFin;
  PromocionesC({this.idPromocion,this.nombrePromocion,this.descripcionPromocion,this.precioAntiguo,this.precioNuevo,this.imagenPromocion,this.validaciones,this.tipoPromocion,this.link,this.fechaInicio,this.fechaFin});

  factory PromocionesC.fromJson(Map<String, dynamic> json) {
    return PromocionesC(idPromocion: json['idPromocion'],
    nombrePromocion: json['nombrePromocion'],
    descripcionPromocion: json['descripcionPromocion'],
    precioAntiguo: json['precioAntiguo'],
    precioNuevo: json['precioNuevo'],
    imagenPromocion: json['imagenPromocion'],
    validaciones: json['validaciones'],
    tipoPromocion: json['tipoPromocion'],
    link: json['link'],
    fechaInicio: json['fechaInicio'],
    fechaFin: json['fechaFin'],);
  }
}
