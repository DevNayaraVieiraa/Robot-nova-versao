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
Resource         Keywords/solarBPMPastaDigitalKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  FakerLibrary
Library  String


*** Test Cases ***
Cadastrar processo, inserir documento e realizar assinatura de sistema
    [Tags]    assinarDocumento
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para assinatura na pasta digital
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital    
    Consultar cadastro realizado - consulta por número de documento
    Inserir documento na pasta digital
    Realizar assinatura
    Validar assinatura realizada

Cadastrar processo, inserir documento e realizar assinatura no portal externo
    [Tags]    assinarDocumentoPortalExterno
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para assinatura no portal externo
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital    
    Consultar cadastro realizado - consulta por número de documento
    Inserir documento na pasta digital
    Solicitar assinatura de interessado
    Realizar login no portal externo
    Pesquisar pendencia de documento e realizar assinatura
    Login SolarBpm - Autenticar com login padrão
    Consultar cadastro realizado - consulta por número de documento
    Validar assinatura realizada
