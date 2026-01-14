*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Cadastro de nível
    browser.go to  ${link_cliente}ungpOrgaoSetor/abrirCadastroNivel.do
    get text       //h1[contains(.,'${texto_cadastro_nivel}')]   *=    ${texto_cadastro_nivel}
    get text       //h2[contains(.,'${texto_nivel}')]   *=    ${texto_nivel}
    Take Screenshot

Associação entre nível e tipo
    browser.go to  ${link_cliente}ungpOrgaoSetor/abrirConsultaNiveltipo.do
    get text       //h1[contains(.,'${texto_associacao_nivel}')]   *=    ${texto_associacao_nivel}
    get text       //h2[contains(.,'${texto_parametros_consulta}')]   *=    ${texto_parametros_consulta}
    Take Screenshot

Cadastro de órgaos
    browser.go to  ${link_cliente}ungpOrgaoSetor/abrirConsultaOrgao.do
    get text       //h1[contains(.,'${texto_consulta_orgaos}')]   *=    ${texto_consulta_orgaos}
    get text       //h2[contains(.,'${texto_parametros_consulta}')]   *=    ${texto_parametros_consulta}
    Take Screenshot

Cadastro de tipo de unidade
    browser.go to  ${link_cliente}ungpOrgaoSetor/abrirCadastroTiposetor.do
    get text       //h1[contains(.,'${texto_cadastro_tipo_unidade}')]   *=    ${texto_cadastro_tipo_unidade}
    get text       //h2[contains(.,'${texto_tipo_unidade}')]   *=    ${texto_tipo_unidade}
    Take Screenshot


Cadastro de revisão
    browser.go to  ${link_cliente}ungpOrgaoSetor/abrirConsultaRevisao.do
    get text       //h1[contains(.,'${texto_revisao}')]   *=    ${texto_revisao}
    get text       //h2[contains(.,'${texto_dados_revisao}')]   *=    ${texto_dados_revisao}
    Take Screenshot