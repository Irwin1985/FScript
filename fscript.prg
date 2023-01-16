* ================================================================================== *
* FScript scripting languaje.
* Version: 0.0.1
* Autor: Irwin Rodríguez <rodriguez.irwin@gmail.com>
*
* FScript es un pequeño DSL para personalizar las pantallas de nuestras
* aplicaciones Fox en tiempo de ejecución.
*
* Ejemplo:
* fscriptRun('info("Hello world!")')
*
* ================================================================================== *

function fsScriptRun(tcFileNameOrScript)
	* ================================================================================== *
	* DEFINICIÓN DE CONSTANTES
	* ================================================================================== *
	#define FS_LANG					"es"
	#define FS_ERROR_TITLE          "FScript Error"
	#define FS_RUNTIME_ERROR_TITLE  "FScript Runtime Error"

	#if FS_LANG == "es"
		#define FS_FILE_NOT_FOUND       "Archivo no encontrado: "
		#define FS_AT_END               " al final"
		#define FS_ERROR_NEAR_OF        " error cerca de "
		#define FS_UNKNOWN_CHARACTER    "Caracter desconocido: "

		#define FS_EXPECTED_FOR_1       "Se esperaba '(' después de la palabra reservada 'for'."
		#define FS_EXPECTED_FOR_2       "Se esperaba la palabra reservada 'in' u 'of'."
		#define FS_EXPECTED_FOR_3       "Se esperaba ')' después de los elementos del 'for'."
		#define FS_EXPECTED_FOR_4       "Se esperaba '{' antes del cuerpo del 'for'."

		#define FS_EXPECTED_IF_1        "Se esperaba '(' después de la palabra reservada 'if'."
		#define FS_EXPECTED_IF_2        "Se esperaba ')' después de la condición del 'if'."

		#define FS_EXPECTED_RETURN_1    "Se esperaba ';' después del valor del 'return'."
		#define FS_EXPECTED_VAR_1       "Se esperaba ';' después de la declaración de la variable."

		#define FS_EXPECTED_WHILE_1     "Se esperaba '(' después de la palabra reservada 'while'."
		#define FS_EXPECTED_WHILE_2     "Se esperaba ')' después de la condición."

		#define FS_EXPECTED_EXP_1       "Se esperaba ';' después de la expresión."

		#define FS_EXPECTED_BLOCK_1     "Se esperaba '}' después del cuerpo."

		#define FS_EXPECTED_ASSIGN_1    "Objetivo de asignación no válido."

		#define FS_EXPECTED_CALL_1      "Se esperaba ')' después de los argumentos."
		#define FS_EXPECTED_CALL_2      "Se esperaba un nombre para la propiedad después de símbolo '.'."
		#define FS_EXPECTED_CALL_3      "Se esperaba ']' después de la expresión del array."
		#define FS_EXPECTED_CALL_4      "Tipo de parámetro no válido en la definición de la función."
		#define FS_EXPECTED_CALL_5      "Se esperaba '{' antes del cuerpo de la función."

		#define FS_EXPECTED_PRIMARY_1   "Se esperaba ')' después de la expresión."
		#define FS_EXPECTED_PRIMARY_2   "Se esperaba una expresión."

		#define FS_EXPECTED_ARRAY_1     "Se esperaba ']' después de los elementos del array."

		#define FS_EXPECTED_OBJECT_1     "Se esperaba ':' después del nombre de la propiedad."
		#define FS_EXPECTED_OBJECT_2     "Nombre de propiedad no válido."
		#define FS_EXPECTED_OBJECT_3     "Se esperaba '}' después de los elementos del objeto."

		#define FS_EXPECTED_FUNC_1       "Se esperaba '(' después del nombre de la función."
		#define FS_EXPECTED_FUNC_2       "Se esperaba el nombre del parámetro."
		#define FS_EXPECTED_FUNC_3       "Se esperaba ')' después de los parámetros."
		#define FS_EXPECTED_FUNC_4       "Se esperaba '{' antes del cuerpo de la función."
		#define FS_EXPECT_VARIABLE_NAME  "Se esperaba un nombre de variable."

		#define FS_INTERPRETER_1        "¿Desea continuar con la ejecución del script?"
		#define FS_INTERPRETER_2        "Colección no válida para el bucle 'in', tipos permitidos: STRING, ARRAY, MAP"
		#define FS_INTERPRETER_3        "Colección no válida para el bucle 'of', tipos permitidos: STRING, ARRAY"
		#define FS_INTERPRETER_4        "Los operandos deben ser dos números o dos cadenas."
		#define FS_INTERPRETER_5        "El objeto actual no es un objeto invocable."
		#define FS_INTERPRETER_6        "Se esperaba "
		#define FS_INTERPRETER_7        " argumentos pero se obtuvieron "
		#define FS_INTERPRETER_8        "Índice no válido para el array."
		#define FS_INTERPRETER_9        "Objeto inválido."
		#define FS_INTERPRETER_11       "Solo las instancias tienen campos."
		#define FS_INTERPRETER_12       "La operando debe ser un número."
		#define FS_INTERPRETER_13       "Los operandos deben ser números.."
		#define FS_INTERPRETER_14       "variable indefinida"
		#define FS_INTERPRETER_15       "Tipo de argumento no válido, se espera que sea STRING."
		#define FS_INTERPRETER_16       "Nombre de evento no válido."
		#define FS_INTERPRETER_17       "Función de devolución de llamada no válida."
		#define FS_INTERPRETER_18       "El nombre para el control no es válido."
		#define FS_INTERPRETER_19       "Ruta no válida."
		#define FS_INTERPRETER_20       "Nombre de clase no válido."
		#define FS_INTERPRETER_21       "El nombre para el control no es válido."
		#define FS_INTERPRETER_22       "Se esperaba que el argumento fuera un objeto Dictionary."
		#define FS_INTERPRETER_23       "Nombre de método no válido."
		#define FS_INTERPRETER_24       "Nombre de alias no válido."
		#define FS_INTERPRETER_25       "Muy pocos argumentos."
		#define FS_INTERPRETER_26       "El argumento de tiempo de espera debe ser un número."
		#define FS_INTERPRETER_27       "El argumento de posición debe ser un número."
		#define FS_INTERPRETER_28       "Debe especificar parámetros adicionales."
		#define FS_INTERPRETER_29       "Propiedad indefinida "
	#else
		#define FS_FILE_NOT_FOUND       "File not found: "
		#define FS_AT_END               " at end"
		#define FS_ERROR_NEAR_OF        " error near of "
		#define FS_UNKNOWN_CHARACTER    "Unknown character: "

		#define FS_EXPECTED_FOR_1       "Expect '(' after for keyword."
		#define FS_EXPECTED_FOR_2       "Expected keyword to be 'in' or 'of'."
		#define FS_EXPECTED_FOR_3       "Expect ')' after for elements."
		#define FS_EXPECTED_FOR_4       "Expect '{' before for body."

		#define FS_EXPECTED_IF_1        "Expect '(' after 'if'."
		#define FS_EXPECTED_IF_2        "Expect ')' after if condition."

		#define FS_EXPECTED_RETURN_1    "Expect ';' after return value."
		#define FS_EXPECTED_VAR_1       "Expect ';' after variable declaration."

		#define FS_EXPECTED_WHILE_1     "Expect '(' after 'while'."
		#define FS_EXPECTED_WHILE_2     "Expect ')' after condition."

		#define FS_EXPECTED_EXP_1       "Expect ';' after expression."

		#define FS_EXPECTED_BLOCK_1     "Expect '}' after block."

		#define FS_EXPECTED_ASSIGN_1    "Invalid assignment target."

		#define FS_EXPECTED_CALL_1      "Expect ')' after arguments."
		#define FS_EXPECTED_CALL_2      "Expect property name after '.'."
		#define FS_EXPECTED_CALL_3      "Expect ']' after array expression."
		#define FS_EXPECTED_CALL_4      "Invalid parameter type in function definition."
		#define FS_EXPECTED_CALL_5      "Expect '{' before function body."

		#define FS_EXPECTED_PRIMARY_1   "Expect ')' after expression."
		#define FS_EXPECTED_PRIMARY_2   "Expect expression."

		#define FS_EXPECTED_ARRAY_1     "Expect ']' after array elements."

		#define FS_EXPECTED_OBJECT_1     "Expect ':' after property name."
		#define FS_EXPECTED_OBJECT_2     "Invalid property name."
		#define FS_EXPECTED_OBJECT_3     "Expect '}' after object elements."

		#define FS_EXPECTED_FUNC_1       "Expect '(' after function name."
		#define FS_EXPECTED_FUNC_2       "Expect parameter name."
		#define FS_EXPECTED_FUNC_3       "Expect ')' after parameters."
		#define FS_EXPECTED_FUNC_4       "Expect '{' before function body."
		#define FS_EXPECT_VARIABLE_NAME  "Expect variable name."

		#define FS_INTERPRETER_1        "¿Do you want to continue the script execution?"
		#define FS_INTERPRETER_2        "Invalid collection for 'in' loop, allowed types: STRING, ARRAY, MAP"
		#define FS_INTERPRETER_3        "Invalid collection for 'of' loop, allowed types: STRING, ARRAY"
		#define FS_INTERPRETER_4        "Operands must be two numbers or two strings."
		#define FS_INTERPRETER_5        "The current object is not a callable object."
		#define FS_INTERPRETER_6        "Expected "
		#define FS_INTERPRETER_7        " arguments but got "
		#define FS_INTERPRETER_8        "Invalid index for array."
		#define FS_INTERPRETER_9        "Invalid object."
		#define FS_INTERPRETER_11       "Only instances have fields."
		#define FS_INTERPRETER_12       "Operand must be a number."
		#define FS_INTERPRETER_13       "Operands must be a numbers."
		#define FS_INTERPRETER_14       "Undefined variable"
		#define FS_INTERPRETER_15       "Invalid argument type, expected to be STRING."
		#define FS_INTERPRETER_16       "Invalid event name."
		#define FS_INTERPRETER_17       "Invalid callback function."
		#define FS_INTERPRETER_18       "Invalid control name."
		#define FS_INTERPRETER_19       "Invalid path."
		#define FS_INTERPRETER_20       "Invalid class name."
		#define FS_INTERPRETER_21       "Invalid control name."
		#define FS_INTERPRETER_22       "Expected argument to be a Dictionary object."
		#define FS_INTERPRETER_23       "Invalid method name."
		#define FS_INTERPRETER_24       "Invalid alias name."
		#define FS_INTERPRETER_25       "Too few arguments."
		#define FS_INTERPRETER_26       "Timeout argument must be a number."
		#define FS_INTERPRETER_27       "Position argument must be a number."
		#define FS_INTERPRETER_28       "Must specify additional parameters."
		#define FS_INTERPRETER_29       "Undefined property "
	#endif

	#define RUNTIME_DEBUG			.f.
	#define CRLF					chr(13) + chr(10)
	#define TRUE					.t.
	#define FALSE					.f.
	#define TT_EOF					0
	#define TT_IGNORE				1
	#define TT_SEMICOLON			2
	#define TT_RELATIONAL_OPERATOR	3
	#define TT_EQUALITY_OPERATOR	4
	#define TT_SIMPLE_ASSIGN		5
	#define TT_COMPLEX_ASSIGN		6
	#define TT_NUMBER				7
	#define TT_STRING				8
	#define TT_IDENTIFIER			9
	#define TT_LPAREN				10
	#define TT_RPAREN				11
	#define TT_LBRACKET				12
	#define TT_RBRACKET				13
	#define TT_LBRACE				14
	#define TT_RBRACE				15
	#define TT_DOT					16
	#define TT_COMMA				17
	#define TT_COLON				18
	#define TT_LOGICAL_AND			19
	#define TT_LOGICAL_OR			20
	#define TT_LOGICAL_NOT			21
	#define TT_TERM_OPERATOR		22
	#define TT_FACTOR_OPERATOR		23
	#define TT_ARROW				24
	#define TT_STRING_MERGE			25
	#define TT_RGB					26

	* ================================================================================== *
	* Palabras reservadas
	* ================================================================================== *
	#define TT_DO					101
	#define TT_FALSE				102
	#define TT_BREAK				103
	#define TT_CONTINUE				104
	#define TT_ELSE					105
	#define TT_VAR					106
	#define TT_FOR					107
	#define TT_IN					108
	#define TT_NULL					109
	#define TT_RETURN				110
	#define TT_FUNCTION				111
	#define TT_WHILE				112
	#define TT_IF					113
	#define TT_TRUE					114
	#define TT_WINDOW				115
	#define TT_OF					116

	* ================================================================================== *
	* CATEGORIAS PARA LOS TOKENS
	* ================================================================================== *
	#define TC_LITERAL		1
	#define TC_IGNORABLE	2
	#define TC_KEYWORD		3
	#define TC_IDENTIFIER	4
	#define TC_ASSIGNMENT	5
	#define TC_GENERIC		6
	#define TC_UNARY		7
	#define TC_ASSIGN		8
	#define TC_LESS			9
	#define TC_LESS_EQ		10
	#define TC_GREATER		11
	#define TC_GREATER_EQ	12
	#define TC_EQUAL		13
	#define TC_BANG			14
	#define TC_NOT_EQ		15
	#define TC_PLUS			16
	#define TC_MINUS		17
	#define TC_MUL			18
	#define TC_DIV			19
	* ================================================================================== *
	* FIN DE LA DEFINICIÓN DE CONSTANTES
	* ================================================================================== *
	if type('_screen.foxscript') = 'U'
		=addproperty(_screen, 'foxscript', .null.)
	endif
	_screen.foxscript = createobject("FoxScript")
	return _screen.foxScript.run(tcFileNameOrScript)
endfunc

* ================================================================================== *
* 								DETALLES DE IMPLEMENTACIÓN
* ================================================================================== *
* ================================================================================== *
* FoxScript class
* ================================================================================== *
define class FoxScript as custom
	lHadError = .f.
	lHadRunTimeError = .f.
	hidden oInterpreter
	oContext = .null.

	function init
		this.oInterpreter = createobject("Interpreter")
	endfunc

	function run(tcFileNameOrScript)
		if lower(right(tcFileNameOrScript, 8)) == '.fscript'
			if !file(tcFileNameOrScript)
				messagebox(FS_FILE_NOT_FOUND + "'" + tcFileNameOrScript + "'", 16, FS_ERROR_TITLE)
				return .null.
			endif
			tcFileNameOrScript = strconv(filetostr(tcFileNameOrScript), 11)
		endif
		return this.Execute(tcFileNameOrScript)
	endfunc

	function Execute(tcSource)
		local loScanner, loTokens, loParser, loResolver, loStatements, llPrintTokens
		loScanner = createobject("Scanner", tcSource)

		loTokens = loScanner.scanTokens()
		llPrintTokens = FALSE

		* <DEBUG>
		if llPrintTokens
			for each loToken in loTokens
				? loToken.toString()
			endfor
			return
		endif
		* <DEBUG>

		loParser = createobject("Parser", loTokens)
		loStatements = loParser.parse()

		* Stop if there was a syntax error.
		if this.lHadError
			return .null.
		endif
		return this.oInterpreter.interpret(loStatements)
	endfunc

	function errorLine(tnLine, tnCol, tcMessage)
		this.reportError(tnLine, tnCol, "", tcMessage)
	endfunc

	function reportError(tnLine, tnCol, tcWhere, tcMessage)
		messagebox(this.formatError("Parsing", tnLine, tnCol, tcWhere, tcMessage), 16, FS_ERROR_TITLE)
		this.lHadError = TRUE
	endfunc

	function errorToken(toToken, tcMessage)
		if toToken.type == TT_EOF
			this.reportError(toToken.line, toToken.col, FS_AT_END, tcMessage)
		else
			this.reportError(toToken.line, toToken.col, toToken.lexeme, tcMessage)
		endif
	endfunc

	function runtimeError(toException)
		messagebox(this.formatError("Runtime", toException.Token.line, toException.Token.col, toException.Token.lexeme, toException.message), 16, FS_ERROR_TITLE)
		this.lHadRunTimeError = TRUE
	endfunc

	function formatError(tcErrorStr, tnLine, tnCol, tcWhere, tcMessage)
		return "[" + alltrim(str(tnLine)) + ":" + alltrim(str(tnCol)) + "] - " + tcErrorStr + FS_ERROR_NEAR_OF + "`" + tcWhere + "`: " + tcMessage
	endfunc

	function throwError(tcType, tcPropertyName, tvPropertyValue, tcMessage)
		local oExp
		try
			throw
		catch to oExp
			=addproperty(oExp, 'type', tcType)
			=addproperty(oExp, tcPropertyName, tvPropertyValue)
			oExp.message = tcMessage
			throw
		endtry
	endfunc

	function eventManager
		local array arrEvents[1]
		local loControl, lnIndex, loCode
		aevents(arrEvents, 0)
		loControl = arrEvents[1]
		if type('loControl.__foxscriptEvent') != 'O'
			return .null.
		endif
		return loControl.__foxscriptEvent.call(this.oInterpreter, createobject('Collection'))
	endfunc
enddefine

* ================================================================================== *
* Scanner class
* ================================================================================== *
define class Scanner as custom
	hidden cSource
	hidden nCursor
	hidden nTokenCounter
	hidden nLastToken
	hidden oRegEx
	hidden oTokens
	hidden nLine
	hidden nCol
	dimension aSpecs[100]

	function init(tcSource)
		if right(tcSource, 1) != chr(10)
			tcSource = tcSource + CRLF
		endif
		with this
			.cSource = tcSource
			.nCursor = 1
			.nTokenCounter = 0
			.nLastToken = 0
			.oTokens = createobject('Collection')
			* Setting the oRegEx properties
			.oRegEx = createobject("VBScript.RegExp")
			.oRegEx.IgnoreCase = .f.
			.oRegEx.global = .t.
			.nLine = 1
			.nCol = 1

			local i, lcPattern
			i = 1
			* -----------------------------------------------------------
			* Whitespace:
			.aSpecs[i] = createobject("Spec", "^\s+", TT_IGNORE, TC_IGNORABLE)

			* -----------------------------------------------------------
			* Comments:
			* Skip single-line comments
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\/\/.*", TT_IGNORE, TC_IGNORABLE)

			* Skip multi-line comments
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\/\*[\s\S]*?\*\/", TT_IGNORE, TC_IGNORABLE)

			* -----------------------------------------------------------
			* Semicolon:
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^;", TT_SEMICOLON, TC_GENERIC)

			* -----------------------------------------------------------
			* Numbers:
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\d+[_.\d]*", TT_NUMBER, TC_LITERAL)

			* -----------------------------------------------------------
			* Double quoted string with scape character:
			i = i + 1
			lcPattern = '^\"(?:[^\"\\^' + chr(39) + '\\]|\\.)*\"'
			.aSpecs[i] = createobject("Spec", lcPattern, TT_STRING, TC_LITERAL)

			* -----------------------------------------------------------
			* Double quoted string:
			i = i + 1
			.aSpecs[i] = createobject("Spec", '^"[^"]*"', TT_STRING, TC_LITERAL)

			* -----------------------------------------------------------
			* Single quoted string:
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^'[^']*'", TT_STRING, TC_LITERAL)

			* -----------------------------------------------------------
			* Single quoted string with scape characters:
			i = i + 1
			lcPattern = "^'(?:[^\" + chr(34) + "\\^'\\]|\\.)*'"
			.aSpecs[i] = createobject("Spec", lcPattern, TT_STRING, TC_LITERAL)

			* -----------------------------------------------------------
			* Backticked string:
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^`[^`]*`", TT_STRING_MERGE, TC_LITERAL)

			* -----------------------------------------------------------
			* RGB Color:
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^rgb\(\s*(\d+){0,3}\s*,\s*(\d+){0,3}\s*,\s*(\d+){0,3}\s*\)", TT_RGB, TC_LITERAL)

			* -----------------------------------------------------------
			* Relational Operators:
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^[<>]=?", TT_RELATIONAL_OPERATOR, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^[=!]=", TT_EQUALITY_OPERATOR, TC_GENERIC)

			* -----------------------------------------------------------
			* Logical Operators:
			i = i + 1
			lcPattern = '^' + chr(38) + chr(38)
			.aSpecs[i] = createobject("Spec", lcPattern, TT_LOGICAL_AND, TC_GENERIC)

			i = i + 1
			lcPattern = '^\' + chr(124) + '\' + chr(124)
			.aSpecs[i] = createobject("Spec", lcPattern, TT_LOGICAL_OR, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^!", TT_LOGICAL_NOT, TC_UNARY)

			* -----------------------------------------------------------
			* Keywords:
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bdo\b", TT_DO, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bfalse\b", TT_FALSE, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bbreak\b", TT_BREAK, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bcontinue\b", TT_CONTINUE, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\belse\b", TT_ELSE, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bvar\b", TT_VAR, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bfor\b", TT_FOR, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bin\b", TT_IN, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bof\b", TT_OF, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bnull\b", TT_NULL, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\breturn\b", TT_RETURN, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bfn\b", TT_FUNCTION, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bwhile\b", TT_WHILE, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\bif\b", TT_IF, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\btrue\b", TT_TRUE, TC_KEYWORD)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\b_window\b", TT_WINDOW, TC_KEYWORD)

			* -----------------------------------------------------------
			* Assignment operators: =, +=, -=, *=, /=
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^=", TT_SIMPLE_ASSIGN, TC_ASSIGNMENT)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^[\+\-\*\/]=", TT_COMPLEX_ASSIGN, TC_ASSIGNMENT)

			* -----------------------------------------------------------
			* Math operators: +, -, *, /
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^[\+\-]", TT_TERM_OPERATOR, TC_UNARY)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^[\*\/]", TT_FACTOR_OPERATOR, TC_GENERIC)

			* -----------------------------------------------------------
			* Identifier
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\w+", TT_IDENTIFIER, TC_IDENTIFIER)

			* -----------------------------------------------------------
			* Symbol and Delimiters:
			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\(", TT_LPAREN, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\)", TT_RPAREN, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\[", TT_LBRACKET, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\]", TT_RBRACKET, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\{", TT_LBRACE, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\}", TT_RBRACE, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^\.", TT_DOT, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^,", TT_COMMA, TC_GENERIC)

			i = i + 1
			.aSpecs[i] = createobject("Spec", "^:", TT_COLON, TC_GENERIC)

			* Shrink the array
			dimension .aSpecs[i]
		endwith
	endfunc

	function scanTokens
		local loToken
		do while TRUE
			loToken = this.getNextToken()
			if isnull(loToken)
				exit
			endif
			this.oTokens.add(loToken)
		enddo
		this.oTokens.add(createobject("Token", TT_EOF, TC_GENERIC, "", "", this.nLine, this.nCol))

		return this.oTokens
	endfunc

	hidden function getNextToken
		if this.nCursor > len(this.cSource)
			return .null.
		endif
		local lcInput, i, loMatcher, lcLexeme, ln, loToken
		lcInput = substr(this.cSource, this.nCursor)
		for each loSpec in this.aSpecs
			* loSpec = this.aSpecs[i]
			this.oRegEx.pattern = loSpec.cPattern

			loMatcher = this.oRegEx.Execute(lcInput)
			if type('loMatcher') != 'O' or empty(loMatcher.count)
				loop
			endif
			* Increase cursor to the length of matched string.
			this.nCursor = this.nCursor + loMatcher.item[0].length
			lcLexeme = loMatcher.item[0].value

			* Count number of lines
			ln = len(lcLexeme) - len(strtran(lcLexeme, chr(10)))
			this.nLine = this.nLine + ln
			if ln > 0
				this.nCol = 1
			endif

			* check for the IGNORE token type.
			if loSpec.nType == TT_IGNORE
				this.nCol = this.nCol + len(lcLexeme) && update column number
				return this.getNextToken()
			endif

			* Return the token and value
			local lvValue, lnCategory
			lnCategory = loSpec.nCategory
			do case
			case loSpec.nType == TT_NUMBER
				lcLexeme = strtran(lcLexeme, '_')
				lvValue = val(lcLexeme)
			case loSpec.nType == TT_TRUE
				lvValue = TRUE
			case loSpec.nType == TT_FALSE
				lvValue = FALSE
			case loSpec.nType == TT_NULL
				lvValue = .null.
			case loSpec.nType == TT_STRING
				lcLexeme = substr(lcLexeme, 2, len(lcLexeme)-2)
				lcLexeme = strtran(lcLexeme, '\r', chr(13))
				lcLexeme = strtran(lcLexeme, '\n', chr(10))
				lcLexeme = strtran(lcLexeme, '\t', chr(9))
				lcLexeme = strtran(lcLexeme, '\"', '"')
				lcLexeme = strtran(lcLexeme, "\'", "'")
				lcLexeme = strtran(lcLexeme, '\\', "\")
				lvValue = lcLexeme
			case loSpec.nType == TT_STRING_MERGE
				lvValue = substr(lcLexeme, 2, len(lcLexeme)-2)
			case loSpec.nType == TT_RGB
				lvValue = rgb(val(strextract(lcLexeme, "(", ",",1)), val(getwordnum(lcLexeme, 2, ",")), val(strextract(lcLexeme, ",", ")",2)))
			case inlist(loSpec.nType, TT_COMPLEX_ASSIGN, TT_TERM_OPERATOR, TT_FACTOR_OPERATOR, TT_RELATIONAL_OPERATOR, TT_EQUALITY_OPERATOR, TT_LOGICAL_NOT)
				do case
				case inlist(lcLexeme, "+", "+=")
					lnCategory = TC_PLUS
				case inlist(lcLexeme, "-", "-=")
					lnCategory = TC_MINUS
				case inlist(lcLexeme, "*", "*=")
					lnCategory = TC_MUL
				case inlist(lcLexeme, "/", "/=")
					lnCategory = TC_DIV
				case lcLexeme == "="
					lnCategory = TC_ASSIGN
				case lcLexeme == "<"
					lnCategory = TC_LESS
				case lcLexeme == "<="
					lnCategory = TC_LESS_EQ
				case lcLexeme == ">"
					lnCategory = TC_GREATER
				case lcLexeme == ">="
					lnCategory = TC_GREATER_EQ
				case lcLexeme == "=="
					lnCategory = TC_EQUAL
				case lcLexeme == "!"
					lnCategory = TC_BANG
				case lcLexeme == "!="
					lnCategory = TC_NOT_EQ
				endcase
			otherwise
				lvValue = lcLexeme
			endcase
			loToken = createobject("Token", loSpec.nType, lnCategory, lcLexeme, lvValue, this.nLine, this.nCol)
			this.nCol = this.nCol + len(lcLexeme)

			return loToken
		endfor
		_screen.FoxScript.errorLine(this.nLine, this.nCol, FS_UNKNOWN_CHARACTER + substr(lcInput, 1, 1))
		return .null.
	endfunc

enddefine

* ================================================================================== *
* The Specification class for regular exp.
* ================================================================================== *
define class spec as custom
	nType = 0
	cPattern = ''
	nCategory = 0
	function init(tcPattern, tnType, tnCategory)
		this.nType = tnType
		this.cPattern = tcPattern
		this.nCategory = tnCategory
	endfunc
enddefine

* ================================================================================== *
* The Token class
* ================================================================================== *
define class Token as custom
	type = 0
	category = 0
	lexeme = ''
	literal = .null.
	line = 0
	col = 0

	function init(tnType, tnCategory, tcLexeme, tnLiteral, tnLine, tnCol)
		this.type = tnType
		this.category = tnCategory
		this.lexeme = tcLexeme
		this.literal = tnLiteral
		this.line = tnLine
		this.col = tnCol
	endfunc

	function toString
		return foxScriptTokenToStr(this.type) + "[" + alltrim(str(this.line)) + ":" + alltrim(str(this.col)) + "]<lexeme: '" + this.lexeme + "'>"
	endfunc
enddefine

* ================================================================================== *
* helper functions
* ================================================================================== *
function foxScriptTokenToStr(tnTokenType)
	do case
	case tnTokenType == TT_EOF
		return "TT_EOF"
	case tnTokenType == TT_IGNORE
		return "TT_IGNORE"
	case tnTokenType == TT_SEMICOLON
		return "TT_SEMICOLON"
	case tnTokenType == TT_RELATIONAL_OPERATOR
		return "TT_RELATIONAL_OPERATOR"
	case tnTokenType == TT_EQUALITY_OPERATOR
		return "TT_EQUALITY_OPERATOR"
	case tnTokenType == TT_EQUALITY_OPERATOR
		return "TT_EQUALITY_OPERATOR"
	case tnTokenType == TT_SIMPLE_ASSIGN
		return "TT_SIMPLE_ASSIGN"
	case tnTokenType == TT_COMPLEX_ASSIGN
		return "TT_COMPLEX_ASSIGN"
	case tnTokenType == TT_NUMBER
		return "TT_NUMBER"
	case tnTokenType == TT_STRING
		return "TT_STRING"
	case tnTokenType == TT_RGB
		return "TT_RGB"
	case tnTokenType == TT_IDENTIFIER
		return "TT_IDENTIFIER"
	case tnTokenType == TT_LPAREN
		return "TT_LPAREN"
	case tnTokenType == TT_RPAREN
		return "TT_RPAREN"
	case tnTokenType == TT_LBRACKET
		return "TT_LBRACKET"
	case tnTokenType == TT_RBRACKET
		return "TT_RBRACKET"
	case tnTokenType == TT_LBRACE
		return "TT_LBRACE"
	case tnTokenType == TT_RBRACE
		return "TT_RBRACE"
	case tnTokenType == TT_DOT
		return "TT_DOT"
	case tnTokenType == TT_COMMA
		return "TT_COMMA"
	case tnTokenType == TT_COLON
		return "TT_COLON"
	case tnTokenType == TT_LOGICAL_AND
		return "TT_LOGICAL_AND"
	case tnTokenType == TT_LOGICAL_OR
		return "TT_LOGICAL_OR"
	case tnTokenType == TT_LOGICAL_NOT
		return "TT_LOGICAL_NOT"
	case tnTokenType == TT_TERM_OPERATOR
		return "TT_TERM_OPERATOR"
	case tnTokenType == TT_FACTOR_OPERATOR
		return "TT_FACTOR_OPERATOR"
	case tnTokenType == TT_DO
		return "TT_DO"
	case tnTokenType == TT_FALSE
		return "TT_FALSE"
	case tnTokenType == TT_BREAK
		return "TT_BREAK"
	case tnTokenType == TT_CONTINUE
		return "TT_CONTINUE"
	case tnTokenType == TT_ELSE
		return "TT_ELSE"
	case tnTokenType == TT_VAR
		return "TT_VAR"
	case tnTokenType == TT_FOR
		return "TT_FOR"
	case tnTokenType == TT_IN
		return "TT_IN"
	case tnTokenType == TT_OF
		return "TT_OF"
	case tnTokenType == TT_NULL
		return "TT_NULL"
	case tnTokenType == TT_RETURN
		return "TT_RETURN"
	case tnTokenType == TT_FUNCTION
		return "TT_FUNCTION"
	case tnTokenType == TT_WHILE
		return "TT_WHILE"
	case tnTokenType == TT_IF
		return "TT_IF"
	case tnTokenType == TT_TRUE
		return "TT_TRUE"
	case tnTokenType == TT_WINDOW
		return "TT_WINDOW"
	case tnTokenType == TT_ARROW
		return "TT_ARROW"
	otherwise
		return "UNKNOWN"
	endcase
endfunc

* ================================================================================== *
* The Parser Class
* ================================================================================== *
define class Parser as custom
	hidden oTokens
	hidden nCurrent
	hidden previous
	hidden peek
	hidden isAtEnd

	function init(toTokens)
		this.oTokens = toTokens
		this.nCurrent = 1 && First recognised token
	endfunc

	function parse
		local loStatements
		loStatements = createobject('Collection')

		do while !this.isAtEnd
			loStatements.add(this.declaration())
		enddo

		return loStatements
	endfunc

	hidden function declaration
		local loDeclaration, lSeguir
		loDeclaration = .null.
		lSeguir = TRUE
		try
			if lSeguir and this.match(TT_VAR)
				lSeguir = false
				loDeclaration = this.varDeclaration()
			endif
			if lSeguir
				loDeclaration = this.statement()
			endif
		catch to loEx
			if type('loEx.Type') == 'C'
				this.synchronize()
			else
				if RUNTIME_DEBUG
					* DEBUG
					local lcMsg
					lcMsg = "ERROR NRO: " + alltrim(str(loEx.errorno))
					lcMsg = lcMsg + chr(13) + "LINEA: "  	+ alltrim(str(loEx.lineno))
					lcMsg = lcMsg + chr(13) + "MESSAGE: "  	+ alltrim(loEx.message)
					lcMsg = lcMsg + chr(13) + "LUGAR: "  	+ alltrim(loEx.procedure)
					messagebox(lcMsg, 16)
					* DEBUG
				endif
			endif
		endtry
		return loDeclaration
	endfunc

	hidden function statement
		if this.match(TT_FOR)
			return this.forStatement()
		endif
		if this.match(TT_IF)
			return this.ifStatement()
		endif
		if this.match(TT_RETURN)
			return this.returnStatement()
		endif
		if this.match(TT_WHILE)
			return this.whileStatement()
		endif
		if this.check(TT_LBRACE)
			local lnType1, lnType2, lSeguir
			lnType1 = this.peekNext(1)
			lnType2 = this.peekNext(2)
			lSeguir = TRUE
			if inlist(lnType1, TT_IDENTIFIER, TT_STRING) and lnType2 == TT_COLON
				lSeguir = false
			endif
			if lSeguir
				this.advance() && '{'
				return createobject("Block", this.blockStatement())
			endif
		endif
		return this.expressionStatement()
	endfunc

	hidden function forStatement
		local loKeyword, loVarDecl, loType, loCollection, loBody
		loKeyword = this.previous
		this.consume(TT_LPAREN, FS_EXPECTED_FOR_1)

		if this.check(TT_VAR)
			loVarDecl = this.varDeclaration()
		else
			local loName
			loName = this.consume(TT_IDENTIFIER, FS_EXPECT_VARIABLE_NAME)
			loVarDecl = createobject("Var", loName, .null.)
		endif

		if !this.match(TT_IN, TT_OF)
			this.parseError(this.peek, FS_EXPECTED_FOR_2)
		endif

		loType = this.previous
		loCollection = this.expression()

		this.consume(TT_RPAREN, FS_EXPECTED_FOR_3)

		this.consume(TT_LBRACE, FS_EXPECTED_FOR_4)
		loBody = this.blockStatement()

		return createobject("ForNode", loKeyword, loVarDecl, loType, loCollection, loBody)
	endfunc

	hidden function ifStatement
		local loCondition, loThenBranch, loElseBranch
		this.consume(TT_LPAREN, FS_EXPECTED_IF_1)
		loCondition = this.expression()
		this.consume(TT_RPAREN, FS_EXPECTED_IF_2)
		loThenBranch = this.statement()
		loElseBranch = .null.
		if this.match(TT_ELSE)
			loElseBranch = this.statement()
		endif

		return createobject("IfNode", loCondition, loThenBranch, loElseBranch)
	endfunc

	hidden function returnStatement
		local loKeyword, loValue
		loKeyword = this.previous
		loValue = .null.
		if !this.check(TT_SEMICOLON)
			loValue = this.expression()
		endif
		this.consume(TT_SEMICOLON, FS_EXPECTED_RETURN_1)
		return createobject("ReturnNode", loKeyword, loValue)
	endfunc

	hidden function varDeclaration
		local loName, loInitializer
		loName = this.consume(TT_IDENTIFIER, FS_EXPECT_VARIABLE_NAME)
		loInitializer = .null.
		if this.match(TT_SIMPLE_ASSIGN)
			loInitializer = this.expression()
		endif
		this.consume(TT_SEMICOLON, FS_EXPECTED_VAR_1)

		return createobject("Var", loName, loInitializer)
	endfunc

	hidden function whileStatement
		this.consume(TT_LPAREN, FS_EXPECTED_WHILE_1)
		local loCondition, loBody
		loCondition = this.expression()
		this.consume(TT_RPAREN, FS_EXPECTED_WHILE_2)
		loBody = this.statement()

		return createobject("WhileNode", loCondition, loBody)
	endfunc

	hidden function expressionStatement
		local loExpr
		loExpr = this.expression()
		this.consume(TT_SEMICOLON, FS_EXPECTED_EXP_1)
		return createobject("Expression", loExpr)
	endfunc

	hidden function blockStatement
		local loStatements
		loStatements = createobject('Collection')

		do while !this.check(TT_RBRACE) and !this.isAtEnd
			loStatements.add(this.declaration())
		enddo

		this.consume(TT_RBRACE, FS_EXPECTED_BLOCK_1)

		return loStatements
	endfunc

	* ==========================================================
	* Parsing Expression: public because of string interpolation
	function expression
		return this.assignment()
	endfunc

	hidden function assignment
		local loExpr
		loExpr = this.logicalOr()

		if this.match(TT_SIMPLE_ASSIGN)
			local loEquals, loValue
			loEquals = this.previous && catch the equal token
			loValue = this.assignment() && self recursive
			do case
			case loExpr.class == 'Variable' &&
				return createobject("Assign", loExpr.oName, loValue)
			case loExpr.class == 'Get'
				return createobject("Set", loExpr.oObject, loExpr.oName, loValue)
			otherwise
				this.parseError(loEquals, FS_EXPECTED_ASSIGN_1)
			endcase
		endif

		return loExpr
	endfunc

	hidden function logicalOr
		local loLeft
		loLeft = this.logicalAnd()
		do while this.match(TT_LOGICAL_OR)
			local loOpe, loRight
			loOpe   = this.previous
			loRight = this.logicalAnd()
			loLeft  = createobject("Logical", loLeft, loOpe, loRight)
		enddo
		return loLeft
	endfunc

	hidden function logicalAnd
		local loLeft
		loLeft = this.equality()
		do while this.match(TT_LOGICAL_AND)
			local loOpe, loRight
			loOpe   = this.previous
			loRight = this.equality()
			loLeft  = createobject("Logical", loLeft, loOpe, loRight)
		enddo
		return loLeft
	endfunc

	hidden function equality
		local loLeft
		loLeft = this.comparison()
		do while this.match(TT_EQUALITY_OPERATOR)
			local loOpe, loRight
			loOpe   = this.previous
			loRight = this.comparison()
			loLeft  = createobject("Binary", loLeft, loOpe, loRight)
		enddo
		return loLeft
	endfunc

	hidden function comparison
		local loLeft
		loLeft = this.term()
		do while this.match(TT_RELATIONAL_OPERATOR)
			local loOpe, loRight
			loOpe   = this.previous
			loRight = this.term()
			loLeft  = createobject("Binary", loLeft, loOpe, loRight)
		enddo
		return loLeft
	endfunc

	hidden function term
		local loLeft
		loLeft = this.factor()
		do while this.match(TT_TERM_OPERATOR)
			local loOpe, loRight
			loOpe   = this.previous
			loRight = this.factor()
			loLeft  = createobject("Binary", loLeft, loOpe, loRight)
		enddo
		return loLeft
	endfunc

	hidden function factor
		local loLeft
		loLeft = this.unary()
		do while this.match(TT_FACTOR_OPERATOR)
			local loOpe, loRight
			loOpe   = this.previous
			loRight = this.unary()
			loLeft  = createobject("Binary", loLeft, loOpe, loRight)
		enddo
		return loLeft
	endfunc

	hidden function unary
		if this.match(TT_TERM_OPERATOR, TT_LOGICAL_NOT)
			return createobject("Unary", this.previous, this.unary())
		endif
		return this.call()
	endfunc

	hidden function finishCall(toCallee)
		local loArguments, loParen
		loArguments = createobject('Collection')
		if !this.check(TT_RPAREN)
			loArguments.add(this.expression())
			do while this.match(TT_COMMA)
				loArguments.add(this.expression())
			enddo
		endif
		loParen = this.consume(TT_RPAREN, FS_EXPECTED_CALL_1)
		return createobject("Call", toCallee, loParen, loArguments)
	endfunc

	hidden function call
		local loExpr, loName, loBlock
		loExpr = this.primary()

		do while TRUE
			do case
			case this.match(TT_LPAREN)
				loExpr = this.finishCall(loExpr)
			case this.match(TT_DOT)
				loName = this.consume(TT_IDENTIFIER, FS_EXPECTED_CALL_2)
				loExpr = createobject("Get", loExpr, loName)
			case this.match(TT_LBRACKET)
				loName = this.expression() && Index expression
				this.consume(TT_RBRACKET, FS_EXPECTED_CALL_3)
				loExpr = createobject("Get", loExpr, loName, .t.)
			case this.match(TT_ARROW)
				local loKeyword
				loKeyword = this.previous
				* check parameters type (all types must be variables)
				for each loParam in loExpr.oExpressions
					if loParam.class != 'Variable'
						this.parseError(loKeyword, FS_EXPECTED_CALL_4)
					endif
				endfor
				* Parse Body
				this.consume(TT_LBRACE, FS_EXPECTED_CALL_5)
				loBody = this.blockStatement()
				loExpr = createobject("FunctionArrow", loKeyword, loExpr.oExpressions, loBody)
			otherwise
				exit
			endcase
		enddo
		return loExpr
	endfunc

	hidden function primary
		do case
		case this.match(TT_FALSE)
			return createobject("Literal", this.previous)
		case this.match(TT_TRUE)
			return createobject("Literal", this.previous)
		case this.match(TT_NULL)
			return createobject("Literal", this.previous)
		case this.match(TT_NUMBER, TT_STRING, TT_RGB)
			return createobject("Literal", this.previous)
		case this.match(TT_STRING_MERGE)
			return this.parseStringMerge()
		case this.match(TT_IDENTIFIER)
			return createobject("Variable", this.previous)
		case this.match(TT_LPAREN)
			local loExpressions
			loExpressions = createobject('Collection')
			if !this.check(TT_RPAREN)
				loExpressions.add(this.expression())
				do while this.match(TT_COMMA)
					loExpressions.add(this.expression())
				enddo
			endif
			this.consume(TT_RPAREN, FS_EXPECTED_PRIMARY_1)
			return createobject("Grouping", loExpressions)
		case this.match(TT_LBRACKET)
			return this.parseArrayLiteral()
		case this.match(TT_LBRACE)
			return this.parseObject()
		case this.match(TT_FUNCTION)
			return this.parseFunctionExpr()
		case this.match(TT_WINDOW)
			return createobject("Window", this.previous)
		otherwise
			this.parseError(this.peek, FS_EXPECTED_PRIMARY_2)
		endcase
	endfunc

	hidden function parseStringMerge
		local i, lcExpression, lcLiteral, loToken, loCollection, loScanner, loTokens, loParser
		lcLiteral = this.previous.literal
		loToken = this.previous
		loCollection = createobject('Collection')

		i = 0
		do while true
			i = i + 1
			lcExpression = strextract(lcLiteral, '${', '}', i)
			if empty(lcExpression)
				exit
			endif
			loScanner = createobject("Scanner", lcExpression)
			loTokens = loScanner.scanTokens()
			loParser = createobject("Parser", loTokens)
			loCollection.add(loParser.expression())
			lcLiteral = strtran(lcLiteral, '${' + lcExpression + '}', '${' + alltrim(str(i)) + '}')
		enddo
		loToken.literal = lcLiteral
		return createobject("Literal", loToken, loCollection)
	endfunc

	hidden function parseArrayLiteral
		local loKeyword, loElements
		loKeyword = this.previous && token '['
		loElements = createobject('Dictionary')
		if !this.check(TT_RBRACKET)
			loElements.add(this.expression())
			do while this.match(TT_COMMA)
				loElements.add(this.expression())
			enddo
		endif
		this.consume(TT_RBRACKET, FS_EXPECTED_ARRAY_1)

		return createobject("ArrayLiteral", loKeyword, loElements)
	endfunc

	hidden function parseObject
		local loKeyword, loElements, loProperty, loValue
		loKeyword = this.previous && token '{'
		loElements = createobject('Dictionary')
		if !this.check(TT_RBRACE)
			loProperty = this.expression()
			if !this.checkProperty(loProperty)
				this.parseError(loKeyword, FS_EXPECTED_OBJECT_1)
			endif
			this.consume(TT_COLON, FS_EXPECTED_OBJECT_1)
			loValue = this.expression()
			loElements.add(loValue, this.getPropertyName(loProperty))

			do while this.match(TT_COMMA)
				loProperty = this.expression()
				if !this.checkProperty(loProperty)
					this.parseError(loKeyword, FS_EXPECTED_OBJECT_2)
				endif
				this.consume(TT_COLON, FS_EXPECTED_OBJECT_1)
				loValue = this.expression()
				loElements.add(loValue, this.getPropertyName(loProperty))
			enddo
		endif
		this.consume(TT_RBRACE, FS_EXPECTED_OBJECT_3)

		return createobject("ObjectLiteral", loKeyword, loElements)
	endfunc

	hidden function parseFunctionExpr
		local loParams, loBody
		this.consume(TT_LPAREN, FS_EXPECTED_FUNC_1)

		loParams = createobject('Collection')
		if !this.check(TT_RPAREN)
			loParams.add(this.consume(TT_IDENTIFIER, FS_EXPECTED_FUNC_2))
			do while this.match(TT_COMMA)
				loParams.add(this.consume(TT_IDENTIFIER, FS_EXPECTED_FUNC_2))
			enddo
		endif
		this.consume(TT_RPAREN, FS_EXPECTED_FUNC_3)
		* Parse Body
		this.consume(TT_LBRACE, FS_EXPECTED_FUNC_4)
		loBody = this.blockStatement()

		return createobject("FunctionExpr", loParams, loBody)
	endfunc

	hidden function checkProperty(toProperty)
		if toProperty.class = 'Literal'
			return type('toProperty.oValue') == 'C'
		endif
		return toProperty.class = 'Variable'
	endfunc

	hidden function getPropertyName(toProperty)
		if toProperty.class = 'Literal'
			return toProperty.oValue
		endif
		return toProperty.oName.lexeme
	endfunc
	* ==========================================================

	hidden function match(tnType1, tnType2, tnType3, tnType4)
		if this.check(tnType1)
			this.advance()
			return TRUE
		endif
		if !empty(tnType2) and this.check(tnType2)
			this.advance()
			return TRUE
		endif
		if !empty(tnType3) and this.check(tnType3)
			this.advance()
			return TRUE
		endif
		if !empty(tnType4) and this.check(tnType4)
			this.advance()
			return TRUE
		endif

		return FALSE
	endfunc

	hidden function consume(tnType, tcErrorMsg)
		if this.check(tnType)
			return this.advance()
		endif
		this.parseError(this.peek, tcErrorMsg)
	endfunc

	hidden function check(tnType)
		if this.isAtEnd
			return false
		endif
		return this.peek.type == tnType
	endfunc

	hidden function advance
		if !this.isAtEnd
			this.nCurrent = this.nCurrent + 1
		endif
		return this.previous
	endfunc

	hidden function isAtEnd_access
		return this.peek.type == TT_EOF
	endfunc

	hidden function peek_access
		return this.oTokens.item(this.nCurrent)
	endfunc

	hidden function peekNext(tnOffset)
		if (this.nCurrent + tnOffset) < this.oTokens.count
			return this.oTokens.item(this.nCurrent+tnOffset).type
		endif
		return TT_EOF
	endfunc

	hidden function previous_access
		return this.oTokens.item(this.nCurrent-1)
	endfunc

	hidden procedure parseError(toToken, tcErrorMessage)
		_screen.FoxScript.errorToken(toToken, tcErrorMessage)
		_screen.FoxScript.throwError('ParseError', 'token', toToken, tcErrorMessage)
	endproc

	hidden function synchronize
		this.advance()
		do while !this.isAtEnd
			if this.previous.type == TT_SEMICOLON
				return
			endif
			if inlist(this.peek.type, ;
					TT_FUNCTION, ;
					TT_VAR, ;
					TT_FOR, ;
					TT_IF, ;
					TT_WHILE, ;
					TT_RETURN)
				return
			endif
			this.advance()
		enddo
	endfunc
enddefine

* ================================================================================== *
* Interpreter Class
* ================================================================================== *
define class Interpreter as custom
	oGlobals = .null.
	oEnvironment = .null.
	debugMode = .t.

	function init
		with this
			.oGlobals = createobject("Environment", .null.)
			.oGlobals.define("clock", createobject("BuiltinClock"))
			.oGlobals.define("display", createobject("BuiltinDisplay"))
			.oGlobals.define("native", createobject("BuiltinNative"))
			.oGlobals.define("info", createobject("BuiltinInfo"))
			.oGlobals.define("error", createobject("BuiltinError"))
			.oGlobals.define("warning", createobject("BuiltinWarning"))
			.oGlobals.define("confirm", createobject("BuiltinConfirm"))
			.oGlobals.define("newForm", createobject("BuiltinNewForm"))

			* Bind the main window (current form or _screen)
			if type('_screen.ActiveForm') == 'O'
				.oGlobals.define("_window", createobject("ControlBase", '_screen.activeform'))
			else
				.oGlobals.define("_window", createobject("ControlBase", '_screen'))
			endif

			.oEnvironment = this.oGlobals
		endwith
	endfunc

	function interpret(toStatements)
		local loResult, llContinue
		llContinue = .t.
		for each loStatement in toStatements
			try
				loResult = this.Execute(loStatement)
			catch to loEx
				if type('loEx.Type') == 'C' and loEx.type == 'ReturnException'
					loResult = loEx.value
					llContinue = .f.
				else
					* DEBUG
					if RUNTIME_DEBUG
						local lcMsg
						lcMsg = "ERROR NRO: " + alltrim(str(loEx.errorno))
						lcMsg = lcMsg + chr(13) + "LINEA: "  	+ alltrim(str(loEx.lineno))
						lcMsg = lcMsg + chr(13) + "MESSAGE: "  	+ alltrim(loEx.message)
						lcMsg = lcMsg + chr(13) + "LUGAR: "  	+ alltrim(loEx.procedure)
						messagebox(lcMsg, 16)
					else
						local lcMessage
						lcMessage = _screen.FoxScript.formatError("Runtime", loEx.Token.line, loEx.Token.col, loEx.Token.lexeme, loEx.message)
						lcMessage = lcMessage + CRLF + CRLF + FS_INTERPRETER_1
						llContinue = messagebox(lcMessage,4+16, FS_RUNTIME_ERROR_TITLE) == 6
					endif
					* DEBUG
				endif
			endtry
			if !llContinue
				exit
			endif
		endfor
		return loResult
	endfunc

	function evaluate(toExpr)
		return toExpr.accept(this)
	endfunc

	function Execute(toStmt)
		return toStmt.accept(this)
	endfunc

	function executeBlock(toStatements, toEnvironment)
		local loPrevious, loResult
		loPrevious = this.oEnvironment
		try
			local llContinue
			this.oEnvironment = toEnvironment
			llContinue = .t.
			for each loStatement in toStatements
				try
					loResult = this.Execute(loStatement)
				catch to loEx
					if type('loEx.Type') == 'C' and loEx.type == 'ReturnException'
						llContinue = .f.
						throw
					else
						local lcMessage
						lcMessage = _screen.FoxScript.formatError("Runtime", loEx.Token.line, loEx.Token.col, loEx.Token.lexeme, loEx.message)
						lcMessage = lcMessage + CRLF + CRLF + FS_INTERPRETER_1
						llContinue = messagebox(lcMessage,4+16, FS_RUNTIME_ERROR_TITLE) == 6
					endif
				endtry
				if !llContinue
					exit
				endif
			endfor
		finally
			this.oEnvironment = loPrevious
		endtry
		return loResult
	endfunc

	function visitArrayLiteralExpr(toExpr)
		local loArray
		loArray = createobject('Dictionary')
		loArray.tag = 'Array'
		for each loElement in toExpr.oElements
			loArray.add(this.evaluate(loElement))
		endfor

		return loArray
	endfunc

	function visitBlockStmt(toStmt)
		this.executeBlock(toStmt.oStatements, createobject("Environment", this.oEnvironment))
		return .null.
	endfunc

	function visitExpressionStmt(toStmt)
		return this.evaluate(toStmt.oExpression)
	endfunc

	function visitIfNodeStmt(toStmt)
		if this.isTruthy(this.evaluate(toStmt.oCondition))
			this.Execute(toStmt.oThenBranch)
		else
			if !isnull(toStmt.oElseBranch)
				this.Execute(toStmt.oElseBranch)
			endif
		endif
		return .null.
	endfunc

	function visitObjectLiteralExpr(toExpr)
		local loMap
		loMap = createobject('Dictionary')
		loMap.tag = 'Map'
		local i, lcKey, loValue
		for i=1 to toExpr.oElements.count
			lcKey = toExpr.oElements.getkey(i)
			loValue = this.evaluate(toExpr.oElements.item(i))
			loMap.put(lcKey, loValue)
		endfor

		return loMap
	endfunc

	function visitReturnNodeStmt(toStmt)
		local loValue, oExp
		if !isnull(toStmt.oValue)
			loValue = this.evaluate(toStmt.oValue)
		endif
		_screen.FoxScript.throwError('ReturnException', 'value', loValue, "")
	endfunc

	function visitVarStmt(toStmt)
		local loValue
		if !isnull(toStmt.oInitializer)
			loValue = this.evaluate(toStmt.oInitializer)
		endif
		this.oEnvironment.define(toStmt.oName.lexeme, loValue)
		return loValue
	endfunc

	function visitWhileNodeStmt(toStmt)
		do while this.isTruthy(this.evaluate(toStmt.oCondition))
			this.Execute(toStmt.oBody)
		enddo
		return .null.
	endfunc

	function visitForNodeStmt(toStmt)
		local loEnvironment, loCollection
		loEnvironment = createobject("Environment", this.oEnvironment)
		loEnvironment.define(toStmt.oVarDecl.oName.lexeme, .null.)
		loCollection = this.evaluate(toStmt.oCollection)

		if toStmt.oType.lexeme == 'in' && extract indexes or keys. (allowed types: array, string, map)
			if (type('loCollection') == 'O' and !inlist(loCollection.tag, 'Array', 'Map')) or (type('loCollection') != 'O' and type('loCollection') != 'C')
				this.runtimeError(toStmt.oKeyword, FS_INTERPRETER_2)
			endif
			local i
			do case
			case type('loCollection') == 'O' and loCollection.tag == 'Array'
				for i = 1 to loCollection.count
					loEnvironment.assign(toStmt.oVarDecl.oName, i)
					this.executeBlock(toStmt.oBody, loEnvironment)
				endfor
			case type('loCollection') == 'O' and loCollection.tag == 'Map'
				for i = 1 to loCollection.count
					loEnvironment.assign(toStmt.oVarDecl.oName, loCollection.getkey(i))
					this.executeBlock(toStmt.oBody, loEnvironment)
				endfor
			otherwise
				for i = 1 to len(loCollection)
					loEnvironment.assign(toStmt.oVarDecl.oName, i)
					this.executeBlock(toStmt.oBody, loEnvironment)
				endfor
			endcase
		else && of keyword: extract values from (array, string)
			if (type('loCollection') == 'O' and loCollection.tag != 'Array') or (type('loCollection') != 'O' and type('loCollection') != 'C')
				this.runtimeError(toStmt.oKeyword, FS_INTERPRETER_3)
			endif
			local loValue
			if type('loCollection') == 'O' and loCollection.tag == 'Array'
				for each loValue in loCollection
					loEnvironment.assign(toStmt.oVarDecl.oName, loValue)
					this.executeBlock(toStmt.oBody, loEnvironment)
				endfor
			else
				for loValue = 1 to len(loCollection)
					loEnvironment.assign(toStmt.oVarDecl.oName, substr(loCollection, loValue, 1))
					this.executeBlock(toStmt.oBody, loEnvironment)
				endfor
			endif
		endif

		return .null.
	endfunc

	function visitAssignExpr(toExpr)
		local loValue, lnDistance
		loValue = this.evaluate(toExpr.oValue)
		this.oEnvironment.assign(toExpr.oName, loValue)

		return loValue
	endfunc

	function visitBinaryExpr(toExpr)
		local loLeft, loRight
		loLeft = this.evaluate(toExpr.oLeft)
		loRight = this.evaluate(toExpr.oRight)

		do case
		case toExpr.oOperator.category == TC_NOT_EQ
			return !this.isEqual(loLeft, loRight)
		case toExpr.oOperator.category == TC_EQUAL
			return this.isEqual(loLeft, loRight)
		case toExpr.oOperator.category == TC_GREATER
			this.checkNumberOperands(toExpr.oOperator, loLeft, loRight)
			return loLeft > loRight
		case toExpr.oOperator.category == TC_GREATER_EQ
			this.checkNumberOperands(toExpr.oOperator, loLeft, loRight)
			return loLeft >= loRight
		case toExpr.oOperator.category == TC_LESS
			this.checkNumberOperands(toExpr.oOperator, loLeft, loRight)
			return loLeft < loRight
		case toExpr.oOperator.category == TC_LESS_EQ
			this.checkNumberOperands(toExpr.oOperator, loLeft, loRight)
			return loLeft <= loRight
		case toExpr.oOperator.category == TC_MINUS
			this.checkNumberOperands(toExpr.oOperator, loLeft, loRight)
			return loLeft - loRight
		case toExpr.oOperator.category == TC_PLUS
			if type('loLeft') == type('loRight')
				return loLeft + loRight
			endif
			this.runtimeError(toExpr.oOperator, FS_INTERPRETER_4)
		case toExpr.oOperator.category == TC_DIV
			this.checkNumberOperands(toExpr.oOperator, loLeft, loRight)
			return loLeft / loRight
		case toExpr.oOperator.category == TC_MUL
			this.checkNumberOperands(toExpr.oOperator, loLeft, loRight)
			return loLeft * loRight
		endcase
		return .null.
	endfunc

	function visitCallExpr(toExpr)
		local loFunction, loArguments, loArgument, loMethodName
		loFunction = this.evaluate(toExpr.oCallee)
		* Save the linked method
		if loFunction.class == 'Controlbase' or loFunction.parentclass == 'Controlbase'
			loMethodName = loFunction.oMethodName
		endif

		* Evaluate arguments
		loArguments = createobject('Collection')
		for each loArgument in toExpr.oArguments
			loArguments.add(this.evaluate(loArgument))
		endfor

		* Restore the linked method
		if loFunction.class == 'Controlbase' or loFunction.parentclass == 'Controlbase'
			loFunction.oMethodName = loMethodName
		endif

		* Check for Callable objects allowed
		if type('loFunction') != 'O' or !inlist(loFunction.parentclass, 'Controlbase', 'Callable')
			this.runtimeError(toExpr.oParen, FS_INTERPRETER_5)
		endif

		if loFunction.lValidateArity and loArguments.count != loFunction.arity()
			this.runtimeError(toExpr.oParen, ;
				FS_INTERPRETER_6 + alltrim(str(loFunction.arity())) + FS_INTERPRETER_7 + alltrim(str(loArguments.count)) + ".")
		endif
		loFunction.oParen = toExpr.oParen
		if loFunction.class == 'Controlbase' or loFunction.parentclass == 'Controlbase'
			return loFunction.runSelectedMethod(loArguments)
		endif
		return loFunction.call(this, loArguments)
	endfunc

	function visitWindowExpr(toExpr)
		return this.oGlobals.lookup(toExpr.oKeyword)
	endfunc

	function visitGetExpr(toExpr)
		local loObject
		* We evaluate the owner object first.
		loObject = this.evaluate(toExpr.oObject)

		if toExpr.lComputed && it's an array or dictionary (access member type)
			local lnIndex
			lnIndex = this.evaluate(toExpr.oName)

			if loObject.tag == 'Array' and type('lnIndex') != 'N' && Array index must be resolved to an integer.
				_screen.FoxScript.throwError('RuntimeError', 'token', toExpr.oName, FS_INTERPRETER_8)
			endif
			if loObject.tag == 'Array'
				return loObject.item(lnIndex)
			else
				local lnPosition
				lnPosition = loObject.getkey(lnIndex)
				if !empty(lnPosition)
					return loObject.item(lnPosition)
				endif
				return .null.
			endif
		endif
		* Validate the owner must be an object.
		if type('loObject') != 'O'
			_screen.FoxScript.throwError('RuntimeError', 'token', toExpr.oName, FS_INTERPRETER_9)
		endif
		* Check for ControlBase class and return the reference.
		if loObject.class == 'Controlbase' or loObject.parentclass == 'Controlbase'
			* Notify this object the method to call.
			loObject.oMethodName = toExpr.oName
			return loObject
		endif
		return loObject
	endfunc

	function visitFunctionArrowExpr(toExpr)
		local loFunction
		loFunction = createobject("RuntimeFunction", toExpr, this.oEnvironment)
		if type('loFunction') != 'O' or loFunction.parentclass != 'Callable'
			this.runtimeError(toExpr.oParen, FS_INTERPRETER_5)
		endif
		return loFunction
	endfunc

	function visitFunctionExpr(toExpr)
		return createobject("RuntimeFunction", toExpr, this.oEnvironment)
	endfunc

	function visitGroupingExpr(toExpr)
		local loResult
		loResult = createobject('Collection')
		loResult.tag = 'Grouping'
		for each loExpr in toExpr.oExpressions
			loResult.add(this.evaluate(loExpr))
		endfor
		return loResult
	endfunc

	function visitLiteralExpr(toExpr)
		if toExpr.oToken.type == TT_STRING_MERGE
			local lcValue, loExpr, i, lcOutput
			i = 1
			lcOutput = toExpr.oToken.literal
			for each loExpr in toExpr.oCollection
				lcValue = stringify(this.evaluate(loExpr))
				lcOutput = strtran(lcOutput, '${' + alltrim(str(i)) + '}', lcValue)
				i = i + 1
			endfor
			return lcOutput
		endif
		return toExpr.oToken.literal
	endfunc

	function visitLogicalExpr(toExpr)
		local loLeft
		loLeft = this.evaluate(toExpr.oLeft)
		if toExpr.oOperator.type == TT_OR
			if this.isTruthy(loLeft)
				return loLeft
			endif
		else
			if !this.isTruthy(loLeft)
				return loLeft
			endif
		endif
		return this.evaluate(toExpr.oRight)
	endfunc

	function visitSetExpr(toExpr)
		local loObject, loValue
		loObject = this.evaluate(toExpr.oObject)
		if type('loObject') != 'O' or (loObject.class != 'Runtimeinstance' and loObject.parentclass != 'Runtimeinstance')
			this.runtimeError(toExpr.oName, FS_INTERPRETER_11)
		endif

		loValue = this.evaluate(toExpr.oValue)
		loObject.set(toExpr.oName, loValue)

		return loValue
	endfunc

	function visitUnaryExpr(toExpr)
		local loRight
		loRight = this.evaluate(toExpr.oRight)
		do case
		case toExpr.oOperator.category == TC_BANG
			return !this.isTruthy(loRight)
		case toExpr.oOperator.category == TT_MINUS
			this.checkNumberOperand(toExpr.oOperator, loRight)
			return -loRight
		case toExpr.oOperator.category == TT_PLUS
			return loRight
		endcase

		return .null.
	endfunc

	function visitVariableExpr(toExpr)
		return this.oEnvironment.lookup(toExpr.oName)
	endfunc

	function checkNumberOperand(toOperator, toOperand)
		if type('toOperand') == 'N'
			return
		endif
		this.runtimeError(toOperator, FS_INTERPRETER_12)
	endfunc

	function checkNumberOperands(toOperator, toLeft, toRight)
		if type('toLeft') == 'N' and type('toRight') == 'N'
			return
		endif
		this.runtimeError(toOperator, FS_INTERPRETER_13)
	endfunc

	function isTruthy(toObject)
		if isnull(toObject)
			return false
		endif
		if type('toObject') == 'L'
			return toObject
		endif
		return TRUE
	endfunc

	function isEqual(toA, toB)
		if isnull(toA) and isnull(toB)
			return TRUE
		endif
		if isnull(toA) or isnull(toB)
			return false
		endif
		return toA == toB
	endfunc

	hidden procedure runtimeError(toToken, tcErrorMessage)
		_screen.FoxScript.throwError('RuntimeError', 'token', toToken, tcErrorMessage)
	endproc

enddefine

* ================================================================================== *
* Environment Class
* ================================================================================== *
define class environment as custom
	oEnclosing = .null.
	oRecord = .null.

	function init(toEnclosing)
		this.oEnclosing = .null.
		if !isnull(toEnclosing)
			this.oEnclosing = toEnclosing
		endif
		this.oRecord = createobject('Dictionary')
	endfunc

	function define(tcName, toValue)
		this.oRecord.put(tcName, toValue)
		return toValue
	endfunc

	function lookup(toName)
		local loEnvironment
		loEnvironment = this.resolve(toName)
		return loEnvironment.oRecord.get(toName.lexeme)
	endfunc

	function assign(toName, toValue)
		local loEnvironment
		loEnvironment = this.resolve(toName)
		loEnvironment.oRecord.put(toName.lexeme, toValue)
		return toValue
	endfunc

	function resolve(toName)
		if this.oRecord.ContainsKey(toName.lexeme)
			return this
		endif

		if !isnull(this.oEnclosing)
			return this.oEnclosing.resolve(toName)
		endif
		_screen.FoxScript.throwError('RuntimeError', 'token', toName, FS_INTERPRETER_14 + "'" + toName.lexeme + "'.")
	endfunc

	function toString
		local lcResult
		lcResult = this.oRecord.toString()
		if !isnull(this.oEnclosing)
			lcResult = lcResult + " -> " + this.oEnclosing.toString()
		endif

		return lcResult
	endfunc

enddefine

* ================================================================================== *
* RuntimeFunction class
* ================================================================================== *
define class RuntimeFunction as Callable
	oDeclaration = .null.
	oClosure = .null.

	function init(toDeclaration, toClosure)
		this.oDeclaration = toDeclaration
		this.oClosure = toClosure
	endfunc

	function arity
		return this.oDeclaration.oParams.count
	endfunc

	function call(toInterpreter, toArguments)
		local loEnvironment, i, loResult
		loEnvironment = createobject("Environment", this.oClosure)
		loResult = .null.
		* Zip parameter name with argument values.
		for i = 1 to this.oDeclaration.oParams.count
			loEnvironment.define(this.oDeclaration.oParams.item(i).lexeme, toArguments.item(i))
		endfor

		try
			toInterpreter.executeBlock(this.oDeclaration.oBody, loEnvironment)
		catch to loEx
			* policia
			if type('loEx.Type') == 'C' and loEx.type == 'ReturnException'
				loResult = loEx.value
			else
				* DEBUG
				if RUNTIME_DEBUG
					local lcMsg
					lcMsg = "ERROR NRO: " + alltrim(str(loEx.errorno))
					lcMsg = lcMsg + chr(13) + "LINEA: "  	+ alltrim(str(loEx.lineno))
					lcMsg = lcMsg + chr(13) + "MESSAGE: "  	+ alltrim(loEx.message)
					lcMsg = lcMsg + chr(13) + "LUGAR: "  	+ alltrim(loEx.procedure)
					messagebox(lcMsg, 16)
				else
					_screen.FoxScript.runtimeError(loEx)
				endif
				* DEBUG
			endif
		endtry

		return loResult
	endfunc

	function toString
		return 'function'
	endfunc

enddefine
* ================================================================================== *
* Cursor Class
* ================================================================================== *
define class CursorBase as ControlBase
	cLinkedCursor = ''
	nDatasessionID = 0

	function init(tcLinkedCursor, tnDatasessionID)
		this.cLinkedCursor = tcLinkedCursor
		this.nDatasessionID = tnDatasessionID
	endfunc

	function browse(toArguments)
		set datasession to (this.nDatasessionID)
		select (this.cLinkedCursor)
		browse
	endfunc
enddefine

* ================================================================================== *
* ControlBase class
* ================================================================================== *
define class ControlBase as Callable
	cControl = ''
	oMethodName = .null.

	function init(tcControl)
		this.lValidateArity = FALSE
		this.cControl = tcControl
	endfunc

	function arity
		return 0
	endfunc
	* ================================================================================== *
	* addControl: adds a control in the owner object environment.
	* ================================================================================== *
	hidden function newControl(toArguments)
		this.checkArity(2, toArguments.count)
		if type('toArguments.Item(1)') != 'C' or type('toArguments.Item(2)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_15)
		endif

		try
			local lcMacro, loResult
			lcMacro = this.cControl + '.AddObject("' + toArguments.item(1) + '", "' + toArguments.item(2) + '")'
			&lcMacro
			loResult = createobject("ControlBase", this.cControl + '.' + toArguments.item(1))
		catch to loEx
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, loEx.message)
		endtry

		return loResult
	endfunc
	* ================================================================================== *
	* newEvent: adds an event to the owner object.
	* ================================================================================== *
	hidden function newEvent(toArguments)

		this.checkArity(2, toArguments.count)

		* Validate event name.
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_16)
		endif

		* Check for Callable objects allowed
		if type('toArguments.Item(2)') != 'O' or !inlist(toArguments.item(2).parentclass, 'Callable')
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_17)
		endif

		try
			local lcMacro, loResult
			loResult = .null.
			lcMacro = 'BINDEVENT(' + this.cControl + ', "' + toArguments.item(1) + '",_screen.FoxScript, "eventManager")'
			&lcMacro
			loResult = evaluate(this.cControl)

			* Bind the callback to the control.
			if type(this.cControl + '.__foxScriptEvent') == 'U'
				=addproperty(loResult, '__foxScriptEvent', .null.)
			endif
			loResult.__foxScriptEvent = toArguments.item(2)
		catch to loEx
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, loEx.message)
		endtry

		return loResult
	endfunc

	* ================================================================================== *
	* getControlByName: get a control by using it's name as reference.
	* ================================================================================== *
	hidden function getControlByName(toArguments)

		local lcControlName
		this.checkArity(1, toArguments.count)
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_18)
		endif
		lcControlName = toArguments.item(1)
		if type(this.cControl + '.' + lcControlName) == 'O'
			return createobject("ControlBase", this.cControl + '.' + toArguments.item(1))
		endif

		return .null.
	endfunc

	* ================================================================================== *
	* getControlByPath: get a control by using the absolute hierarchy.
	* NOTE: do not specify the owner object's name in the path.
	* ================================================================================== *
	hidden function getControlByPath(toArguments)
		local loResult, lcPath
		loResult = .null.
		this.checkArity(1, toArguments.count)
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_19)
		endif
		lcPath = toArguments.item(1)
		if type(this.cControl + '.' + lcPath) == 'O'
			return createobject("ControlBase", this.cControl + '.' + lcPath)
		endif
		return loResult
	endfunc

	* ================================================================================== *
	* getControlByClass: get a control by using it's class name as reference.
	* ================================================================================== *
	hidden function getControlByClass(toArguments)
		local loResult, lcClassName
		this.checkArity(1, toArguments.count)
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_20)
		endif
		lcClassName = toArguments.item(1)
		loResult = createobject('Dictionary')
		loResult.tag = 'Array'
		try
			local loParent
			loParent = evaluate(this.cControl)
			do case
			case inlist(loParent.baseclass, 'Container', 'Column', 'Form')
				for each loControl in loParent.controls
					if lcClassName == '*' or lower(loControl.class) == lower(lcClassName)
						loResult.add(createobject("ControlBase", this.cControl + '.' + loControl.name))
					endif
				endfor
			case loParent.baseclass == 'Grid'
				for each loControl in loParent.columns
					if lcClassName == '*' or lower(loControl.class) == lower(lcClassName)
						loResult.add(createobject("ControlBase", this.cControl + '.' + loControl.name))
					endif
				endfor
			endcase
		catch
			loResult = .null.
		endtry

		return loResult
	endfunc
	* ================================================================================== *
	* delControlByName: delete a control by using it's name as reference.
	* ================================================================================== *
	hidden function delControlByName(toArguments)
		local lcControlName
		this.checkArity(1, toArguments.count)
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_21)
		endif
		lcControlName = toArguments.item(1)
		if type(this.cControl + '.' + lcControlName) == 'O'
			local lcMacro
			lcMacro = this.cControl + '.removeObject("' + lcControlName + '")'
			&lcMacro
			return .t.
		endif

		return .f.
	endfunc
	* ================================================================================== *
	* delControlByPath: delete a control by using the absolute hierarchy.
	* NOTE: do not specify the owner object's name in the path.
	* ================================================================================== *
	hidden function delControlByPath(toArguments)
		local lcPath
		this.checkArity(1, toArguments.count)
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_19)
		endif
		lcPath = toArguments.item(1)
		if type(this.cControl + '.' + lcPath) == 'O'
			local loObject
			loObject = evaluate(this.cControl + '.' + lcPath)
			loObject.parent.removeobject(loObject.name)
			return .t.
		endif
		return .f.
	endfunc

	* ================================================================================== *
	* delControlByClass: delete a control by using it's class name as reference.
	* ================================================================================== *
	hidden function delControlByClass(toArguments)
		local lcClassName, loResult
		this.checkArity(1, toArguments.count)
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_20)
		endif
		lcClassName = toArguments.item(1)
		loResult = .f.
		try
			local loParent, lnDeleted
			loParent = evaluate(this.cControl)
			do while .t.
				lnDeleted = this.deleteControlByClass(loParent, lower(alltrim(lcClassName)))
				if empty(lnDeleted)
					exit
				endif
			enddo
			loResult = .t.
		catch
			loResult = .f.
		endtry

		return loResult
	endfunc
	* ================================================================================== *
	* getProperty: gets an object property value.
	* ================================================================================== *
	hidden function getProperty(toArguments)
		this.checkArity(1, toArguments.count)
		local loResult, lcPropertyName
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_EXPECTED_OBJECT_2)
		endif
		lcPropertyName = toArguments.item(1)
		try
			loResult = evaluate(this.cControl + '.' + lcPropertyName)
		catch
			loResult = .null.
		endtry

		return loResult
	endfunc
	* ================================================================================== *
	* setProperty: set an object property to a new value.
	* ================================================================================== *
	hidden function setProperty(toArguments)
		this.checkArity(2, toArguments.count)
		local loResult, lcPropertyName, lvPropertyValue, lcMacro
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_EXPECTED_OBJECT_2)
		endif
		lcPropertyName = toArguments.item(1)
		lvPropertyValue = toArguments.item(2)
		loResult = lvPropertyValue
		try
			lcMacro = this.cControl + '.' + lcPropertyName + ' = lvPropertyValue'
			&lcMacro
		catch to loEx
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, loEx.message)
		endtry

		return loResult
	endfunc
	* ================================================================================== *
	* setProperties: set an object's properties to a new value.
	* ================================================================================== *
	hidden function setProperties(toArguments)
		this.checkArity(1, toArguments.count)
		if type('toArguments.Item(1)') != 'O' or toArguments.item(1).tag != 'Map'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_22)
		endif

		local loResult, lcPropertyName, lvPropertyValue, lcMacro, i, loDictionary
		loResult = .t.
		loDictionary = toArguments.item(1)

		try
			for i = 1 to loDictionary.count
				lcPropertyName = loDictionary.getkey(i)
				lvPropertyValue = loDictionary.item(i)
				lcMacro = this.cControl + '.' + lcPropertyName + ' = lvPropertyValue'
				&lcMacro
			endfor
		catch to loEx
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, loEx.message)
		endtry

		return loResult
	endfunc
	* ================================================================================== *
	* addProperty: create a property in the owner object.
	* ================================================================================== *
	hidden function newProperty(toArguments)
		this.checkArity(2, toArguments.count)
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_15)
		endif

		try
			local lcPropertyName, lvPropertyValue, lcMacro, llResult
			lcPropertyName = toArguments.item(1)
			lvPropertyValue = toArguments.item(2)
			if type(this.cControl + '.' + lcPropertyName) == 'U'
				lcMacro = '=addproperty(' + this.cControl + ',lcPropertyName, .null.)'
				&lcMacro
			endif
			lcMacro = this.cControl + '.' + lcPropertyName + ' = lvPropertyValue'
			&lcMacro
			llResult = .t.
		catch
			llResult = .f.
		endtry

		return llResult
	endfunc
	* ================================================================================== *
	* newProperties: create a series of properties in the owner object.
	* ================================================================================== *
	hidden function newProperties(toArguments)
		this.checkArity(1, toArguments.count)
		if type('toArguments.Item(1)') != 'O' or toArguments.item(1).tag != 'Map'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_22)
		endif

		try
			local lcPropertyName, lvPropertyValue, lcMacro, llResult, i, loCollection
			loCollection = toArguments.item(1)
			for i = 1 to loCollection.count
				lcPropertyName = loCollection.getkey(i)
				lvPropertyValue = loCollection.item(i)
				if type(this.cControl + '.' + lcPropertyName) == 'U'
					lcMacro = '=addproperty(' + this.cControl + ',lcPropertyName, .null.)'
					&lcMacro
				endif
				lcMacro = this.cControl + '.' + lcPropertyName + ' = lvPropertyValue'
				&lcMacro
			endfor
			llResult = .t.
		catch
			llResult = .f.
		endtry

		return llResult
	endfunc
	* ================================================================================== *
	* callMethod: invokes the owner object's associated method.
	* ================================================================================== *
	hidden function callMethod(toArguments)
		if empty(toArguments.count) or type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_23)
		endif
		local lcMacro, i, loResult
		loResult = .null.
		try
			lcMacro = this.cControl + '.' + toArguments.item(1) + '('
			for i = 2 to toArguments.count
				if i > 2
					lcMacro = lcMacro + ','
				endif
				lcMacro = lcMacro + 'toArguments.Item(' + alltrim(str(i)) + ')'
			endfor
			lcMacro = lcMacro + ')'
			loResult = &lcMacro
		catch to loEx
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, loEx.message)
		endtry
		return loResult
	endfunc
	* ================================================================================== *
	* getAlias: get an alias from control base.
	* ================================================================================== *
	hidden function getAlias(toArguments)
		set step on
		this.checkArity(1, toArguments.count)
		local loResult
		if type('toArguments.Item(1)') != 'C'
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_24)
		endif
		try
			lcMacro = this.cControl + '.DataSessionId'
			loResult = createobject("CursorBase", toArguments.item(1), &lcMacro)
		catch to loEx
			loResult = .f.
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, loEx.message)
		endtry

		return loResult
	endfunc
	* ================================================================================== *
	* runSelectedMethod: runs the linked method name.
	* ================================================================================== *
	function runSelectedMethod(toArgs)
		return evaluate("this." + this.oMethodName.lexeme + "(toArgs)")
	endfunc
	* ================================================================================== *
	* checkArity: validate the number of arguments passed with the expected ones.
	* ================================================================================== *
	hidden procedure checkArity(tnExpected, tnGot)
		if tnExpected != tnGot
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oMethodName, FS_INTERPRETER_6 + alltrim(str(tnExpected)) + FS_INTERPRETER_7 + alltrim(str(tnGot)) + ".")
		endif
	endproc

	hidden function deleteControlByClass(toControl, tcClass)
		local lnDeletedObjects, loControl
		lnDeletedObjects = 0

		do case
		case inlist(loParent.baseclass, 'Container', 'Column', 'Form')
			for each loControl in toControl.controls
				if tcClass == '*' or lower(alltrim(loControl.class)) == tcClass
					toControl.removeobject(loControl.name)
					lnDeletedObjects = lnDeletedObjects + 1
				endif
			endfor
		case loParent.baseclass == 'Grid'
			for each loControl in toControl.columns
				if tcClass == '*' or lower(alltrim(loControl.class)) == tcClass
					toControl.removeobject(loControl.name)
					lnDeletedObjects = lnDeletedObjects + 1
				endif
			endfor
		endcase

		return lnDeletedObjects
	endfunc

	function toString
		return 'LinkedControl(' + this.cControl + ')'
	endfunc

enddefine

* ================================================================================== *
* Builtin function Clock
* ================================================================================== *
define class BuiltinClock as Callable

	function init
		this.lValidateArity = false
	endfunc

	function arity
		return 0
	endfunc

	function call(toInterpreter, toArguments)
		return seconds()
	endfunc

enddefine

* ================================================================================== *
* Builtin function Display
* ================================================================================== *
define class BuiltinDisplay as Callable

	function init
		this.lValidateArity = false
	endfunc

	function arity
		return 0
	endfunc

	function call(toInterpreter, toArguments)
		if empty(toArguments.count)
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_25)
		endif
		do case
		case toArguments.count = 1 && message text in default position
			this.displayMessage(stringify(toArguments.item(1)))

		case toArguments.count = 2 && message text with timeout
			* Validate timeout argument
			if type('toArguments.Item(2)') != 'N'
				_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_26)
			endif
			this.displayMessage(stringify(toArguments.item(1)), toArguments.item(2))

		case toArguments.count = 3 && message text with timeout in particular position
			* Validate timeout argument
			if type('toArguments.Item(2)') != 'N'
				_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_26)
			endif

			* Validate position argument
			if type('toArguments.Item(3)') != 'N'
				_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_27)
			endif

			this.displayMessage(stringify(toArguments.item(1)), toArguments.item(2), toArguments.item(3))
		endcase
	endfunc

	hidden function displayMessage(tcMessage, tnTimeout, tnPosition)
		if empty(tnTimeout)
			tnTimeout = 0
		endif
		if empty(tnPosition)
			tnPosition = 0
		endif
		local lcMacro, lnOldScaleMode
		lnOldScaleMode = _screen.scalemode
		_screen.scalemode = 0 &&Foxels
		lcMacro = 'wait window tcMessage'

		if tnPosition = 1 && Centered
			lcMacro = lcMacro + ' at (_screen.height/2),((_screen.width/2)-(len(tcMessage)/2)) '
		endif

		if !empty(tnTimeout)
			lcMacro = lcMacro + ' timeout tnTimeout'
		else
			lcMacro = lcMacro + ' nowait'
		endif
		&lcMacro
		_screen.scalemode = lnOldScaleMode
	endfunc
enddefine

* ================================================================================== *
* Builtin function Info
* ================================================================================== *
define class BuiltinInfo as Callable

	function init
		this.lValidateArity = false
	endfunc

	function arity
		return 0
	endfunc

	function call(toInterpreter, toArguments)
		if empty(toArguments.count)
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_25)
		endif
		do case
		case toArguments.count = 1
			messagebox(toArguments.item(1), 64)

		case toArguments.count = 2
			messagebox(toArguments.item(1), 64, toArguments.item(2))
		otherwise
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_28)
		endcase
	endfunc
enddefine

* ================================================================================== *
* Builtin function Error
* ================================================================================== *
define class BuiltinError as Callable

	function init
		this.lValidateArity = false
	endfunc

	function arity
		return 0
	endfunc

	function call(toInterpreter, toArguments)
		if empty(toArguments.count)
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_25)
		endif
		do case
		case toArguments.count = 1
			messagebox(toArguments.item(1), 16)

		case toArguments.count = 2
			messagebox(toArguments.item(1), 16, toArguments.item(2))
		otherwise
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_28)
		endcase
	endfunc
enddefine

* ================================================================================== *
* Builtin function Warning
* ================================================================================== *
define class BuiltinWarning as Callable

	function init
		this.lValidateArity = false
	endfunc

	function arity
		return 0
	endfunc

	function call(toInterpreter, toArguments)
		if empty(toArguments.count)
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_25
		endif
		do case
		case toArguments.count = 1
			messagebox(toArguments.item(1), 48)

		case toArguments.count = 2
			messagebox(toArguments.item(1), 48, toArguments.item(2))
		otherwise
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_28)
		endcase
	endfunc
enddefine

* ================================================================================== *
* Builtin function Confirm
* ================================================================================== *
define class BuiltinConfirm as Callable

	function init
		this.lValidateArity = false
	endfunc

	function arity
		return 0
	endfunc

	function call(toInterpreter, toArguments)
		local lnResult
		if empty(toArguments.count)
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_25)
		endif
		do case
		case toArguments.count = 1
			lnResult = messagebox(toArguments.item(1), 36) == 6

		case toArguments.count = 2
			lnResult = messagebox(toArguments.item(1), 36, toArguments.item(2)) == 6
		otherwise
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_28)
		endcase
		return lnResult
	endfunc
enddefine

* ================================================================================== *
* Builtin function Native
* ================================================================================== *
define class BuiltinNative as Callable

	function init
		this.lValidateArity = false
	endfunc

	function arity
		return 0
	endfunc

	function call(toInterpreter, toArguments)
		if empty(toArguments.count)
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_25)
		endif

		local lcArguments, lcNativeFunction, i, loResult
		lcArguments = ''
		lcNativeFunction = toArguments.item(1)

		for i = 2 to toArguments.count
			if i > 2
				lcArguments = lcArguments + ', '
			endif
			lcArguments = lcArguments + 'toArguments.Item(' + alltrim(str(i)) + ')'
		endfor

		loResult = evaluate(lcNativeFunction + '(' + lcArguments + ')')
		return loResult
	endfunc

enddefine

* ================================================================================== *
* Builtin function NewForm
* ================================================================================== *
define class BuiltinNewForm as Callable

	function init
		this.lValidateArity = false
	endfunc

	function arity
		return 0
	endfunc

	function call(toInterpreter, toArguments)
		if toArguments.count > 0
			_screen.FoxScript.throwError('RuntimeError', 'token', this.oParen, FS_INTERPRETER_25)
		endif
		local lcName, lcMacro
		lcName = '__fsScript__public__form_' + sys(2015)
		lcMacro = 'public ' + lcName
		&lcMacro
		lcMacro = lcName + ' = createobject("BaseForm")'
		&lcMacro		
		return createobject("ControlBase", lcName)
	endfunc

enddefine

define class BaseForm as Form	
	ControlHandlers = .null.

	function init
		this.ControlHandlers = createobject('Collection')
	endfunc
	
	function queryunload
		for each loControl in this.ControlHandlers
			release loControl
		endfor	
	endfunc
enddefine

* ================================================================================== *
* Runtime Collection Classes
* ================================================================================== *
define class Callable as Custom
	oParen = .null.
	lValidateArity = true

	function arity
		* Abstract
	endfunc

	function call(toInterpreter, toArguments)
		* Abstract
	endfunc

	function toString
		return 'Object'
	endfunc
enddefine

* ================================================================================== *
* Dictionary Class (internal data structure)
* ================================================================================== *
define class Dictionary as collection
	function ContainsKey(tcKey)
		local lnIndex
		if empty(tcKey)
			return .f.
		endif
		return this.getkey(tcKey) > 0
	endfunc

	function put(tcKey, tvValue)
		if this.ContainsKey(tcKey)
			this.remove(this.getkey(tcKey))
		endif
		this.add(tvValue, tcKey)
	endfunc

	function get(tvIndexOrKey) as object
		do case
		case type('tvIndexOrKey') == 'N'
			if !between(tvIndexOrKey, 1, this.count)
				return .null.
			endif
			return this.item(tvIndexOrKey)
		case type('tvIndexOrKey') == 'C'
			tvIndexOrKey = this.getkey(tvIndexOrKey)
			if tvIndexOrKey > 0
				return this.item(tvIndexOrKey)
			endif
		endcase
		return .null.
	endfunc

	function toString as string
		local loItem, lcOutput, i, llIsMap, lcKey, lcValue
		llIsMap = this.tag == 'Map'
		lcOutput = iif(llIsMap, '{', '[')
		i = 1
		for i = 1 to this.count
			if i > 1
				lcOutput = lcOutput + ', '
			endif
			lcKey = '"' + this.getkey(i) + '"'
			lcValue = stringify(this.item(i))
			lcOutput = lcOutput + lcKey + ':' + lcValue
		endfor
		lcOutput = lcOutput + iif(llIsMap, '}', ']')
		return lcOutput
	endfunc

enddefine

* ================================================================================== *
* ArrayLiteral
* ================================================================================== *
define class ArrayLiteral as custom
	oKeyword = .null.
	oElements = .null.
	cHash = ''

	function init(toKeyword, toElements)
		this.oKeyword = toKeyword
		this.oElements = toElements
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitArrayLiteralExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Assign
* ================================================================================== *
define class Assign as custom
	oName = .null.
	oValue = .null.
	cHash = ''

	function init(toName, toValue)
		this.oName = toName
		this.oValue = toValue
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitAssignExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Binary
* ================================================================================== *
define class Binary as custom
	oLeft = .null.
	oOperator = .null.
	oRight = .null.
	cHash = ''

	function init(toLeft, toOperator, toRight)
		this.oLeft = toLeft
		this.oOperator = toOperator
		this.oRight = toRight
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitBinaryExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Call
* ================================================================================== *
define class call as custom
	oCallee = .null.
	oParen = .null.
	oArguments = .null.
	cHash = ''

	function init(toCallee, toParen, toArguments)
		this.oCallee = toCallee
		this.oParen = toParen
		this.oArguments = toArguments
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitCallExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Window
* ================================================================================== *
define class window as custom
	oKeyword = .null.
	cHash = ''

	function init(toKeyword)
		this.oKeyword = toKeyword
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitWindowExpr(this)
	endfunc
enddefine

* ================================================================================== *
* FunctionArrow
* ================================================================================== *
define class FunctionArrow as custom
	okeyword = .null.
	oParams = .null.
	oBody = .null.
	cHash = ''

	function init(toKeyword, toParams, toBody)
		this.oParams = toParams
		this.oBody = toBody
		this.oKeyword = toKeyword
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitFunctionArrowExpr(this)
	endfunc
enddefine

* ================================================================================== *
* FunctionExpr
* ================================================================================== *
define class FunctionExpr as custom
	oParams = .null.
	oBody = .null.

	function init(toParams, toBody)
		this.oParams = toParams
		this.oBody = toBody
	endfunc

	function accept(toVisitor)
		return toVisitor.visitFunctionExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Get
* ================================================================================== *
define class get as custom
	oObject = .null.
	oName = .null.
	lComputed = .f.
	cHash = ''

	function init(toObject, toName, tlComputed)
		this.oObject = toObject
		this.oName = toName
		this.lComputed = tlComputed
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitGetExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Grouping
* ================================================================================== *
define class Grouping as custom
	oExpressions = .null.
	cHash = ''

	function init(toExpressions)
		this.oExpressions = toExpressions
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitGroupingExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Literal
* ================================================================================== *
define class Literal as custom
	oToken = .null.
	oCollection = .null.
	cHash = ''

	function init(toToken, toCollection)
		this.oToken = toToken
		this.cHash = sys(2015)
		if type('toCollection') == 'O'
			this.oCollection = toCollection
		endif
	endfunc

	function accept(toVisitor)
		return toVisitor.visitLiteralExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Logical
* ================================================================================== *
define class Logical as custom
	oLeft = .null.
	oOperator = .null.
	oRight = .null.
	cHash = ''

	function init(toToken, toLeft, toOperator, toRight)
		this.oLeft = toLeft
		this.oOperator = toOperator
		this.oRight = toRight
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitLogicalExpr(this)
	endfunc
enddefine

* ================================================================================== *
* ObjectLiteral
* ================================================================================== *
define class ObjectLiteral as custom
	oKeyword = .null.
	oElements = .null.
	cHash = ''

	function init(toKeyword, toElements)
		this.oKeyword = toKeyword
		this.oElements = toElements
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitObjectLiteralExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Set
* ================================================================================== *
define class set as custom
	oObject = .null.
	oName = .null.
	oValue = .null.
	cHash = ''

	function init(toObject, toName, toValue)
		this.oObject = toObject
		this.oName = toName
		this.oValue = toValue
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitSetExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Unary
* ================================================================================== *
define class Unary as custom
	oOperator = .null.
	oRight = .null.
	cHash = ''

	function init(toOperator, toRight)
		this.oOperator = toOperator
		this.oRight = toRight
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitUnaryExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Variable
* ================================================================================== *
define class Variable as custom
	oName = .null.
	cHash = ''

	function init(toName)
		this.oName = toName
		this.cHash = sys(2015)
	endfunc

	function accept(toVisitor)
		return toVisitor.visitVariableExpr(this)
	endfunc
enddefine

* ================================================================================== *
* Block
* ================================================================================== *
define class block as custom
	oStatements = .null.
	function init(toStatements)
		this.oStatements = toStatements
	endfunc

	function accept(toVisitor)
		return toVisitor.visitBlockStmt(this)
	endfunc
enddefine

* ================================================================================== *
* Expression
* ================================================================================== *
define class expression as custom
	oExpression = .null.

	function init(toExpression)
		this.oExpression = toExpression
	endfunc

	function accept(toVisitor)
		return toVisitor.visitExpressionStmt(this)
	endfunc
enddefine

* ================================================================================== *
* IfNode
* ================================================================================== *
define class IfNode as custom
	oCondition = .null.
	oThenBranch = .null.
	oElseBranch = .null.

	function init(toCondition, toThenBranch, toElseBranch)
		this.oCondition = toCondition
		this.oThenBranch = toThenBranch
		this.oElseBranch = toElseBranch
	endfunc

	function accept(toVisitor)
		return toVisitor.visitIfNodeStmt(this)
	endfunc
enddefine

* ================================================================================== *
* ReturnNode
* ================================================================================== *
define class ReturnNode as custom
	oKeyword = .null.
	oValue = .null.

	function init(toKeyword, toValue)
		this.oKeyword = toKeyword
		this.oValue = toValue
	endfunc

	function accept(toVisitor)
		return toVisitor.visitReturnNodeStmt(this)
	endfunc
enddefine

* ================================================================================== *
* Var
* ================================================================================== *
define class var as custom
	oName = .null.
	oInitializer = .null.

	function init(toName, toInitializer)
		this.oName = toName
		this.oInitializer = toInitializer
	endfunc

	function accept(toVisitor)
		return toVisitor.visitVarStmt(this)
	endfunc
enddefine

* ================================================================================== *
* WhileNode
* ================================================================================== *
define class WhileNode as custom
	oCondition = .null.
	oBody = .null.

	function init(toCondition, toBody)
		this.oCondition = toCondition
		this.oBody = toBody
	endfunc

	function accept(toVisitor)
		return toVisitor.visitWhileNodeStmt(this)
	endfunc
enddefine

* ================================================================================== *
* ForNode
* ================================================================================== *
define class ForNode as custom
	oKeyword = .null.
	oVarDecl = .null.
	oType = .null.
	oCollection = .null.
	oBody = .null.

	function init(toKeyword, toVarDecl, toType, toCollection, toBody)
		this.oKeyword = toKeyword
		this.oVarDecl = toVarDecl
		this.oType = toType
		this.oCollection = toCollection
		this.oBody = toBody
	endfunc

	function accept(toVisitor)
		return toVisitor.visitForNodeStmt(this)
	endfunc
enddefine

function stringify(lvValue)
	if type('lvValue') == 'O'
		return lvValue.toString()
	endif
	if type('lvValue') == 'N'
		return alltrim(str(lvValue))
	endif

	return transform(lvValue)
endfunc

* ================================================================================== *
* RuntimeObject class
* ================================================================================== *
define class RuntimeObject as RuntimeInstance
	oClass = .null.
	oFields = .null.

	function init(toClass)
		dodefault(toClass)
	endfunc

	function get(toName)
		if toName.lexeme == 'count'
			return this.oFields.count
		endif
		return dodefault(toName)
	endfunc

enddefine

* ================================================================================== *
* RuntimeInstance class
* ================================================================================== *
define class RuntimeInstance as custom
	oClass = .null.
	oFields = .null.

	function init(toClass)
		this.oClass = toClass
		this.oFields = createobject('Dictionary')
	endfunc

	function get(toName)
		if this.oFields.ContainsKey(toName.lexeme)
			return this.oFields.get(toName.lexeme)
		endif

		local loMethod
		loMethod = this.oClass.findMethod(toName.lexeme)
		if !isnull(loMethod)
			return loMethod.bind(this)
		endif
		_screen.FoxScript.throwError('RuntimeError', 'token', toToken, FS_INTERPRETER_29 + "'" + toName.lexeme + "'.")
	endfunc

	function set(toName, toValue)
		this.oFields.put(toName.lexeme, toValue)
	endfunc
enddefine
