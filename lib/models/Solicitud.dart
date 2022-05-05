class Solicitud{
  late String nombre;
  late String apellidoPaterno;
  late String apellidoMaterno;
  late String curp;
  late String email;
  late String telefono;
  late String rfc;
  late String nss;
  late String estado;
  late String fiscalGral;
  late String monto;
  late String mes;
  late String sector;

  Solicitud(nombre, apellidoPaterno, apellidoMaterno, curp, rfc, email, telefono, nss, estado, fiscalGral, monto, mes, sector){
    this.nombre = nombre;
    this.apellidoPaterno = apellidoPaterno;
    this.apellidoMaterno = apellidoMaterno;
    this.curp = curp;
    this.email = email;
    this.telefono = telefono;
    this.rfc = rfc;
    this.nss = nss;
    this.estado = estado;
    this.fiscalGral = fiscalGral;
    this.monto = monto;
    this.mes = mes;
    this.sector = sector;
  }

}
