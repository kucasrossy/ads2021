final String tableClientes = 'clientes';

class ClienteFields{

  static final List<String> values = [
    id, razaoSocial, nomeFantasia, residenciaPropria, pFisica, endereco,
    bairro, numeroRua, cidade, cep, pontoReferencia, cnpj, cgf,
    contato, fone, email, ref_1, numero_1, ref_2, numero_2,
    ref_3, numero_3, comentario
  ];

  static final String id = '_id';
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


}