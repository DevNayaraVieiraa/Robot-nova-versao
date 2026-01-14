*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Resource         solarBPMConsultasKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library    String

*** Keywords ***    
Cadastrar processo digital
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${ano_processo}       get current date  result_format=%Y
    ${detalhamento}       set variable     ${texto_detalhamento} (id - ${id_detalhamento})
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Sleep    1s
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${assunto_cadastro_processo}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${assunto_cadastro_processo}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento}
    Set Global Variable    ${detalhamento}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado}   browser.Get Text    (//input[contains(@type,'text')])[2] 
    ${num_processo_etapa1}  remove string  ${processo_cadastrado}  ${orgao}
    ${num_processo}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo}
    Set Global Variable    ${detalhamento}
    Set Global Variable    ${processo_cadastrado}
    Set Global Variable    ${ano_processo}
    ${texto_consulta}      Set Variable       Dados do Processo Digital
    Set Global Variable    ${texto_consulta}
    
Cadastrar processo físico
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${ano_processo}       get current date  result_format=%Y
    ${detalhamento}       set variable     ${texto_detalhamento} (id - ${id_detalhamento})
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${assunto_cadastro_processo}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${assunto_cadastro_processo}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Click        //input[contains(@id,'radioProcFisico')]
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento}
    Set Global Variable    ${detalhamento}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado}   browser.Get Text    (//input[contains(@type,'text')])[2] 
    ${num_processo_etapa1}  remove string  ${processo_cadastrado}  ${orgao}
    ${num_processo}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo}
    Set Global Variable    ${detalhamento}
    Set Global Variable    ${processo_cadastrado}
    Set Global Variable    ${ano_processo} 
    ${texto_consulta}      Set Variable       Dados do Processo Físico
    Set Global Variable    ${texto_consulta}

Cadastrar documento digital
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${ano_processo}       get current date  result_format=%Y
    ${detalhamento}       set variable     ${texto_detalhamento} (id - ${id_detalhamento})
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${assunto_cadastro_processo}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${assunto_cadastro_processo}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Click    //input[contains(@id,'radioProtDigital')]
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento}
    Set Global Variable    ${detalhamento}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro    
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado}   browser.Get Text    (//input[contains(@type,'text')])[2] 
    ${num_processo_etapa1}  remove string  ${processo_cadastrado}  ${orgao}
    ${num_processo}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo}
    Set Global Variable    ${detalhamento}
    Set Global Variable    ${processo_cadastrado}
    Set Global Variable    ${ano_processo}
    ${texto_consulta}      Set Variable       Dados do Documento Digital
    Set Global Variable    ${texto_consulta}

Cadastrar documento físico
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${ano_processo}       get current date  result_format=%Y
    ${detalhamento}       set variable     ${texto_detalhamento} (id - ${id_detalhamento})
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${assunto_cadastro_processo}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${assunto_cadastro_processo}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Click    //input[contains(@id,'radioProtFisico')]
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento}
    Set Global Variable    ${detalhamento}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro    
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado}   browser.Get Text    (//input[contains(@type,'text')])[2] 
    ${num_processo_etapa1}  remove string  ${processo_cadastrado}  ${orgao}
    ${num_processo}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo}
    Set Global Variable    ${detalhamento}
    Set Global Variable    ${processo_cadastrado}
    Set Global Variable    ${ano_processo}           
    ${texto_consulta}      Set Variable      Dados do Documento Físico
    Set Global Variable    ${texto_consulta}

Realizar autuação no sistema
    browser.go to  ${link_cliente}cpav/abrirConsultaAutuacao.do
    Prencher campos com número do processo (autuação)
    Click    //input[contains(@id,'botaoProximo')]
    Click    (//button[contains(.,'Não')])[1]
    Fill Text    //input[@id='assuntosIsHierarquicoDescricao']    ${assunto_cadastro_processo}
    Press Keys    //input[contains(@id,'assuntosIsHierarquicoDescricao')]   Tab
    Get Text    //input[contains(@id,'assuntosIsHierarquicoDescricao')]   *=   ${assunto_cadastro_processo}
    sleep    1s
    Click    //input[contains(@id,'btSalvar')]
    Get Text    //b[contains(.,'Operação realizada com sucesso')]   *=   Operação realizada com sucesso
    Set Global Variable    ${texto_consulta}

Cadastrar documento digital para juntada
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${ano_processo}       get current date  result_format=%Y
    ${detalhamento_para_juntada}       set variable      documento para juntada (id - ${id_detalhamento})
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${assunto_cadastro_processo}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${assunto_cadastro_processo}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Click    //input[contains(@id,'radioProtDigital')]
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento_para_juntada}
    Set Global Variable    ${detalhamento_para_juntada}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado_para_juntada}   browser.Get Text    (//input[contains(@type,'text')])[2] 
    ${num_processo_etapa1}  remove string  ${processo_cadastrado_para_juntada}  ${orgao}
    ${num_processo_para_juntada}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo_para_juntada}
    Set Global Variable    ${detalhamento_para_juntada}
    Set Global Variable    ${processo_cadastrado_para_juntada}
    Set Global Variable    ${ano_processo}
    ${texto_consulta_para_juntada}      Set Variable       Dados do Documento Digital
    Set Global Variable    ${texto_consulta_para_juntada}

Cadastrar processo digital para juntada
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${ano_processo}       get current date  result_format=%Y
    ${detalhamento_para_juntada}       set variable      processo para juntada (id - ${id_detalhamento})
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${assunto_cadastro_processo}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${assunto_cadastro_processo}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento_para_juntada}
    Set Global Variable    ${detalhamento_para_juntada}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado_para_juntada}   browser.Get Text    (//input[contains(@type,'text')])[2] 
    ${num_processo_etapa1}  remove string  ${processo_cadastrado_para_juntada}  ${orgao}
    ${num_processo_para_juntada}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo_para_juntada}
    Set Global Variable    ${detalhamento_para_juntada}
    Set Global Variable    ${processo_cadastrado_para_juntada}
    Set Global Variable    ${ano_processo}
    ${texto_consulta_para_juntada}      Set Variable       Dados do Processo Digital
    Set Global Variable    ${texto_consulta_para_juntada}    

Cadastrar processo digital para vinculação
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${ano_processo}       get current date  result_format=%Y
    ${detalhamento_para_juntada}       set variable      processo para vinculação (id - ${id_detalhamento})
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${assunto_cadastro_processo}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${assunto_cadastro_processo}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento_para_juntada}
    Set Global Variable    ${detalhamento_para_juntada}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro    
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado_para_juntada}   browser.Get Text    (//input[contains(@type,'text')])[2] 
    ${num_processo_etapa1}  remove string  ${processo_cadastrado_para_juntada}  ${orgao}
    ${num_processo_para_juntada}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo_para_juntada}
    Set Global Variable    ${detalhamento_para_juntada}
    Set Global Variable    ${processo_cadastrado_para_juntada}
    Set Global Variable    ${ano_processo}
    ${texto_consulta_para_juntada}      Set Variable       Dados do Processo Digital
    Set Global Variable    ${texto_consulta_para_juntada}    

Cadastrar processo digital para consulta por dados
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Sleep    1s
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${assunto_cadastro_processo}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${assunto_cadastro_processo}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento}
    Set Global Variable    ${detalhamento}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado}   browser.Get Text    (//input[contains(@type,'text')])[2]
    ${num_processo_etapa1}  remove string  ${processo_cadastrado}  ${orgao}
    ${num_processo}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo}
    Set Global Variable    ${detalhamento}
    Set Global Variable    ${processo_cadastrado}
    Set Global Variable    ${ano_processo}
    ${texto_consulta}      Set Variable       Dados do Processo Digital
    Set Global Variable    ${texto_consulta}

Cadastrar nova classificação
    Browser.Go To    ${link_cliente}pcl/abrirConClasse.do
    Click    //input[contains(@id,'btNovo')]

Preencher Dados Básicos
    ${id_classificacao}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_classificacao}       set variable      Classificação para teste (id - ${id_classificacao})
    Set Global Variable    ${texto_classificacao}
    Fill Text    //input[contains(@id,'cadastroClasseDTO.nmClasse')]    ${texto_classificacao}    
    Click    //input[contains(@id,'cadastroClasseDTO.flAssociaDoc')]
    Click    //input[@id='btSalvar']
    Get Text    //span[contains(.,'Operação realizada com sucesso.')]   *=  Operação realizada com sucesso.

Preencher aba Configurações
    click    //span[contains(@id,'2')][contains(.,'Configurações')]
    Click    //input[contains(@id,'tpProcProcessoDigital')]
    Click    //input[contains(@id,'tpAssinaturaSistema')]
    Click    //input[contains(@id,'tpProcProcessoIcp')]
    Click    //input[contains(@id,'tpPadraoAssinaturaPades')]
    Click    //input[contains(@id,'tpPadraoAssinaturaCades')]
    Click    //input[contains(@id,'btNovaLinhaOrgao')]
    Fill Text    //input[@id='orgao.sgOrgaoSetor']    SOLARBPM    
    Press Keys   //input[@id='orgao.sgOrgaoSetor']    Tab
    Get Text     //input[@id='orgao.nmOrgaoSetor']    *=   Órgão Padrão do Sistema SolarBPM
    Fill Text    //input[@id='setor.sgOrgaoSetor']    Digital
    Press Keys   //input[@id='setor.sgOrgaoSetor']    Tab
    Get Text     //input[@id='setor.nmOrgaoSetor']    *=    DIGITAL
    Click    //button[contains(@id,'OrgaoFormConfirmar')]
    Get Text    //input[contains(@id,'orgao[0].orgao.sgOrgaoSetor_0')]    *=    SolarBPM
    Get Text    //input[contains(@id,'orgao[0].setor.sgOrgaoSetor_0')]    *=    DIGITAL
    Click    //input[contains(@id,'flApareceCPA')]
    Click    //input[contains(@id,'btProcurarPerfil')]
    Fill Text    //*[@id="layerFormConsulta"] >>> //input[contains(@id,'entity.nmGrupo')]   Usuário administrador do CPA
    Sleep    1s
    Click        //*[@id="layerFormConsulta"] >>> //input[contains(@id,'pbProcurar')]
    Get Text     //*[@id="layerFormConsulta"] >>> //td[@width='*'][contains(.,'Quantidade de registros: 1')]   *=  Quantidade de registros: 1
    Click        //*[@id="layerFormConsulta"] >>> //input[contains(@type,'checkbox')]
    Click        //*[@id="layerFormConsulta"] >>> //input[contains(@id,'pbSelecionar')]
    Click    //input[contains(@id,'btSalvar')]
    Get Text    //span[contains(.,'Operação realizada com sucesso.')]   *=   Operação realizada com sucesso.

Cadastrar processo digital com nova classificação
    ${id_detalhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${ano_processo}       get current date  result_format=%Y
    ${detalhamento}       set variable      Processo com classificação criada em automação (id - ${id_detalhamento})
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Sleep    1s
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${texto_classificacao}
    Sleep    1s
    Get Text    //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/header/h6   *=   ${texto_classificacao}
    click        //*[@id="root"]/main/div/section[2]/section[2]/div/div/section/div[2]/div/article/footer/a
    Browser.Fill Text    //*[@id="entity.principalInteressado.nuIdentFormatado"]    ${cpf_interessado}
    press keys       //*[@id="entity.principalInteressado.nuIdentFormatado"]     Tab
    Wait For Condition  text  //*[@id="entity.principalInteressado.nmInteressado"]   *=  ${nome_interessado}
    browser.Fill Text    //textarea[@id='entity.deComplemento']    ${detalhamento}
    Set Global Variable    ${detalhamento}
    click    //input[contains(@id,'botaoSalvar')]
    Get Text    //*[@id="BotaoSalvar"]  *=  Concluir cadastro
    click    //*[@id="BotaoSalvar"]
    browser.Get Text    //*[@id="spwTabelaMensagem"]/table[1]/tbody/tr[1]/td[2]/b   *=  Operação realizada com sucesso
    ${processo_cadastrado}   browser.Get Text    (//input[contains(@type,'text')])[2] 
    ${num_processo_etapa1}  remove string  ${processo_cadastrado}  ${orgao}
    ${num_processo}         Remove String  ${num_processo_etapa1}  /${ano_processo}
    Set Global Variable    ${num_processo}
    Set Global Variable    ${detalhamento}
    Set Global Variable    ${processo_cadastrado}
    Set Global Variable    ${ano_processo}
    ${texto_consulta}      Set Variable       Dados do Processo Digital
    Set Global Variable    ${texto_consulta}

Inativar classificação
    Browser.Go To    ${link_cliente}pcl/abrirConClasse.do
    Fill Text    //input[@id='nmClasseCompleto']    ${texto_classificacao}
    Click        //input[@id='btConsultar']
    Get Text    //span[@title='${texto_classificacao}'][contains(.,'${texto_classificacao}')]   *=   ${texto_classificacao}
    Click    (//a[@name_='editar'])[1]
    Click    //input[contains(@id,'cadastroClasseDTO.flForaUso')]
    Click    //input[contains(@id,'cadastroClasseDTO.flAssociaDoc')]
    Click    //input[contains(@id,'btSalvar')]
    Get Text    //span[contains(.,'Operação realizada com sucesso.')]   *=   Operação realizada com sucesso. 

Garantir que não é possível selecionar classificação inativa
    browser.go to  ${link_cliente}cpav/abrirCadastroProcesso.do
    Sleep    1s
    Fill Text    //*[@id="root"]/main/div/section[2]/section[1]/div/div/div[1]/div[2]/div/div/input    ${texto_classificacao}
    Sleep    1s
    Get Text    //strong[@class='sds-subtitle'][contains(.,'Nenhum resultado encontrado')]   *=   Nenhum resultado encontrado

Acessar tela de Cadastro do Interessado
    browser.go to     ${link_cliente}cpav/abrirConsultaSujeito.do
 
Clicar em NOVO
    click  //input[@value='Novo']
 
Preencher Formulario de Cadastro do Interessado
    ${CPF}=    FakerLibrary.Cpf
    ${nomeInteressado}=   FakerLibrary.Name
    Set Global Variable    ${CPF}
    Set Global Variable    ${nomeInteressado}
    Fill Text    //input[@id='entity.nmSujeito']    ${nomeInteressado}
    Fill Text    //input[@name='nuCpf']             ${CPF}
    ${nome}=    Get text   //input[@id='entity.nmSujeito']    
    ${cpf}=    Get Text  //input[@name='nuCpf']
    ${titulo}=    Get Text    //font[normalize-space()='Dados do Interessado']
    Should Contain    ${titulo}    Dados do Interessado
    Fill Text   //input[@id='campoCEP']    01310000
    Click     //*[@id="pbPesquisaCep"]
    Fill Text    //input[@id='entity.endereco.nuNumero']  4103
   
Clicar em SALVAR
    Sleep  1s
    Click  //input[@value='Salvar']
    Get Text    //li[contains(text(),'As informações foram atualizadas com sucesso no ba')]   *=   As informações foram atualizadas com sucesso no banco de dados.    timeout=15s
 
Clicar em VOLTAR
    Click  //*[@id='pbVoltar']
 
Consultar Interessados
    Select Options By    //select[@id='sujeito.tpSujeito']    value  F
    Fill Text   //input[@id='nuCpf']   ${CPF}  
    Click  //*[@name='btSubmit']
    Click  //tr[@id='linhaSujeitos_0']//img[@title='Abre a edição do registro']
 
Validar Consulta do Interessado Cadastrado
    Get Text    //input[@id='entity.nmSujeito']    *=   ${nomeInteressado}
    Get Text    //input[@name='nuCpf']   *=   ${CPF}

