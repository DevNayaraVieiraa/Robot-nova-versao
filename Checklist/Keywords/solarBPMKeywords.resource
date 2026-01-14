*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library    String

*** Keywords ***
Cadastro de Processo/Documentos    
    browser.go to  ${link_cliente}cpa-frontend/cadastro/processo?a=.do
    get text  //a[@class='sds-color-primary'][contains(.,'${texto_busca_avancada}')]   *=    ${texto_busca_avancada}
    Get Element States   //p[normalize-space()='Ocorreu um erro ao tentar carregar áreas.']    not contains  visible
    Get Element States    //h6[normalize-space()='Ocorreu um erro no servidor!']    not contains   visible
    Take Screenshot

Autuação de documento
    browser.go to      ${link_cliente}cpav/abrirConsultaAutuacao.do
    Get Text    //font[@class='subtitle'][contains(.,'${texto_dados_documento}')]    *=    ${texto_dados_documento}
    Take Screenshot

Consulta de processos/Documentos
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Get Text    //h6[@class='sds-subtitle-small'][contains(.,'${texto_opcoes}')]    *=    ${texto_opcoes}
    Take Screenshot    

Consulta de processos/Documentos - Número
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Get Text    //h6[@class='sds-subtitle-small'][contains(.,'${texto_opcoes}')]    *=    ${texto_opcoes}
    Click    //li[@class='tab sds-tab__item sds-tab__item--active'][contains(.,'Número')]
    Get Text    //font[@class='label'][contains(.,'${texto_dados_processo}')]    *=    ${texto_dados_processo}
    Take Screenshot

Consulta de processos/Documentos - Dados
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Get Text    //h6[@class='sds-subtitle-small'][contains(.,'${texto_opcoes}')]    *=    ${texto_opcoes}
    Click       //li[contains(.,'${texto_dados}')]
    Get Text    //td[@height='21'][contains(.,'${texto_dados_processo_documento}')]    *=    ${texto_dados_processo_documento}
    Take Screenshot    

Consulta de processos/Documentos - Consulta textual
    browser.go to  ${link_cliente}cpav/abrirConsultaProcesso.do
    Get Text    //h6[@class='sds-subtitle-small'][contains(.,'${texto_opcoes}')]    *=    ${texto_opcoes}
    Click       //li[contains(.,'Textual')]
    Get Text    //*[@id="idFrameMural"] >>> //input[contains(@name,'Buscar')]    *=    Buscar 
    Take Screenshot

Histórico de atividades
    browser.go to  ${link_cliente}cpa-frontend/historico-atividades/consultas?a=.do
    Get Text    //h6[contains(.,'${texto_consulta_atividades}')]    *=    ${texto_consulta_atividades}
    Take Screenshot

Materialização em segundo plano 
    browser.go to  ${link_cliente}cpa-frontend/materializacao?a=.do
    Get Text       //h2[@class='subtitle-1'][contains(.,'${texto_materialização}')]    *=    ${texto_materialização}
    Take Screenshot

Esepelho de processo
    browser.go to  ${link_cliente}cpav/abrirRelProcessoEspelho.do
    Get Text    //td[@class='titulo'][contains(.,'${texto_rel_espelho}')]    *=   ${texto_rel_espelho}
    Get Text       //font[@class='subtitle'][contains(.,'${texto_parametros_para_relatorio}')]    *=    ${texto_parametros_para_relatorio}
    Take Screenshot

Relatório de processos/Documentos
    browser.go to  ${link_cliente}cpav/abrirConsultaRelProcessos.do
    Get Text    //td[@class='titulo'][contains(.,'${texto_relatorio_processos}')]    *=   ${texto_relatorio_processos}
    Get Text       //font[@class='subtitle'][contains(.,'${texto_parametros_para_relatorio}')]    *=    ${texto_parametros_para_relatorio}
    Take Screenshot

Relatório de processos com prazo para andamento
    browser.go to  ${link_cliente}cpav/abrirRelProcessosprazo.do
    Get Text    //td[@class='titulo'][contains(.,'${texto_relatorio_prazos}')]    *=   ${texto_relatorio_prazos}
    Get Text       //font[@class='subtitle'][contains(.,'${texto_parametros_para_relatorio}')]    *=    ${texto_parametros_para_relatorio}
    Take Screenshot

Cadastro de classificação
    browser.go to  ${link_cliente}pcl/abrirConClasse.do
    Get Text    //h1[contains(.,'${texto_consulta_classificacoes}')]    *=   ${texto_consulta_classificacoes}
    Get Text       //label[@for='nuClasseCompleto'][contains(.,'${texto_cod_classificacao}')]    *=    ${texto_cod_classificacao}
    Take Screenshot

Cadastro/Consulta de interessados
    browser.go to  ${link_cliente}cpav/abrirConsultaSujeito.do
    Get Text       //td[@class='titulo'][contains(.,'${texto_consulta_interessado}')]    *=   ${texto_consulta_interessado}
    Take Screenshot



