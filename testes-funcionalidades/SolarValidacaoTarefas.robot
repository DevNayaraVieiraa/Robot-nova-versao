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
Cadastrar processo, criar e finalizar tarefa padrão
    [Tags]    processoTarefa
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para validar criação de tarefa padrão
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital    
    Consultar cadastro realizado - consulta por número de documento
    Criar tarefa padrão
    Finalizar tarefa padrão pela fila de trabalho

Cadastrar processo, inserir documento e assinar via tarefa de assinatura externa
    [Tags]    tarefaAssinaturaExterna
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para tarefa de assinatura no portal externo
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

Cadastrar processo, criar e finalizar uma tarefa do tipo comunique-se
    [Tags]    tarefaComuniquese
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para tarefa de comunique-se
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital    
    Consultar cadastro realizado - consulta por número de documento
    Cadastrar tarefa do tipo Comunique-se
    Realizar login no portal externo
    Pesquisar pendencia e responder comunique-se
    Login SolarBpm - Autenticar com login padrão
    Finalizar tarefa de análise de resposta do comunique-se
    