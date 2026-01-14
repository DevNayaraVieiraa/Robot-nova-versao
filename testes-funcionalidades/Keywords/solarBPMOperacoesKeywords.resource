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
Clicar em encaminhar processo
    Click    //button[@id='dropDownButton']
    Click    //*[@id="botaoEncaminhar"]

Realizar encaminhamento
    ${id_encaminhamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_encaminhamento}       set variable     Encaminhamento de processo (id - ${id_encaminhamento})
    Set Global Variable    ${texto_encaminhamento}
    Fill Text    //input[contains(@id,'dto.tipoParecer.cdTipoParecer')]    78
    Press Keys    //input[contains(@id,'dto.tipoParecer.cdTipoParecer')]   Tab
#    Get Text      //input[contains(@id,'dto.tipoParecer.deTipoParecer')]   *=  Encaminhamento
    Fill Text    //textarea[contains(@id,'deParecer')]    ${texto_encaminhamento}
    Select Options By    //select[contains(@id,'acaoSelecionada')]    value  setor
    Fill Text    //input[contains(@id,'dto.setor.sgOrgaoSetor')]    ${setor_encaminhamento}
    Press Keys    //input[contains(@id,'dto.setor.sgOrgaoSetor')]   Tab
    get text     //input[@id='dto.setor.nmOrgaoSetor']    *=    ${desc_setor_encaminhamento}
    Click    //input[contains(@id,'btnEncaminhar')]

Validar mensagem "Operação realizada com sucesso"    
    Get Text    //b[contains(.,'Operação realizada com sucesso')]  *=  Operação realizada com sucesso

Consultar tramitação de processo
    Click    //a[@href='#'][contains(.,'Tramitações')]
    Get Text    (//div[contains(.,'${setor_encaminhamento}')])[8]   *=  ${setor_encaminhamento}
    Click    //span[contains(.,'Encaminhamento')]
    get text  //p[@class='sds-p'][contains(.,'${texto_encaminhamento}')]   *=  ${texto_encaminhamento}
    Click    //i[@class='material-icons sds-btn__icon sds-btn--right'][contains(.,'close')]

Realizar recebimento de processo pela tela de consulta
    Click    //button[@id='dropDownButton']
    Click    //*[@id="botaoReceber"]
    Handle Future Dialogs    action=ACCEPT

Clicar em encaminhar processo pela fila de trabalho
    Click    (//div[contains(@class,'check')])[1]
    Click    //a[contains(.,'Encaminhar...')]

Validar mensagem "Encaminhamento realizado com sucesso"
    Get Text    //p[contains(.,'Encaminhamento realizado com sucesso.')]    *=  Encaminhamento realizado com sucesso.

Realizar recebimento de processo pela fila de trabalho    
    Click    (//div[contains(@class,'check')])[1]
    Click    //a[contains(@id,'RECEBER_PROCESSO')]
    Get Text    //div[contains(@class,'subject success-message')]   *=   Recebimento realizado com sucesso.

Clicar em arquivar processo pela tela de consulta
    Click    //button[@id='dropDownButton']
    Click    //*[@id="botaoArquivar"]
    
Realizar arquivamento
    ${id_arquivamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_arquivamento}       set variable     Realizar arquivamento (id - ${id_arquivamento})
    Set Global Variable    ${texto_arquivamento}
    Clear Text    //textarea[@id='ultTramiteVol.deParecer']
    Fill Text    //textarea[@id='ultTramiteVol.deParecer']    ${texto_arquivamento}
    click    //button[contains(@id,'RowFormConfirmar')]
    Click    //input[contains(@id,'btArquivar')]
    
Confirmar dados de arquivamento
    get Text    //p[@class='sds-p'][contains(.,'Este processo encontra-se fora da fila de trabalho. Motivo: Arquivado.')]   *=  Este processo encontra-se fora da fila de trabalho. Motivo: Arquivado.
    click       //*[@id="aba_dados_adicionais"]
    Click    //*[@id="dadosAdicionaisProcesso"]/div/div[4]/div/div/div/div/div/div/div[1]/table/tbody/tr/td[5]/a/i
    Get Text    //p[@class='sds-p'][contains(.,'${texto_arquivamento}')]   *=   ${texto_arquivamento}
    Click    //i[@class='material-icons sds-btn__icon sds-btn--right'][contains(.,'close')]

Clicar em desarquivar processo pela tela de consulta
    Click    //button[@id='dropDownButton']
    Click    //*[@id="botaoDesarquivar"]

Realizar desarquivamento
    ${id_desarquivamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_desarquivamento}       set variable     Realizar arquivamento (id - ${id_desarquivamento})
    Set Global Variable    ${texto_desarquivamento}
    Clear Text    //textarea[contains(@id,'deJustificativa')]
    Fill Text    //textarea[contains(@id,'deJustificativa')]    ${texto_desarquivamento}
    Click    //input[contains(@name,'btnReabrir')]

Confirmar dados de desarquivamento
    click       //*[@id="aba_dados_adicionais"]
    Click    //*[@id="dadosAdicionaisProcesso"]/div/div[4]/div/div/div/div/div/div/div[1]/table/tbody/tr/td[5]/a/i
    Get Text    //p[@class='sds-p'][contains(.,'${texto_desarquivamento}')]   *=   ${texto_desarquivamento}
    Click    //i[@class='material-icons sds-btn__icon sds-btn--right'][contains(.,'close')]    

Clicar em arquivar processo pela fila de trabalho
    Click    (//div[contains(@class,'check')])[1]
    Click    //a[contains(@class,'more-options-button')]
    Click    //*[@id="ARQUIVAR_PROCESSO"]

Realizar confirmação de arquivamento e exclusão de processo da fila
    Get Text    //span[contains(.,'Operação realizada com sucesso')]   *=   Operação realizada com sucesso
    Get Text    //div[contains(@id,'empty')]        *=    Nenhum registro.

Inserir documento na pasta digital
    Click    //a[@href='#'][contains(.,'Anexos')]
    click    iframe#frameNPasta >>> //*[@id="line-buttons"]/div[1]/button
    sleep  1s
    Upload File By Selector  iframe#frameNPasta >>> //*[@id="root"]/div/div[2]/div/form/div/div[1]/section/input     ${CURDIR}\\pdf exemplo.pdf
    Wait For Elements State    iframe#frameNPasta >>> //button[@type='submit'][contains(.,'Enviar')]    enabled
    click    iframe#frameNPasta >>> //button[@type='submit'][contains(.,'Enviar')]    
    Get Text    iframe#frameNPasta >>> //div[@role='status'][contains(.,'Documento(s) inserido(s) com sucesso.')]  *=  Documento(s) inserido(s) com sucesso.

Realizar juntada de documento a processo
    Click    //a[@href='#'][contains(.,'Juntadas/Vinculações')]
    Click    (//i[@class='material-icons'][contains(.,'add')])[1]
    Click    //*[@id="sidemodal-iframe"] >>> //input[contains(@id,'btNovaLinhaRow')]
    Informar processo (juntada)
    Click        //*[@id="sidemodal-iframe"] >>> //button[contains(@id,'RowFormConfirmar')]
    Click        //*[@id="sidemodal-iframe"] >>> //input[contains(@id,'botaoSubmit')]
    Get Text     //*[@id="sidemodal-iframe"] >>> //li[contains(.,'Cadastro realizado com sucesso.')]   *=   Cadastro realizado com sucesso.
    Click        //i[@class='material-icons'][contains(.,'close')]

Realizar juntada de processo
    Click    //a[@href='#'][contains(.,'Juntadas/Vinculações')]
    Click    (//i[@class='material-icons'][contains(.,'add')])[2]
    Click    //*[@id="sidemodal-iframe"] >>> //input[contains(@id,'btNovaLinhaRow')]
    Informar processo (juntada)
    Click        //*[@id="sidemodal-iframe"] >>> //button[contains(@id,'RowFormConfirmar')]
    Clear Text    //*[@id="sidemodal-iframe"] >>> //textarea[@id='deMotivo']
    Fill Text     //*[@id="sidemodal-iframe"] >>> //textarea[@id='deMotivo']    Juntada de processo 
    Click        //*[@id="sidemodal-iframe"] >>> //input[contains(@value,'Salvar')]    
    Get Text     //*[@id="sidemodal-iframe"] >>> //li[contains(.,'A juntada processual foi efetuada com sucesso.')]   *=   A juntada processual foi efetuada com sucesso.
    Click        //i[@class='material-icons'][contains(.,'close')]    

Realizar vinculação de processo
    Click    //a[@href='#'][contains(.,'Juntadas/Vinculações')]
    Click    (//i[@class='material-icons'][contains(.,'add')])[3]
    sleep    3s
    Informar processo para vinculação (vinculação)
    Click        //*[@id="sidemodal-iframe"] >>> //button[contains(@id,'RowFormConfirmar')]
    Click        //*[@id="sidemodal-iframe"] >>> //input[contains(@id,'botaoSubmit')]
    Get Text     //*[@id="sidemodal-iframe"] >>> //li[contains(.,'Cadastro realizado com sucesso.')]   *=   Cadastro realizado com sucesso.
    Click        //i[@class='material-icons'][contains(.,'close')]

Realizar confirmação da juntada de documento a processo
    Click    (//a[@href='#'][contains(.,'Dados')])[1]
    Get Text    //p[contains(.,'Este Processo Digital possui documento(s).')]   *=   Este Processo Digital possui documento(s).

Realizar confirmação da juntada de processos
    Click    (//a[@href='#'][contains(.,'Dados')])[1]
    Get Text    //p[contains(.,'Este Processo Digital possui juntada processual.')]   *=   Este Processo Digital possui juntada processual.

Realizar confirmação da vinculação de processo
    Click    (//a[@href='#'][contains(.,'Dados')])[1]
    Get Text    //p[contains(.,'Este Processo Digital possui vinculações.')]   *=   Este Processo Digital possui vinculações.

Clicar em Cancelamento/reativação
    Click    //button[@id='dropDownButton']
    Click    //span[contains(.,'Cancelamento/Reativação')]

Preencher dados de cancelamento
    ${id_cancelamento}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_cancelamento}       set variable     Realizar arquivamento (id - ${id_cancelamento})
    Set Global Variable    ${texto_cancelamento}
    Fill Text    //*[@id="sidemodal-iframe"] >>> //textarea[contains(@name,'entity.deMotivo')]    ${texto_cancelamento}
    sleep    1s
    Click    //*[@id="sidemodal-iframe"] >>> //input[contains(@name,'btSalvar')]
    Click    //i[@class='material-icons'][contains(.,'close')]

Confirmar dados de cancelamento de processo
    click       //*[@id="aba_dados_adicionais"]
    Click       (//i[@class='material-icons sds-link__icon'][contains(.,'info')])[2]
    Get Text    //p[@class='sds-p'][contains(.,'${texto_cancelamento}')]   *=   ${texto_cancelamento}
    Click    //i[@class='material-icons sds-btn__icon sds-btn--right'][contains(.,'close')]
    Click    (//a[@href='#'][contains(.,'Dados')])[1]
    get Text    //p[@class='sds-p'][contains(.,'Este processo encontra-se fora da fila de trabalho. Motivo: Cancelado .')]   *=  Este processo encontra-se fora da fila de trabalho. Motivo: Cancelado .

Preencher dados de reativação de processo
    ${id_reativacao}    FakerLibrary.Random Int  min=1000  max=9000
    ${texto_reativacao}       set variable     Realizar arquivamento (id - ${id_reativacao})
    Set Global Variable    ${texto_reativacao}
    Fill Text    //*[@id="sidemodal-iframe"] >>> //textarea[contains(@name,'entity.deMotivoReativ')]    ${texto_reativacao}
    Sleep    1s
    Click    //*[@id="sidemodal-iframe"] >>> //input[contains(@name,'btSalvar')]
    Click    //i[@class='material-icons'][contains(.,'close')]

Confirmar dados de reativação de processo
    click       //*[@id="aba_dados_adicionais"]
    Get Text    (//div[contains(.,'Usuário para validação - Testes automatizados')])[14]  *=  Usuário para validação - Testes automatizados
    Click       //i[@class='material-icons sds-link__icon'][contains(.,'info')]
    Get Text    //p[@class='sds-p'][contains(.,'${texto_reativacao}')]   *=   ${texto_reativacao}
    Click    //i[@class='material-icons sds-btn__icon sds-btn--right'][contains(.,'close')]