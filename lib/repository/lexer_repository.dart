import 'package:compilador/repository/lexer_repository_interface.dart';

class LexerRepository implements ILexerRepository{
  @override
  String getOperationFromExpression({String expression, int position, String type}) {
    String exp = expression.replaceRange(position+1, expression.length, ''); 
      for(var i =0; i< exp.length-1; i++){
        // if(int.tryParse(exp[i])==null){
        //   exp = exp.replaceFirst(exp[i], ' ',i);
        // }
        if(!exp[i].contains(RegExp(r'^[a-zA]+$'))){
          exp = exp.replaceFirst(exp[i], ' ',i); // Eliminar tudo que não for um  caracter válido
        }
      }
      exp = exp.trim();
       if(exp.contains(' ')){
         exp = exp.replaceRange(0, exp.lastIndexOf(' '), '').trim();
       }
          if(exp.length == 3){
         exp = exp[0]+exp[exp.length-1]+exp[1];
         //Se for maior que 2 devemos ajustar a string para o formato correto. Ex: 54* -> 5*4
       }
         return exp;
  }
}