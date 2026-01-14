*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-checklist.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Validar tela de modelo de documentos
    browser.go to  ${link_cliente}ecm/abrirConsultaModelodoc.do
    Browser.get text  (//font[@class='subtitle'])[2]  *=  ${texto_resultados_consulta}

