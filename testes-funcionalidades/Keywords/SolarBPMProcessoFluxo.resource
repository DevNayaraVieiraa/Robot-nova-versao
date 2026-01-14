*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Resource         ../Keywords/solarBPMTarefasKeywords.resource
Resource         ../Keywords/portalExternoKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Cadastrar processo com fluxo
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${detalhamento}   Set Variable         Processo cadastrado com fluxo básico (id - ${id_detalhamento})
    ${ano_processo}       get current date  result_format=%Y
    Set Global Variable    ${detalhamento}
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Sleep    1s
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    Classificação para testes de fluxo - ROBOT
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   Classificação para testes de fluxo - ROBOT
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Fill Text    //*[@id="element_16655"]    ${cpf_interessado}
    Fill Text    //*[@id="element_58595"]    ${detalhamento}
    Browser.Click    //*[@id="element_24995_0"]
    Browser.Click    (//a[normalize-space()='Enviar'])[1]
    ${processo_cadastrado}    Get Text    //html/body/div[2]/table[2]/tbody/tr[2]/td[2]/input
    ${num_processo_etapa1}  remove string  ${processo_cadastrado}  ${orgao}
    ${num_processo}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${processo_cadastrado}
    Set Global Variable    ${num_processo}
    Set Global Variable    ${ano_processo}
    Browser.Click    (//input[@name='btnPasta'])[1]
    ${texto_consulta}      Set Variable       Dados do Processo Digital
    Set Global Variable    ${texto_consulta}    
    Conferir que fluxo está com situação "Em andamento"

Conferir que fluxo está com situação "Em andamento"
    Browser.Click    //*[@id="aba_processo"]/span/a
    Browser.Get Text    (//p[normalize-space()='Em execução'])[1]   *=   Em execução

Garantir que tarefa foi gerada
    Conferir que fluxo está com situação "Em andamento"
    Click    //*[@id="aba_tarefas"]/span/a   
    Sleep    2s
    Select options by    //*[@id="frameTarefas"] >>> //select[contains(@id,'filtroSituacao')]   value   ABERTA
    Get Element States    //*[@id="frameTarefas"] >>> //ngmessagecenter-message//strong[contains(text(), 'Erro')]   not contains    visible
    sleep       1s
    ${tarefa_aberta}    Run Keyword And Return Status    Get Text    //*[@id="frameTarefas"] >>> //*[@id="divPagination"]/div[1]     *=    Qtde de registros: 1
    Run Keyword If    '${tarefa_aberta}' == 'True'    No Operation
    ...  ELSE          Garantir que tarefa foi gerada
    sleep        1s

Garantir que tarefa de assinatura foi gerada
    Conferir que fluxo está com situação "Em andamento"
    Click    //*[@id="aba_tarefas"]/span/a
    Sleep    2s
    Get Element States    //*[@id="frameTarefas"] >>> //ngmessagecenter-message//strong[contains(text(), 'Erro')]   not contains    visible
    Select options by    //*[@id="frameTarefas"] >>> //select[contains(@id,'filtroSituacao')]   value   ABERTA
    Sleep    2s
    ${tarefa_aberta}    Run Keyword And Return Status    Get Text    //*[@id="frameTarefas"] >>> //*[@id="divPagination"]/div[1]     *=    Qtde de registros: 2
    Run Keyword If    '${tarefa_aberta}' == 'True'    No Operation
    ...  ELSE         Garantir que tarefa de assinatura foi gerada

Finalizar "Tarefa para tomada de decisão" encaminhando para decisão 1
    Garantir que tarefa foi gerada
    Click    //*[@id="frameTarefas"] >>> (//span[@class='ng-binding'])[1]
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="aba_dados_finalizacao"]/a
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//input[@id='opcaoDecisao_0'])[1]
    Fill Text    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//textarea[@id='textoFinalizarTomadaDecisao'])[1]    Texto para orientar setor decidir sobre tarefa
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//a[normalize-space()='Ação'])[1]
    Conferir que fluxo está com situação "Em andamento"

Realizar reprovação em "Tarefa de decisão 1"
    Garantir que tarefa foi gerada
    Click    //*[@id="frameTarefas"] >>> (//span[@class='ng-binding'])[1]
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="aba_dados_finalizacao"]/a
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//input[@id='opcaoDecisao_1'])[1]
    Fill Text    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> //*[@id="textoReprova"]    Texto para reprovar tarefa
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//a[normalize-space()='Ação'])[1]
    Conferir que fluxo está com situação "Em andamento"

Finalizar "Tarefa para tomada de decisão" encaminhando para decisão 2
    Garantir que tarefa foi gerada
    Click    //*[@id="frameTarefas"] >>> (//span[@class='ng-binding'])[1]
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="aba_dados_finalizacao"]/a
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//input[@id='opcaoDecisao_1'])[1]
    Fill Text    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//textarea[@id='textoFinalizarTomadaDecisao'])[1]    Texto para orientar setor decidir sobre tarefa 2
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//a[normalize-space()='Ação'])[1]
    Conferir que fluxo está com situação "Em andamento"

Realizar aprovação em "Tarefa de decisão 2"
    Garantir que tarefa foi gerada
    Click    //*[@id="frameTarefas"] >>> (//span[@class='ng-binding'])[1]
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="aba_dados_finalizacao"]/a
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//input[@id='opcaoDecisao_0'])[1]
    Fill Text    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> //*[@id="textoFinalizarDecisao"]    Texto aprovação de tarefa
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//a[normalize-space()='Ação'])[1]
    Conferir que fluxo está com situação "Em andamento"

Inserir documento em tarefa para criação de pendencias de assinatura
    Garantir que tarefa foi gerada
    Click    //*[@id="frameTarefas"] >>> (//span[@class='ng-binding'])[1]
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="aba_dados_finalizacao"]/a
    Upload File By Selector  //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> //html/body/input     ${CURDIR}\\pdf exemplo.pdf
    Get Text    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//a[normalize-space()='pdf exemplo.pdf'])[1]    *=     pdf exemplo.pdf
    Fill Text    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> //*[@id="textoSolicitarAssinatura"]    Realizar assinatura corretamente
    Click    //*[@id="layerFormConsultaframe_visualizar_tarefa"] >>> //*[@id="frameVisualizar"] >>> (//a[normalize-space()='Ação'])[1]
    Conferir que fluxo está com situação "Em andamento"
    Garantir que tarefa de assinatura foi gerada
    
Realizar assinatura de documento em portal Portal externo
    Realizar login no portal externo
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_assinatura_portal_externo}   Set Variable         Documento assinado pelo portal externo (id - ${id_detalhamento})
    Set Global Variable    ${texto_assinatura_portal_externo}
    Click       (//span[contains(.,'Minhas Pendências')])[1]
    Get Text    (//span[contains(.,'Minhas Pendências')])[2]   *=   Minhas Pendências
    Click       //a[contains(.,'${processo_cadastrado}')]
    Get Text    //span[contains(.,'${detalhamento}')]   *=  ${detalhamento}
    Click       (//span[contains(.,'Resolver Pendência')])[2]
    click       //input[@type='checkbox']
    Fill Text    //textarea[contains(@id,'de_descricao')]    ${texto_assinatura_portal_externo}
    click    //span[contains(.,'Concluir tarefa')]
    Click        //*[@id="iframeGdoc"] >>> //html/body/div[1]/div/div[1]/signature-type-selector/div/div/div/div/selectable-card[3]/div/div/img
    Fill Text    //*[@id="iframeGdoc"] >>> //html/body/div[1]/div/div[2]/system-signature-form/div/div[1]/div/div/input    SolarRobot@1
    Click    //*[@id="iframeGdoc"] >>> //html/body/div[1]/div/div[2]/system-signature-form/div/div[3]/div/div/gdfront-button[2]/button
    Get Text     //span[contains(.,'Pendência finalizada com sucesso!')]   *=     Pendência finalizada com sucesso!

Realizar assinatura de documento em portal interno
    Login SolarBpm - Autenticar com login padrão
    Go To    ${link_cliente}fila-assinatura-frontend?userId=${user_robot}
    Click    //*[@id="root"]/div/div[1]/div/div[1]/div[1]/div/label[1]/span[1]/span[1]/input
    Click    (//span[normalize-space()='Concluir'])[1]
    Fill text    //html/body/div[2]/div[3]/iframe >>> //html/body/div[1]/div/div[2]/system-signature-form/div/div[1]/div/div/input   ${senha_robot}
    click        //html/body/div[2]/div[3]/iframe >>> //html/body/div[1]/div/div[2]/system-signature-form/div/div[3]/div/div/gdfront-button[2]/button
    Get Text    (//span[@id='message-id'])[1]     *=     Documentos assinados com sucesso!

Confirmar dados de tarefas finalizadas
    Consultar cadastro realizado - consulta por número de documento
    click    //*[@id="aba_pecas"]/span/a
    click    //*[@id="frameNPasta"] >>> (//*[name()='svg'][@role='img'])[42]    
    Get Text    //*[@id="frameNPasta"] >>> (//h3[normalize-space()='Assinatura digital - Assinado'])[1]   *=    Assinatura digital - Assinado
    Get Text    //*[@id="frameNPasta"] >>> (//p[contains(text(),'USUÁRIO PARA VALIDAÇÃO - TESTES AUTOMATIZADOS, INT')])[1]   *=    USUÁRIO PARA VALIDAÇÃO - TESTES AUTOMATIZADOS, INTERESSADO TESTE - ROBOT
    Garantir que não existe tarefas em aberto

Confirmar dados de processo arquivado
    Click    //*[@id="aba_processo"]/span/a
    Get Text    //*[@id="processo"]/div[1]/div[2]/p     *=    Este processo encontra-se fora da fila de trabalho. Motivo: Arquivado.    

Garantir que não existe tarefas em aberto
    Click    //*[@id="aba_tarefas"]/span/a
    sleep    2s
    Select options by    //*[@id="frameTarefas"] >>> //select[contains(@id,'filtroSituacao')]   value   ABERTA
    sleep    1s
    ${tarefa_aberta}    Run Keyword And Return Status    Get Text    //*[@id="frameTarefas"] >>> (//b[normalize-space()='Não há tarefas na situação selecionada'])[1]    *=    Não há tarefas na situação selecionada
    Run Keyword If    '${tarefa_aberta}' == 'True'    No Operation
    ...  ELSE         Garantir que não existe tarefas em aberto

