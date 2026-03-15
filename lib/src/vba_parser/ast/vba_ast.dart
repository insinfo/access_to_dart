/// Define os Nodos base da Árvore de Sintaxe Abstrata (AST) do VBA.
abstract class VbaNode {}

/* ========================================================================= */
/* EXPRESSÕES                                                                */
/* ========================================================================= */
abstract class VbaExpression extends VbaNode {}

class VbaBinaryOp extends VbaExpression {
  final VbaExpression left;
  final String operatorStr;
  final VbaExpression right;
  VbaBinaryOp(this.left, this.operatorStr, this.right);
}

class VbaIdentifier extends VbaExpression {
  final String name;
  VbaIdentifier(this.name);
}

class VbaLiteral extends VbaExpression {
  final dynamic value;
  VbaLiteral(this.value);
}

class VbaCallExpression extends VbaExpression {
  final String callee;
  final List<VbaExpression> arguments;
  VbaCallExpression(this.callee, this.arguments);
}

/* ========================================================================= */
/* INSTRUÇÕES / STATEMENTS                                                   */
/* ========================================================================= */
abstract class VbaStatement extends VbaNode {}

class VbaAssignment extends VbaStatement {
  final String variableName;
  final VbaExpression value;
  VbaAssignment(this.variableName, this.value);
}

class VbaIfStatement extends VbaStatement {
  final VbaExpression condition;
  final List<VbaStatement> thenBranch;
  final List<VbaStatement> elseBranch;
  VbaIfStatement(this.condition, this.thenBranch, this.elseBranch);
}

class VbaCallStatement extends VbaStatement {
  final String subName;
  final List<VbaExpression> arguments;
  VbaCallStatement(this.subName, this.arguments);
}

class VbaDimStatement extends VbaStatement {
  final String variableName;
  final String typeName;
  VbaDimStatement(this.variableName, this.typeName);
}

class VbaForStatement extends VbaStatement {
  final String loopVariable;
  final VbaExpression startValue;
  final VbaExpression endValue;
  final VbaExpression? stepValue;
  final List<VbaStatement> body;
  VbaForStatement(this.loopVariable, this.startValue, this.endValue, this.stepValue, this.body);
}

class VbaDoWhileStatement extends VbaStatement {
  final VbaExpression condition;
  final List<VbaStatement> body;
  VbaDoWhileStatement(this.condition, this.body);
}

class VbaOnErrorStatement extends VbaStatement {
  final String target; // "Resume Next", "0", ou nome de label
  VbaOnErrorStatement(this.target);
}

/* ========================================================================= */
/* DECLARAÇÕES ROOT (MÓDULOS E FUNÇÕES)                                      */
/* ========================================================================= */
class VbaModule extends VbaNode {
  final List<VbaSubDeclaration> subs;
  VbaModule(this.subs);
}

class VbaSubDeclaration extends VbaNode {
  final String name;
  final bool isFunction;
  final String? returnType;
  final List<VbaStatement> body;
  
  VbaSubDeclaration({
    required this.name,
    this.isFunction = false,
    this.returnType,
    required this.body,
  });
}
