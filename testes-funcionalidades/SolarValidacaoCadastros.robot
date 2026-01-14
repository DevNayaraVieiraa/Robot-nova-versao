*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
Test Setup       Configurar ambiente
resource         Keywords/solarBPMCadastrosKeywords.resource
resource         Keywords/configuracoesFilaKeywords.resource
resource         Keywords/ecmKeywords.resource
resource         Keywords/portalExternoKeywords.resource
Resource         Keywords/solarBPMConsultasKeywords.resource
Resource         Keywords/solarBPMTarefasKeywords.resource
Resource         Keywords/solarBPMOperacoesKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  FakerLibrary
Library  String


*** Test Cases ***
Cadastrar processo digital no SolarBPM
    [tags]   cadastrarProcessoDigital
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital simples
    Set Global Variable    ${texto_detalhamento}
    Login no solar BPM
    Cadastrar processo digital
    Consultar cadastro realizado - consulta por número de documento

Cadastrar processo físico no SolarBPM
    [tags]   cadastrarProcessoFisico
    ${texto_detalhamento}  Set Variable    Cadastro de processo físico simples
    Set Global Variable    ${texto_detalhamento}
    Login no solar BPM
    Cadastrar processo físico
    Consultar cadastro realizado - consulta por número de documento

Cadastrar documento digital no SolarBPM
    [tags]   cadastrarDocumentoDigital
    ${texto_detalhamento}  Set Variable    Cadastro de documento digital simples
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar documento digital
    Consultar cadastro realizado - consulta por número de documento

Cadastrar documento físico no SolarBPM
    [tags]   cadastrarDocumentoFisico
    ${texto_detalhamento}  Set Variable    Cadastro de documento físico simples
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar documento físico
    Consultar cadastro realizado - consulta por número de documento

Cadastrar Interessado no SOLARBPM
    [tags]     cadastrarInteressado
    ${texto_detalhamento}  Set Variable    Cadastro de processo com um novo interessado
    Set Global Variable    ${texto_detalhamento}
    Login no solar BPM
    Acessar Tela de Cadastro dO Interessado
    Clicar em NOVO
    Preencher Formulario de Cadastro do Interessado
    Clicar em SALVAR
    Clicar em VOLTAR
    Consultar Interessados
    Validar Consulta do Interessado Cadastrado

# Cadastro de assunto/classificação
#     [tags]   cadastrarClassificacao
#     Cadastrar nova classificação
#     Preencher Dados Básicos
#     Preencher aba Configurações
#     Cadastrar processo digital com nova classificação
#     Inativar classificação

#     # Selecionar Tipo de assinatura "Eletronica do sistema" e metodo PAdES
#     # Inserir documento e assinar com o tipo "Eletronica do sistema" e metodo PAdES
#     # Selecionar Tipo de assinatura "Eletronica do sistema" e metodo CAdES
#     # Inserir documento e assinar com o tipo "Eletronica do sistema" e metodo CAdES
    
#     # Selecionar Tipo de assinatura "ICP Brasil" e metodo PAdES
#     # Inserir documento e confirmar opção de assinatura com o tipo "ICP Brasil" e metodo PAdES
#     # Selecionar Tipo de assinatura "ICP Brasil" e metodo CAdES
#     # Inserir documento e confirmar opção de assinatura com o tipo "ICP Brasil" e metodo CAdES    


#     Garantir que não é possível selecionar classificação inativa
