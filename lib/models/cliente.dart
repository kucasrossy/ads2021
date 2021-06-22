final String tableClientes = 'clientes';

class ClienteFields{

  static final List<String> values = [
    id, time,razaoSocial, nomeFantasia, residenciaPropria, pFisica, endereco,
    bairro, numeroRua, cidade, cep, pontoReferencia, cnpj, cgf,
    contato, fone, email, ref_1, numero_1, ref_2, numero_2,
    ref_3, numero_3, comentario
  ];

  static final String id = '_id';
  static final String time = 'time';
  static final String razaoSocial = 'razaoSocial';
  static final String nomeFantasia = 'nomeFantasia';
  static final String residenciaPropria = 'residenciaPropria';
  static final String pFisica = 'pFisica';
  static final String endereco = 'endereco';
  static final String bairro = 'bairro';
  static final String numeroRua = 'numeroRua';
  static final String cidade = 'cidade';
  static final String cep = 'cep';
  static final String pontoReferencia = 'pontoReferencia';
  static final String cnpj = 'cnpj';
  static final String cgf = 'cgf';
  static final String contato = 'contato';
  static final String fone = 'fone';
  static final String email = 'email';
  static final String ref_1 = 'ref_1';
  static final String numero_1 = 'numero_1';
  static final String ref_2 = 'ref_2';
  static final String numero_2 = 'numero_2';
  static final String ref_3 = 'ref_3';
  static final String numero_3 = 'numero_3';
  static final String comentario = 'comentario';
}


class Cliente{
  final int? id;
  final DateTime createdTime;
  final String razaoSocial;
  final String nomeFantasia;
  final bool residenciaPropria;
  final bool pFisica;
  final String endereco;
  final String bairro;
  final String numeroRua;
  final String cidade;
  final String cep;
  final String pontoReferencia;
  final String cnpj;
  final String cgf;
  final String contato;
  final String fone;
  final String email;
  
  final String? ref_1;
  final String? numero_1;
  final String? ref_2;
  final String? numero_2;
  final String? ref_3;
  final String? numero_3;

  final String? comentario;

  Cliente({
    this.id,
    required this.createdTime,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.residenciaPropria,
    required this.pFisica,
    required this.endereco,
    required this.bairro,
    required this.numeroRua,
    required this.cidade,
    required this.cep,
    required this.pontoReferencia,
    required this.cnpj,
    required this.cgf,
    required this.contato,
    required this.fone,
    required this.email,

    this.ref_1,
    this.numero_1,
    this.ref_2,
    this.numero_2,
    this.ref_3,
    this.numero_3,

    this.comentario
  });

  Cliente copy({
    final int? id,
    final DateTime? createdTime,
    final String? razaoSocial,
    final String? nomeFantasia,
    final bool? residenciaPropria,
    final bool? pFisica,
    final String? endereco,
    final String? bairro,
    final String? numeroRua,
    final String? cidade,
    final String? cep,
    final String? pontoReferencia,
    final String? cnpj,
    final String? cgf,
    final String? contato,
    final String? fone,
    final String? email,
    
    final String? ref_1,
    final String? numero_1,
    final String? ref_2,
    final String? numero_2,
    final String? ref_3,
    final String? numero_3,

    final String? comentario,
  }) => Cliente(
      id: id ?? this.id,
      createdTime: createdTime ?? this.createdTime,
      razaoSocial: razaoSocial ?? this.razaoSocial,
      nomeFantasia: nomeFantasia ?? this.nomeFantasia,
      residenciaPropria: residenciaPropria ?? this.residenciaPropria,
      pFisica: pFisica ?? this.pFisica,
      endereco: endereco ?? this.endereco,
      bairro: bairro ?? this.bairro,
      numeroRua: numeroRua ?? this.numeroRua,
      cidade: cidade ?? this.cidade,
      cep: cep ?? this.cep,
      pontoReferencia: pontoReferencia ?? this.pontoReferencia,
      cnpj: cnpj ?? this.cnpj,
      cgf: cgf ?? this.cgf,
      fone: fone ?? this.fone,
      contato: contato ?? this.contato,
      email: email ?? this.email,
      ref_1: ref_1 ?? this.ref_1,
      numero_1: numero_1 ?? this.numero_1,
      ref_2: ref_2 ?? this.ref_2,
      numero_2: numero_2 ?? this.numero_2,
      ref_3: ref_3 ?? this.ref_3,
      numero_3: numero_3 ?? this.numero_3,
      comentario: comentario ?? this.comentario
  );

  static Cliente fromJson(Map<String, Object?> json) => Cliente(
    id: json[ClienteFields.id] as int?,
    bairro: json[ClienteFields.bairro] as String,
    cep: json[ClienteFields.cep] as String,
    cidade: json[ClienteFields.cidade] as String,
    cgf: json[ClienteFields.cgf] as String,
    cnpj: json[ClienteFields.cnpj] as String,
    contato: json[ClienteFields.contato] as String,
    createdTime: DateTime.parse(json[ClienteFields.time] as String),
    email: json[ClienteFields.email] as String,
    endereco: json[ClienteFields.endereco] as String,
    fone: json[ClienteFields.fone] as String,
    nomeFantasia: json[ClienteFields.nomeFantasia] as String,
    numeroRua: json[ClienteFields.numeroRua] as String,
    pFisica: json[ClienteFields.pFisica] == 1,
    pontoReferencia: json[ClienteFields.pontoReferencia] as String, 
    razaoSocial: json[ClienteFields.razaoSocial] as String,
    residenciaPropria: json[ClienteFields.residenciaPropria] == 1,
    comentario: json[ClienteFields.comentario] == null ? '' : json[ClienteFields.comentario] as String,
    numero_1: json[ClienteFields.numero_1] == null ? '' : json[ClienteFields.numero_1] as String,
    numero_2: json[ClienteFields.numero_2] == null ? '' : json[ClienteFields.numero_2] as String,
    numero_3: json[ClienteFields.numero_3] == null ? '' : json[ClienteFields.numero_3] as String,
    ref_1: json[ClienteFields.ref_1] == null ? '' : json[ClienteFields.ref_1] as String,
    ref_2: json[ClienteFields.ref_2] == null ? '' : json[ClienteFields.ref_2] as String,
    ref_3: json[ClienteFields.ref_3] == null ? '' : json[ClienteFields.ref_3] as String
  );

  toJson() => {
    ClienteFields.id : id,
    ClienteFields.time : createdTime.toIso8601String(),
    ClienteFields.razaoSocial : razaoSocial,
    ClienteFields.nomeFantasia : nomeFantasia,
    ClienteFields.residenciaPropria : residenciaPropria ? 1 : 0,
    ClienteFields.pFisica : pFisica ? 1 : 0,
    ClienteFields.endereco : endereco,
    ClienteFields.bairro : bairro,
    ClienteFields.numeroRua : numeroRua,
    ClienteFields.cidade : cidade,
    ClienteFields.cep : cep,
    ClienteFields.pontoReferencia : pontoReferencia,
    ClienteFields.cnpj : cnpj,
    ClienteFields.cgf : cgf,
    ClienteFields.contato : contato,
    ClienteFields.fone : fone,
    ClienteFields.email : email,
    ClienteFields.ref_1 : ref_1,
    ClienteFields.numero_1 : numero_1,
    ClienteFields.ref_2 : ref_2,
    ClienteFields.numero_2 : numero_2,
    ClienteFields.ref_3 : ref_3,
    ClienteFields.numero_3 : numero_3,
    ClienteFields.comentario : comentario, 
  };

  static Cliente generetaByMap(Map<String,dynamic> dados){
    return Cliente(
      bairro: dados[ClienteFields.bairro],
      cep: dados[ClienteFields.cep],
      cidade: dados[ClienteFields.cidade],
      cgf: dados[ClienteFields.cgf],
      cnpj: dados[ClienteFields.cnpj],
      contato: dados[ClienteFields.contato],
      createdTime: DateTime.now(),
      email: dados[ClienteFields.email],
      endereco: dados[ClienteFields.endereco],
      fone: dados[ClienteFields.fone],
      nomeFantasia: dados[ClienteFields.nomeFantasia],
      numeroRua: dados[ClienteFields.numeroRua],
      pFisica: dados[ClienteFields.pFisica],
      pontoReferencia: dados[ClienteFields.pontoReferencia],
      razaoSocial: dados[ClienteFields.razaoSocial],
      residenciaPropria: dados[ClienteFields.residenciaPropria],
      comentario: dados[ClienteFields.comentario] == null ? '' : dados[ClienteFields.comentario],
      numero_1: dados[ClienteFields.numero_1] == null ? '' : dados[ClienteFields.numero_1],
      numero_2: dados[ClienteFields.numero_2] == null ? '' : dados[ClienteFields.numero_2],
      numero_3: dados[ClienteFields.numero_3] == null ? '' : dados[ClienteFields.numero_3],
      ref_1: dados[ClienteFields.ref_1] == null ? '' : dados[ClienteFields.ref_1],
      ref_2: dados[ClienteFields.ref_2] == null ? '' : dados[ClienteFields.ref_2],
      ref_3: dados[ClienteFields.ref_3] == null ? '' : dados[ClienteFields.ref_3]
    );
  }

  static Cliente generetaByMapWithID(Map<String,dynamic> dados, {required int id}){
    return Cliente(
      id: id,
      bairro: dados[ClienteFields.bairro],
      cep: dados[ClienteFields.cep],
      cidade: dados[ClienteFields.cidade],
      cgf: dados[ClienteFields.cgf],
      cnpj: dados[ClienteFields.cnpj],
      contato: dados[ClienteFields.contato],
      createdTime: DateTime.now(),
      email: dados[ClienteFields.email],
      endereco: dados[ClienteFields.endereco],
      fone: dados[ClienteFields.fone],
      nomeFantasia: dados[ClienteFields.nomeFantasia],
      numeroRua: dados[ClienteFields.numeroRua],
      pFisica: dados[ClienteFields.pFisica],
      pontoReferencia: dados[ClienteFields.pontoReferencia],
      razaoSocial: dados[ClienteFields.razaoSocial],
      residenciaPropria: dados[ClienteFields.residenciaPropria],
      comentario: dados[ClienteFields.comentario] == null ? '' : dados[ClienteFields.comentario],
      numero_1: dados[ClienteFields.numero_1] == null ? '' : dados[ClienteFields.numero_1],
      numero_2: dados[ClienteFields.numero_2] == null ? '' : dados[ClienteFields.numero_2],
      numero_3: dados[ClienteFields.numero_3] == null ? '' : dados[ClienteFields.numero_3],
      ref_1: dados[ClienteFields.ref_1] == null ? '' : dados[ClienteFields.ref_1],
      ref_2: dados[ClienteFields.ref_2] == null ? '' : dados[ClienteFields.ref_2],
      ref_3: dados[ClienteFields.ref_3] == null ? '' : dados[ClienteFields.ref_3]
    );
  }

}