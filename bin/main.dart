
import 'dart:io';

import 'package:compilador/repository/lexer_repository.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as Math;

List<String> operacoes = [];

void main(List<String> arguments) {
  String expressao;
  stdout.writeln('Passe como parâmetro uma expressão simbólica.\nExemplo -> Expressão simbólica: ab*cd/+');
  var lexer = LexerRepository();
  if(arguments.isNotEmpty){
  expressao = arguments[0];
  for(var i = 0; i< expressao.length; i++){
    if(expressao[i] == '*'){
          operacoes.add(lexer.getOperationFromExpression(expression:expressao,position:i));
    }
    if(expressao[i] == '/'){
     operacoes.add(lexer.getOperationFromExpression(expression:expressao,position:i));
    }
    if(expressao[i] == '-'){
      operacoes.add(lexer.getOperationFromExpression(expression:expressao,position:i));
    }
    if(expressao[i] == '+'){
       operacoes.add(lexer.getOperationFromExpression(expression:expressao,position:i));
    }
  }
  print(operacoes);
  int operatorPos = 0;
  for(var i = 0; i<operacoes.length; i++){
    if(operacoes[i] == '-'){
      List<String> tempList = operacoes.sublist(operatorPos,i);
      String tempOp = '';
      for(var i=0;i<tempList.length; i++){
        if(i==tempList.length-1) {
          tempOp += '(${tempList[i]})';
        } else {
          tempOp += '(${tempList[i]})-';
        }

      }
      operatorPos = i;
      print(operatorPos);
      operacoes[i] = tempOp;
    }
    if(operacoes[i] == '/'){
      List<String> tempList = operacoes.sublist(operatorPos,i);
      String tempOp = '';
      for(var i=0;i<tempList.length; i++){
        if(i==tempList.length-1) {
          tempOp += '(${tempList[i]})';
        } else {
          tempOp += '(${tempList[i]})/';
        }
      }
      operatorPos = i;
      print(operatorPos);
      operacoes[i] = tempOp;
    }
    if(operacoes[i] == '*'){
      List<String> tempList = operacoes.sublist(operatorPos,i);
      String tempOp = '';
      for(var i=0;i<tempList.length; i++){
        if(i==tempList.length-1) {
         tempOp += '(${tempList[i]})';
        } else {
          tempOp += '(${tempList[i]})*';
        }

      }
      operatorPos = i;
      print(operatorPos);
      operacoes[i] = tempOp;
    }
    if(operacoes[i] == '+'){
      List<String> tempList = operacoes.sublist(operatorPos,i);
      String tempOp = '';
      for(var i=0;i<tempList.length; i++){
        if(i==tempList.length-1) {
          tempOp += '(${tempList[i]})';
        } else {
          tempOp += '(${tempList[i]})+';
        }

      }
      operatorPos = i;
      print(operatorPos);
      operacoes[i] = tempOp;
    }
  }
  print(operacoes);
  // Parser p = Parser();
  // Expression exp = p.parse(operacoes.last);
  // print(exp.evaluate(EvaluationType.REAL,null));
  }
}
