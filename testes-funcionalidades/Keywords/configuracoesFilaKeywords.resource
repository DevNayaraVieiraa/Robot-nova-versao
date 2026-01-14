*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Permitir acesso a minha fila de trabalho
    browser.go to  ${link_cliente}wfl/abrirAssociarUsuariosMenuWFlow.do
    get text  //font[contains(@class,'subtitle')]  *=  Permitir que os Usuários abaixo vejam minha Fila de Trabalho

Consultar processo em fila de trabalho
    Browser.Go To    ${link_cliente}cpavFilaTrabalho/abrirFilaTrabalho.do?cdUsuarioFila=ROBOT&view=Todos&taskName=&cdVisualizacao=2&tipo=Digitais&expandido=true
    Get Text    //h1[contains(.,'Processos da Fila de Trabalho')]   *=  Processos da Fila de Trabalho

Configurar fila de trabalho
    log   script para ralizar o teste da configuração da fila
