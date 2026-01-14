*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Resource         solarBPMCadastrosKeywords.resource
Resource         parametrizacaoConsultas.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library    String

*** Keywords ***
Realizar consulta textual
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Click   //li[contains(.,'Textual')]
    click     //*[@id="idFrameMural"] >>> //input[contains(@class,'buscar search-block-two__btn-salvar')]
    get text  //*[@id="idFrameMural"] >>> //h3[contains(.,'Filtros')]   *=    Filtros

Consultar cadastro realizado - consulta por número de documento
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Prencher campos com número do processo - Consulta
    Click        (//input[contains(@type,'submit')])[2]
    Get Text     //p[@class='sds-p'][contains(.,'${detalhamento}')]   *=   ${detalhamento}
    Get Text     //div[@class='sds-subtitle'][contains(.,'${texto_consulta}')]   *=   ${texto_consulta}

Consultar processo na fila de trabalho
    Browser.Go To    ${link_cliente}cpavFilaTrabalho/abrirFilaTrabalho.do?cdUsuarioFila=${user_robot}&view=Todos%20processos&taskName=&cdVisualizacao=2&tipo=Digitais
    Fill Text    //input[contains(@id,'filtro-texto')]    ${processo_cadastrado}
    click        //input[contains(@type,'submit')]
    Get Text     (//div[contains(@class,'info')])[7]    *=   ${detalhamento}

Consultar processo cancelado na fila de trabalho
    Browser.Go To    ${link_cliente}cpavFilaTrabalho/abrirFilaTrabalho.do?cdUsuarioFila=${user_robot}&view=Todos%20processos&taskName=&cdVisualizacao=2&tipo=Digitais
    Fill Text    //input[contains(@id,'filtro-texto')]    ${processo_cadastrado}
    click        //input[contains(@type,'submit')]
    Get Text     //div[contains(@id,'empty')]    *=   Nenhum registro.

Consultar processo cadastrado no portal de atendimento
    Browser.Go To    ${link_portal}
    Click    (//span[contains(.,'Consulta de Processos')])[1]
    Informar número de processo no portal
    Fill Text    //input[contains(@id,'nuAno')]         ${ano_processo}    
    Click    //span[contains(.,'Consultar')]
    get text  //p[@class='jss3 jss11 jss26'][contains(.,'Solicitação Nº: ${processo_cadastrado}')]   *=  ${processo_cadastrado}
    
Realizar consulta de processos/documentos por dados
    ${data_consulta}       get current date  result_format=%d/%m/%Y
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Click        //li[contains(.,'Dados')]
    Fill Text    //input[contains(@id,'entity.orgaosetor.sgOrgaosetor')]    ${orgao}
    Press Keys   //input[contains(@id,'entity.orgaosetor.sgOrgaosetor')]    Tab
    Fill Text    //input[contains(@id,'dataInicial')]     ${data_consulta}
    Press Keys   //input[contains(@id,'dataInicial')]     Tab
    Fill Text    //input[contains(@id,'dataFinal')]       ${data_consulta}
    Press Keys   //input[contains(@id,'dataFinal')]       Tab
    Click        //input[contains(@id,'btnConsultar')]
    Get Text     //a[@href='javascript:;'][contains(.,'${processo_cadastrado}')]   *=   ${processo_cadastrado}

Consultar autuação realizada - consulta por número de documento
    ${data_autuacao}       get current date  result_format=%d/%m/%Y
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Prencher campos com número do processo - Consulta
    Click        (//input[contains(@type,'submit')])[2]
    Get Text     //p[@class='sds-p'][contains(.,'${detalhamento}')]   *=   ${detalhamento}
    Get Text     (//p[@class='sds-p'])[1]   *=   No dia ${data_autuacao} este processo foi autuado, sua classificação anterior era

Acessar tela de Historico de Atividades
    Browser.Go To    ${link_cliente}cpa-frontend/historico-atividades/consultas?a=.do
    Select Options By    //select[@id='filtrarPorData']    value   ULTIMO_DIA
 
Verificar existencia do botao "Exportar"
    Wait For Elements State    role=button[name="Exportar"]    visible    timeout=5s
    
Clicar no botao
    ${dl_promise-relatorio-historico}    browser.Promise To Wait For Download
    Set Global Variable   ${dl_promise-relatorio-historico}
    Click    //button[normalize-space()='Exportar']  
   
Conferir a mensagem de sucesso ao realizar download
    Get Text    //div[contains(text(),'Relatório exportado com sucesso!')]   *=   Relatório exportado com sucesso!    timeout=15s
 
Conferir download do relatorio em xlsx
    ${file_obj}  wait for   ${dl_promise-relatorio-historico}
    File Should Exist      ${file_obj}[saveAs]
    Should Be Equal          ${file_obj}[suggestedFilename]  historico-atividades.xlsx

Validar campo Data de Abertura
    Get Text    //a[normalize-space()='${processo_cadastrado}']        *=       ${processo_cadastrado}
 
Validar se o campo abertura igual data atual
    Get Text    //*[@id="label.subtitle.consulta.resultado"]/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr[3]/td[2]   *=    ${data_consulta}
 
Consulta do processo cadastrado
    Click     //a[normalize-space()='${processo_cadastrado}']
 
Consultar dados do processo clicado
    Get text    //*[@id="customIframe"] >>> //h6[normalize-space()='${processo_cadastrado}']    *=    ${processo_cadastrado}
 
Validar existência da seta de slide
    Wait For Elements State    xpath=//a[@id='backBtn']    visible    timeout=5s
 
Clicar na seta
    Click    xpath=//a[@id='backBtn']
    Get text    //td[contains(text(),'Resultados')]    *=    Resultados 1 - 2 de 2

Realizar consulta de processos/documentos por dados - campo detalhamento
    ${data_consulta}       get current date  result_format=%d/%m/%Y
    Set Global Variable    ${data_consulta}
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Click        //li[contains(.,'Dados')]
    Fill Text    //input[contains(@id,'entity.orgaosetor.sgOrgaosetor')]    ${orgao}
    Press Keys   //input[contains(@id,'entity.orgaosetor.sgOrgaosetor')]    Tab
    Fill Text    //input[contains(@id,'dataInicial')]     ${data_consulta}
    Press Keys   //input[contains(@id,'dataInicial')]     Tab
    Fill Text    //input[contains(@id,'dataFinal')]       ${data_consulta}
    Press Keys   //input[contains(@id,'dataFinal')]       Tab
    Fill Text    //input[@id='entity.deComplemento']    ${detalhamento}
    Click        //input[contains(@id,'btnConsultar')]
    Get Text     //a[@href='javascript:;'][contains(.,'${processo_cadastrado}')]   *=   ${processo cadastrado}