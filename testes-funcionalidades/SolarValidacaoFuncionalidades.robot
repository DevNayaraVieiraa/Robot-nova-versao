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
Realizar autuação de documento digital
    [Tags]    processoAutuaçãoDocDigital
    ${texto_detalhamento}  Set Variable    Cadastro de documento digital para autuação
    Set Global Variable    ${texto_detalhamento}   
    Login no solar BPM 
    Cadastrar documento digital
    Realizar autuação no sistema
    Consultar autuação realizada - consulta por número de documento

Realizar autuação de documento físico
    [Tags]    processoAutuaçãoDocFisico
    ${texto_detalhamento}  Set Variable    Cadastro de documento físico para autuação
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar documento físico
    Realizar autuação no sistema
    Consultar autuação realizada - consulta por número de documento

Realizar tramitação de processos - consulta
    [Tags]    processoTramitacaoConsulta
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para tramitação na tela de consulta
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital    
    Consultar cadastro realizado - consulta por número de documento
    Clicar em encaminhar processo
    Realizar encaminhamento
    Validar mensagem "Operação realizada com sucesso"
    Consultar tramitação de processo
    Realizar recebimento de processo pela tela de consulta

Realizar tramitação de processo - Fila de trabalho
    [Tags]    processoTramitacaoFila
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para tramitação pela fila de trabalho
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital    
    Consultar processo na fila de trabalho
    Clicar em encaminhar processo pela fila de trabalho
    Realizar encaminhamento
    Validar mensagem "Encaminhamento realizado com sucesso"    
    Realizar recebimento de processo pela fila de trabalho

Realizar Arquivamento/desarquivamento de processo pela tela de consulta
    [Tags]    processoArquivamentoReabertura
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para arquivamento na tela de consulta
    Set Global Variable    ${texto_detalhamento}   
    Login no solar BPM 
    Cadastrar processo digital
    Consultar cadastro realizado - consulta por número de documento
    Clicar em arquivar processo pela tela de consulta
    Realizar arquivamento
    Confirmar dados de arquivamento
    Clicar em desarquivar processo pela tela de consulta
    Realizar desarquivamento
    Confirmar dados de desarquivamento

Realizar Arquivamento de processo pela fila de trabalho
    [Tags]    processoArquivamentoFila
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para arquivamento pela fila de trabalho
    Set Global Variable    ${texto_detalhamento}
    Login no solar BPM
    Cadastrar processo digital    
    Consultar processo na fila de trabalho
    Clicar em arquivar processo pela fila de trabalho
    Realizar arquivamento
    Realizar confirmação de arquivamento e exclusão de processo da fila
    Consultar cadastro realizado - consulta por número de documento
    Confirmar dados de arquivamento    

Cadastrar processo e incluir documento na pasta digital
    [Tags]    anexos
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para testes na pasta digital
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital    
    Consultar cadastro realizado - consulta por número de documento
    Inserir documento na pasta digital

Cadastrar processo e realizar juntada de documento
    [Tags]    processoJuntadaDocumento
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para juntada de documento
    Set Global Variable    ${texto_detalhamento}   
    Login no solar BPM 
    Cadastrar processo digital
    Cadastrar documento digital para juntada
    Consultar cadastro realizado - consulta por número de documento
    Realizar juntada de documento a processo
    Realizar confirmação da juntada de documento a processo

Cadastrar processo e realizar juntada de processo
    [Tags]    processoJuntadaProcesso
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para juntada de processo
    Set Global Variable    ${texto_detalhamento}   
    Login no solar BPM 
    Cadastrar processo digital
    Cadastrar processo digital para juntada
    Consultar cadastro realizado - consulta por número de documento
    Realizar juntada de processo
    Realizar confirmação da juntada de processos

Cadastrar processo e realizar vinculação
    [Tags]    processoVinculacao
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para vinculação
    Set Global Variable    ${texto_detalhamento}  
    Login no solar BPM  
    Cadastrar processo digital
    Cadastrar processo digital para vinculação
    Consultar cadastro realizado - consulta por número de documento
    Realizar vinculação de processo
    Realizar confirmação da vinculação de processo

Cadastrar processo e realizar cancelamento/reativação    
    [Tags]    processoCancelamentoReativacao
    ${texto_detalhamento}  Set Variable    Cadastro de processo digital para cancelamento/reativação
    Set Global Variable    ${texto_detalhamento}    
    Login no solar BPM
    Cadastrar processo digital
    Consultar cadastro realizado - consulta por número de documento
    Clicar em Cancelamento/reativação
    Preencher dados de cancelamento
    Confirmar dados de cancelamento de processo
    Consultar processo cancelado na fila de trabalho
    Consultar cadastro realizado - consulta por número de documento
    Clicar em Cancelamento/reativação
    Preencher dados de reativação de processo
    Confirmar dados de reativação de processo
    Consultar processo na fila de trabalho

    
