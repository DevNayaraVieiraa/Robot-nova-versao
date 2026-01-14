*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Resource         solarBPMCadastrosKeywords.resource
Resource         solarBPMConsultasKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library    String

*** Keywords ***    
Criar tarefa padrão
    click        //button[contains(@id,'botaoCriarTarefa')]
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[contains(@class,'fa fa-search')])[1]
    Fill Text    //*[@id="layerFormConsultaframe_tarefa"] >>> (//input[contains(@type,'text')])[2]         Tarefa de teste padrão
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[contains(@class,'fa fa-search')])[2]
    Wait For Condition  text     //*[@id="layerFormConsultaframe_tarefa"] >>> //td[@class='sp-bold-sm ng-binding'][contains(.,'Tarefa de teste padrão')]   *=   Tarefa de teste padrão
    sleep        1s
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> //input[contains(@type,'radio')]
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> //button[@type='button'][contains(.,'Selecionar')]

    click        //*[@id="layerFormConsultaframe_tarefa"] >>> //button[@class='btn btn-primary ng-binding'][contains(.,'Próximo')]
    fill text    //*[@id="layerFormConsultaframe_tarefa"] >>> //textarea[contains(@id,'descricao')]       Tarefa para teste ROBOT
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[contains(@class,'fa fa-search')])[1]
    Fill Text    //*[@id="layerFormConsultaframe_tarefa"] >>> (//input[contains(@type,'text')])[3]    ${user_robot}
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[contains(@class,'fa fa-search')])[2]
    sleep       3s
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//td[contains(@class,'sp-bold-sm ng-binding')])[2]
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> //button[@type='button'][contains(.,'Selecionar')]
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> //button[contains(.,'Criar tarefa')]
    Get Text     //li[contains(.,'A tarefa foi criada com sucesso.')]   *=  A tarefa foi criada com sucesso.

Finalizar tarefa padrão pela fila de trabalho
    browser.Go To       ${link_cliente}cpavFilaTrabalho/abrirFilaTarefa.do?cdUsuarioFila=${user_robot}&view=Tarefas&taskName=&cdVisualizacao=20
    Fill Text    //input[contains(@id,'filtro-texto')]    ${processo_cadastrado}
    click        //input[contains(@type,'submit')]
    Get Text     (//div[contains(@class,'info')])[2]    *=   ${detalhamento}
    sleep        1s
    Click    (//div[contains(@class,'info clickable')])[1]
    Click    //*[@id="customIframe"] >>> //*[@id="aba_tarefas"]/span/a
    Click    //*[@id="customIframe"] >>> //*[@id="frameTarefas"] >>> //span[@class='ng-binding'][contains(.,'Tarefa de teste padrão')]
    click    //*[@id="customIframe"] >>> //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //a[@ng-click='select()'][contains(.,'Dados de finalização')]

    Fill Text    //*[@id="customIframe"] >>> //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> //textarea[contains(@class,'form-control ng-pristine ng-untouched ng-invalid ng-invalid-required')]    Texto padrão para finalização de tarefa
    Click    //*[@id="customIframe"] >>> //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> //button[@class='sds-btn sds-btn--raised sds-waves-effect'][contains(.,'Finalizar tarefa')]
    browser.Get Text    //*[@id="customIframe"] >>> //b[contains(.,'Operação realizada com sucesso')]    *=   Operação realizada com sucesso
    Select options by    //*[@id="customIframe"] >>> //*[@id="frameTarefas"] >>> //select[contains(@id,'filtroSituacao')]   value   FINALIZADA
    Get Text    //*[@id="customIframe"] >>> //*[@id="frameTarefas"] >>> //span[@class='ng-binding'][contains(.,'Tarefa de teste padrão')]  *=   Tarefa de teste padrão

Cadastrar tarefa do tipo Comunique-se
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_tarefa_comuniquese}   Set Variable         Tarefa para responder comunique-se (id - ${id_detalhamento})
    Set Global Variable    ${texto_tarefa_comuniquese}
    click        //button[contains(@id,'botaoCriarTarefa')]
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[contains(@class,'fa fa-search')])[1]
    Fill Text    //*[@id="layerFormConsultaframe_tarefa"] >>> (//input[contains(@type,'text')])[2]         Comunique-se
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[contains(@class,'fa fa-search')])[2]
    Wait For Condition  text     //*[@id="layerFormConsultaframe_tarefa"] >>> (//td[normalize-space()='Comunique-se'])[1]   ==   Comunique-se
    sleep        1s
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//input[@type='radio'])[1]
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> //button[@type='button'][contains(.,'Selecionar')]
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> //button[@class='btn btn-primary ng-binding'][contains(.,'Próximo')]
    fill text    //*[@id="layerFormConsultaframe_tarefa"] >>> //textarea[contains(@id,'descricao')]       ${texto_tarefa_comuniquese}
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[@class='fa fa-search'])[3]
    Keyboard Key    press    PageUp
    Fill Text    //*[@id="layerFormConsultaframe_tarefa"] >>> (//input[@ng-model='grupossetorusuarioModalController.modalFilter.sgGrupo'])[1]    ${user_robot}
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[@class='fa fa-search'])[4]
    sleep       3s
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//td[contains(@class,'sp-bold-sm ng-binding')])[2]
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//button[@ng-click='grupossetorusuarioModalController.modalSelect()'])[1]
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[@class='fa fa-search'])[5]
    Fill Text    //*[@id="layerFormConsultaframe_tarefa"] >>> (//input[@ng-model='grupossetorusuarioModalController.modalFilter.sgGrupo'])[1]    ${user_robot}
    Keyboard Key    press    PageUp
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//i[@class='fa fa-search'])[4]
    sleep       3s
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//input[@ng-show='grupossetorusuarioModalController.isMultiSelecao'])[1]
    Click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//button[@ng-click='grupossetorusuarioModalController.modalSelect()'])[1]
    click        //*[@id="layerFormConsultaframe_tarefa"] >>> (//button[normalize-space()='Salvar'])[1]
    get text     (//li[normalize-space()='A tarefa Comunique-se foi criada com sucesso.'])[1]   *=    A tarefa Comunique-se foi criada com sucesso.


Finalizar tarefa de análise de resposta do comunique-se
    browser.Go To       ${link_cliente}cpavFilaTrabalho/abrirFilaTarefa.do?cdUsuarioFila=${user_robot}&view=Tarefas&taskName=&cdVisualizacao=20
    Fill Text    //input[contains(@id,'filtro-texto')]    ${processo_cadastrado}
    click        //input[contains(@type,'submit')]
    Get Text     (//div[contains(@class,'info')])[2]    *=   ${detalhamento}
    Click    (//div[contains(@class,'info clickable')])[1]
    Click    //*[@id="customIframe"] >>> //a[@href='#'][contains(.,'Tarefas')]
    Click    //*[@id="customIframe"] >>> //*[@id="frameTarefas"] >>> //span[@class='ng-binding'][contains(.,'Analisar resposta do Comunique-se')]
    click    //*[@id="customIframe"] >>> //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //a[@ng-click='select()'][contains(.,'Dados de finalização')] 

    Fill Text    //*[@id="customIframe"] >>> //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//textarea[@id='descricaoFinalizacao'])[1]    Texto padrão para finalização de tarefa
    Click        //*[@id="customIframe"] >>> //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//button[normalize-space()='Finalizar tarefa'])[1]
    browser.Get Text    //*[@id="customIframe"] >>> //b[contains(.,'Operação realizada com sucesso')]    *=   Operação realizada com sucesso
    Select options by    //*[@id="customIframe"] >>> //*[@id="frameTarefas"] >>> //select[contains(@id,'filtroSituacao')]   value   FINALIZADA
    Get Text    //*[@id="customIframe"] >>> //*[@id="frameTarefas"] >>> //span[@class='ng-binding'][contains(.,'Analisar resposta do Comunique-se')]  *=   Analisar resposta do Comunique-se