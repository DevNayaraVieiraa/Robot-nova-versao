*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Areas de interesse
    browser.go to  ${link_cliente}cpavservicoadm/abrirCadAreaInteresse.do
    get text       //h1[contains(.,'${texto_area_interesse}')]   *=    ${texto_area_interesse}
    Take Screenshot

Serviços
    browser.go to  ${link_cliente}cpavservicoadm/abrirConsultaServico.do
    get text       //h1[contains(.,'${texto_consulta_servicos}')]   *=    ${texto_consulta_servicos}
    get text       //label[@for='entity.servicoPK.cdServico'][contains(.,'${texto_cod_servico}')]   *=    ${texto_cod_servico}
    Take Screenshot

