*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Portal externo - início
    Click    //span[contains(.,'${texto_inicio}')]
    get text       (//span[contains(.,'${texto_abertura_servicos}')])[1]   *=    ${texto_abertura_servicos_upper}
    Take Screenshot

Portal externo - Consulta de processos
    Run Keyword If    '${cliente}' == 'hmlCopasa'        texto consulta portal copasa
    ...  ELSE                                            texto consulta portal 

texto consulta portal
    Click    (//span[contains(.,'${texto_consulta_processos}')])[1]
    get text       (//span[contains(.,'${texto_consulta_processos}')])[2]   *=    ${texto_consulta_processos}
    Take Screenshot

texto consulta portal copasa
    Click    //*[@id="root"]/div/div/nav/ul/li[2]/a/span
    get text       //span[contains(.,'Consulta de Protocolos e Processos')]   *=    Consulta de Protocolos e Processos
    Take Screenshot

Portal externo - Conferência de documentos
    Click    (//span[contains(.,'${texto_conferencia_documentos}')])[1]
    get text       (//span[contains(.,'${texto_codigo_documento}')])[1]    *=    ${texto_codigo_documento}
    Take Screenshot

Portal externo - Solicitação de serviços
    Click    (//span[contains(.,'${texto_solic_servico}')])[1]
    get text       //p[contains(.,'${texto_procura}')]   *=    ${texto_procura}
    Take Screenshot

Portal externo - Login
    Run Keyword If    '${internacional}' == 'nao'   validar com GovBr
    ...    ELSE    validar com tela padrão


validar com GovBr
    Click    (//span[contains(.,'${texto_entrar}')])[1]
#    get text       //span[contains(.,'${texto_entrar_com_govbr}')]   *=    ${texto_entrar_com_govbr}
    get text     //span[contains(.,'Esqueceu a senha?')]   *=   Esqueceu a senha?
    Take Screenshot

validar com tela padrão
    Click    (//span[contains(.,'${texto_entrar}')])[1]
    get text       //span[contains(.,'${texto_criar_conta_es}')]   *=    ${texto_criar_conta_es}
    Take Screenshot


