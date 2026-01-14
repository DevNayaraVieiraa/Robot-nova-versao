*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Validar tela de modelo de documentos
    browser.go to  ${link_cliente}ecm/abrirConsultaModelodoc.do
    Browser.get text  (//font[@class='subtitle'])[2]  *=  Resultados da Consulta


Cadastro de Modelo de Documentos
    ${id_documento}    FakerLibrary.Random Int  min=5000  max=6000
    browser.go to  ${link_cliente}ecm/abrirConsultaModelodoc.do
    browser.Click    //input[contains(@id,'btNovo')]
    browser.fill text  //input[contains(@id,'entity.modelodoc.sistema.sgSistema')]  CPAV
    browser.Press Keys    //input[contains(@id,'entity.modelodoc.sistema.sgSistema')]   Tab
    browser.Click        //*[@id="layerFormConsulta"] >>> //td[@bgcolor='#FFFFFF'][contains(.,'Sistema de Gestão de Processos Digitais')]
    Browser.Click        //*[@id="layerFormConsulta"] >>> //input[contains(@id,'pbSelecionar')]
    browser.Fill Text    //input[contains(@id,'nmDoc')]    Modelo Teste Robot (id - ${id_documento})
    browser.Fill Text    //input[contains(@id,'entity.modelodoc.cdTipodocdigital')]    29
    browser.Press Keys    //input[contains(@id,'entity.modelodoc.cdTipodocdigital')]   Tab
    Browser.Get Text    //input[contains(@id,'entity.modelodoc.tipodocdigital.deTipodocdigital')]   *=  Anexos
    Select Options By    //select[contains(@name,'entity.modelodoc.tpEditordoc')]    value  L
    Click    //input[contains(@id,'btSalvar')]
    browser.Click    //input[contains(@id,'btReservar')]
    browser.click    //input[contains(@id,'btEditar')]
    Get Text    //*[@id="onlyOffice"] >>> //strong[contains(.,'Seu documento será salvo automaticamente')]  *=  Seu documento será salvo automaticamente
    Click    //input[contains(@id,'btVoltar')]
    Click    //input[contains(@id,'btLiberar')]
    Get Text    //li[contains(.,'O modelo de anexo foi liberado para uso por outros usuários')]  *=  O modelo de anexo foi liberado para uso por outros usuários
    Browser.Take Screenshot
