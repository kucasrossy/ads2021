import 'package:ads_proj/db/cliente_database.dart';
import 'package:ads_proj/models/cliente.dart';
import 'package:ads_proj/pages/cadastro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class EditFormularioCadastro extends StatefulWidget {
  
  EditFormularioCadastro(this.cliente);

  Cliente cliente;

  @override
  _EditFormularioCadastro createState() => _EditFormularioCadastro();
}

var maskNumberFomart = MaskTextInputFormatter(mask: '(##) #########');
var maskCepFormat = MaskTextInputFormatter(mask: '##.###-###');
var maskCNPJFormat = MaskTextInputFormatter(mask: '##.###.###/####-##');
var maskCGFFormat = MaskTextInputFormatter(mask: '########-#'); 
final formKey = GlobalKey<FormBuilderState>();

class _EditFormularioCadastro extends State<EditFormularioCadastro> {
  var moradiaOptions = [{'Propria' : true},{'Alugado' : false}];
  var pessoaOptions = [{'Juridica' : true}, {'Fisica' : false}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atualização do Cadastro', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w600, fontSize: 20),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue.shade900,),
          onPressed: (){
            formKey.currentState!.reset();
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Informações do Cliente', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue.shade900),),
                SizedBox(height: 16),
                buildFormText(
                  context,
                  ClienteFields.razaoSocial, 
                  'Razão Social',
                  'Digite a razão social',
                  30
                ),
                buildFormText(
                  context,
                  ClienteFields.nomeFantasia,
                  'Nome fantasia',
                  'Digite o nome fantasia',
                  30
                ),
                SizedBox(height: 8,),
                buildDropdow(
                  context,
                  ClienteFields.pFisica,
                  'Pessoa',
                  'o tipo da pessoa',
                  pessoaOptions
                ),
                SizedBox(height: 16,),
                buildDropdow(
                  context,
                  ClienteFields.residenciaPropria,
                  'Residencia',
                  'O tipo da residencia',
                  moradiaOptions
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Flexible(
                      child: buildFormText(
                              context,
                              ClienteFields.endereco,
                              'Endereço',
                              'endereço do cliente',
                              25
                            ),
                    ),
                    SizedBox(width: 3),
                    Flexible(
                      child: buildFormText(
                              context,
                              ClienteFields.numeroRua,
                              'Numero',
                              '',
                              25
                            ),
                    ),
                  ],
                ),
                buildFormText(
                  context,
                  ClienteFields.bairro,
                  'Bairro',
                  'Digite o bairro do cliente',
                  20
                ),
                buildFormText(
                  context,
                  ClienteFields.cidade,
                  'Cidade',
                  'Digide a cidade do cliente',
                  20
                ),
                buildCepText(context, ClienteFields.cep),
                buildFormText(
                  context,
                  ClienteFields.pontoReferencia, 
                  'Ponto de referencia',
                  'Digite um ponto de referencia',
                  30
                ),
                buildCnpjText(context, ClienteFields.cnpj),
                buildCgfjText(context, ClienteFields.cgf),
                buildFormText(
                  context,
                  ClienteFields.contato,
                  'Contato',
                  'Digite o nome do contato',
                  15
                ),
                buildPhoneText(
                  context,
                  ClienteFields.fone,
                  'Telefone para contato',
                  15
                ),
                buildEmailText(context, ClienteFields.email),
                SizedBox(height: 16),
                Text('Referencias: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue.shade900),),
                SizedBox(height: 16),
                buildReferenciaForm(context, ClienteFields.ref_1, ClienteFields.numero_1),
                SizedBox(height: 16),
                buildReferenciaForm(context, ClienteFields.ref_2, ClienteFields.numero_2),
                SizedBox(height: 16),
                buildReferenciaForm(context, ClienteFields.ref_3, ClienteFields.numero_3),
                SizedBox(height: 16),
                Text('Comentario: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue.shade900),),
                SizedBox(height: 16),
                builTextComentario(context, ClienteFields.comentario),
                SizedBox(height: 25),
                Container(
                  alignment: Alignment.center,
                  child: buildEdit(context, widget.cliente),
                )
              ],
            ),
          ),
        ),
        autovalidateMode: AutovalidateMode.disabled,
        initialValue: {
          ClienteFields.razaoSocial : widget.cliente.razaoSocial,
          ClienteFields.nomeFantasia : widget.cliente.nomeFantasia,
          ClienteFields.pFisica : widget.cliente.pFisica,
          ClienteFields.residenciaPropria : widget.cliente.residenciaPropria,
          ClienteFields.endereco : widget.cliente.endereco,
          ClienteFields.numeroRua : widget.cliente.numeroRua,
          ClienteFields.bairro : widget.cliente.bairro,
          ClienteFields.cidade : widget.cliente.cidade,
          ClienteFields.cep : widget.cliente.cep,
          ClienteFields.cnpj : widget.cliente.cnpj,
          ClienteFields.pontoReferencia : widget.cliente.pontoReferencia,
          ClienteFields.cgf : widget.cliente.cgf,
          ClienteFields.contato : widget.cliente.contato,
          ClienteFields.fone : widget.cliente.fone,
          ClienteFields.email : widget.cliente.email,
          ClienteFields.ref_1 : widget.cliente.ref_1,
          ClienteFields.ref_2 : widget.cliente.ref_2,
          ClienteFields.ref_3 : widget.cliente.ref_3,
          ClienteFields.numero_1 : widget.cliente.numero_1,
          ClienteFields.numero_2 : widget.cliente.numero_2,
          ClienteFields.numero_3 : widget.cliente.numero_3,
          ClienteFields.contato : widget.cliente.contato
        },
      ),
    );
  }
}

buildFormName(name, lbText, htText, mLength){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
      labelText: lbText,
      hintText: htText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      )
    ),
    maxLength: mLength,
    validator: (val){
      if(val!.length <= 4){
        return 'O nome precisar ter mais de três digitos';
      }else{
        return null;
      }
    },
  );
} 

buildFormText(context,name, lbText, htText, mLength){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
      labelText: lbText,
      hintText: htText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      )
    ),
    maxLength: mLength,
    validator: FormBuilderValidators.required(context,errorText: 'Esse campo não pode esta vazio'),
  );
} 

buildDropdow(context, name, lbText,hnText, List<Map<String,dynamic>> listItem){
  return FormBuilderDropdown(
    name: name,
    decoration: InputDecoration(
      labelText: lbText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      )
    ),
    allowClear: true,
    hint: Text(hnText),
    validator: FormBuilderValidators.required(context,errorText: 'Esse campo não pode esta vazio'),
    items: listItem.map(
      (v) => DropdownMenuItem(
        value: v.values.single,
        child: Text('${v.keys.single}'),
      )
    ).toList()
  );
}

buildPhoneText(context,name, lbText,mLength){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
      labelText: lbText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
    ),
    maxLength: mLength,
    keyboardType: TextInputType.phone,
    inputFormatters: [maskNumberFomart],
    validator: FormBuilderValidators.required(context, errorText: 'Esse campo não pode esta vazio'),
  );
} 

buildCepText(context,name){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
      labelText: 'CEP',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
    ),
    maxLength: 11, //
    keyboardType: TextInputType.phone,
    inputFormatters: [maskCepFormat],
    validator: FormBuilderValidators.required(context, errorText: 'Esse campo não pode esta vazio'),
  );
} 

buildCnpjText(context,name){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
      labelText: 'CNPJ',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
    ),
    maxLength: 18, //
    keyboardType: TextInputType.phone,
    inputFormatters: [maskCNPJFormat],
    validator: FormBuilderValidators.required(context, errorText: 'Esse campo não pode esta vazio'),
  );
} 

buildCgfjText(context,name){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
      labelText: 'CGF',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
    ),
    maxLength: 10, //
    keyboardType: TextInputType.phone,
    inputFormatters: [maskCGFFormat],
    validator: FormBuilderValidators.required(context, errorText: 'Esse campo não pode esta vazio'),
  );
} 

buildEmailText(context, name){
  return FormBuilderTextField(
    name: name,
    keyboardType: TextInputType.emailAddress,
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(context, errorText: 'Esse campo não pode esta vazio'),
      FormBuilderValidators.email(context)
    ]),
    decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
    ),
  );
}

//Formulario
buildReferenciaForm(context, ref, refNum){
  return Row(
    children: [
      Flexible(child: buildTextReferencia(context, ref)),
      SizedBox(width: 10),
      Flexible(child: builFoneReferencia(context, refNum))
    ],
  );
}

buildTextReferencia(context, name){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
        labelText: 'Nome da Referencia',
        border: OutlineInputBorder(),
    ),
  );
}

builFoneReferencia(context, name){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
        labelText: 'Telefone',
        border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
    inputFormatters: [maskNumberFomart],
  );
}

buildEdit(context, Cliente cliente){
  return ElevatedButton(
    onPressed: () => _atualizarCadastro(context, cliente),
    child: Text('Atualizar cadastro'),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.only(right: 20, left: 20, top: 16, bottom: 16),
      primary: Colors.blue.shade900,
      textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
            ),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18)
      ),
    ),
  );
}

builTextComentario(context, name){
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(
        labelText: 'Comentario',
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    keyboardType: TextInputType.multiline,
    maxLines: 3,
  );
}

_atualizarCadastro(context, Cliente cliente) async {
  var validat = formKey.currentState!.validate();

  if(validat){
    formKey.currentState!.save();
    var dados = formKey.currentState!.value;
    
    var clienteModel = Cliente.generetaByMapWithID(dados, id: cliente.id!);

    
    var result = await ClienteDatabase.instance.update(clienteModel);

    print(result);
    
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CadastroPage())
    );
  }
}

