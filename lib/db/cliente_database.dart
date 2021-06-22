import 'package:ads_proj/models/cliente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ClienteDatabase{
  static final ClienteDatabase instance = ClienteDatabase._init();

  static Database? _database;

  ClienteDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('clientes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';

    await db.execute(
      '''
      CREATE TABLE $tableClientes (
        ${ClienteFields.id} $idType,
        ${ClienteFields.time} $textType,
        ${ClienteFields.razaoSocial} $textType,
        ${ClienteFields.nomeFantasia} $textType,
        ${ClienteFields.residenciaPropria} $boolType,
        ${ClienteFields.pFisica} $boolType,
        ${ClienteFields.endereco} $textType,
        ${ClienteFields.bairro} $textType,
        ${ClienteFields.numeroRua} $textType,
        ${ClienteFields.cidade} $textType,
        ${ClienteFields.cep} $textType,
        ${ClienteFields.pontoReferencia} $textType,
        ${ClienteFields.cnpj} $textType,
        ${ClienteFields.cgf} $textType,
        ${ClienteFields.contato} $textType,
        ${ClienteFields.fone} $textType,
        ${ClienteFields.email} $textType,
        ${ClienteFields.ref_1} $textType,
        ${ClienteFields.numero_1} $textType,
        ${ClienteFields.ref_2} $textType,
        ${ClienteFields.numero_2} $textType,
        ${ClienteFields.ref_3} $textType,
        ${ClienteFields.numero_3} $textType,
        ${ClienteFields.comentario} $textType
      )
      '''
    );
  }

  Future<Cliente> create(Cliente cliente) async {
    final db = await instance.database;
    final id = await db.insert(tableClientes, cliente.toJson());

    return cliente.copy(id: id);
  }

  Future<Cliente> readCliente(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableClientes,
      columns: ClienteFields.values,
      where: '${ClienteFields.id} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return Cliente.fromJson(maps.first);
    }else{
      throw Exception('ID $id não encontrado');
    }
  }

  Future<List<Cliente>> readAllCliente() async {
    final db = await instance.database;

    final orderBy = '${ClienteFields.time} ASC';

    final result = await db.query(tableClientes, orderBy: orderBy);

    return result.map((json) => Cliente.fromJson(json)).toList();
  }

  Future<int> update(Cliente cliente) async {
    final db = await instance.database;

    return db.update(
      tableClientes,
      cliente.toJson(),
      where: '${ClienteFields.id} = ?',
      whereArgs: [cliente.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableClientes,
      where: '${ClienteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}