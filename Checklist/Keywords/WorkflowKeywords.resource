*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Permitir acesso a minha fila de trabalho
    browser.go to  ${link_cliente}wfl/abrirAssociarUsuariosMenuWFlow.do
    get text       //td[@class='titulo'][contains(.,'${texto_permitir_acesso_fila}')]   *=    ${texto_permitir_acesso_fila}
#    get text       //font[@class='subtitle'][contains(.,'${texto_permitir_visualizar_fila}')]   *=    ${texto_permitir_visualizar_fila}
    Take Screenshot

Acesso a filas de trabalho
    browser.go to  ${link_cliente}wfl/abrirCadAutorizusuarioMenuWFlow.do
    get text       //td[@class='titulo'][contains(.,'${texto_acesso_filas}')]   *=    ${texto_acesso_filas}
    get text       //font[@class='subtitle'][contains(.,'${Fila de Trabalho}')]   *=    ${Fila de Trabalho}
    Take Screenshot

