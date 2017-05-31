#language: pt
#utf-8

Funcionalidade: Enviar Proposta
	Eu como usuário do ORANGEHRM
	Quero fazer um cadastro
	Para cadastrar um funcionario

Contexto: Home do ORANGEHRM
	Dado que logue no ORANGEHRM

@cadastro
Cenario: Cadastrar funcionario
	Quando preencho o cadastro do funcionario
	Entao o sistema realiza o cadastro com sucesso

@editar
Cenario: Editar funcionario
	Quando seleciono o funcionario
	Entao edito as informacoes cadastradas