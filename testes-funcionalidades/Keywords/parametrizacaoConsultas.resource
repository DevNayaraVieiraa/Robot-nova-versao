*** Settings ***
Documentation    Consiste em realizar testes automatizados nas principais funcionalidades do Solar BPM.
resource         ../../solar-parametros-funcionalidades.resource
Resource         solarBPMCadastrosKeywords.resource
Resource         solarBPMConsultasKeywords.resource
Library  Browser  run_on_failure=take screenshot
library  DateTime
Library  OperatingSystem
Library  RequestsLibrary

*** Keywords ***
Prencher campos com número do processo (autuação)
    Run Keyword If    '${mascaraConsultaProcesso}' == 'Procedencia'         Autuação - Informar processo com campo procedencia
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Orgao'               Autuação - Informar processo com campo órgao
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Numero'              Autuação - Informar processo 
    ...  ELSE         Log   Verficar parâmetro de processo para atuação

Informar processo (juntada)
    Run Keyword If    '${mascaraConsultaProcesso}' == 'Procedencia'         Juntada - Informar processo com campo procedência
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Orgao'               Juntada - Informar processo com campo órgao
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Numero'              Juntada - Informar processo 
    ...  ELSE         Log   Verficar parâmetro de processo para atuação

Informar processo para vinculação (vinculação)
    Run Keyword If    '${mascaraConsultaProcesso}' == 'Procedencia'         Vinculação - Informar processo com campo procedência
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Orgao'               Vinculação - Informar processo com campo órgao
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Numero'              Vinculação - Autuação - Informar processo 
    ...  ELSE         Log   Verficar parâmetro de processo para atuação

Prencher campos com número do processo - Consulta
    Run Keyword If    '${mascaraConsultaProcesso}' == 'Procedencia'         Informar processo com campo procedencia
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Orgao'               Informar número do processo
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Numero'              Informar número do processo

Informar número de processo no portal    
    Run Keyword If    '${mascaraConsultaProcesso}' == 'Procedencia'         Consulta com campo procedência
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Orgao'               Consulta padrão em portal
    ...  ELSE IF      '${mascaraConsultaProcesso}' == 'Numero'              Informar número do processo


##########################################################################################

Juntada - Informar processo
    fill text    //*[@id="sidemodal-iframe"] >>> (//input[@id='juntado.sgOrgaosetor'])[1]         ${orgao}
    Fill Text    //*[@id="sidemodal-iframe"] >>> (//input[@id='juntado.nuProcessooficial'])[1]    ${num_processo_para_juntada}    
    Fill Text    //*[@id="sidemodal-iframe"] >>> (//input[@id='juntado.nuAno'])[1]                ${ano_processo}    

Juntada - Informar processo com campo procedência
    ${num_processo_para_juntada}  remove String  ${num_processo_para_juntada}    ${SPACE}  I  ${orgao}
    Select Options By    //*[@id="sidemodal-iframe"] >>> //*[@id="juntado.flProcedencia"]    value   I
    Sleep    1s
    Fill Text    //*[@id="sidemodal-iframe"] >>> //*[@id="juntado.nuProcessooficial"]    ${num_processo_para_juntada}
    Fill Text    //*[@id="sidemodal-iframe"] >>> //*[@id="juntado.nuProcessooficial"]    ${num_processo_para_juntada}
    
Juntada - Informar processo com campo órgao
    Fill Text    //*[@id="sidemodal-iframe"] >>> //*[@id="juntado.nuProcessooficial"]    ${num_processo_para_juntada}


Autuação - Informar processo
    fill text    (//input[@id='procDocCorrespDTO.sgOrgaosetor'])[1]         ${orgao}
    Fill Text    (//input[@id='procDocCorrespDTO.nuProcessooficial'])[1]    ${num_processo}    
    Fill Text    (//input[@id='procDocCorrespDTO.nuAno'])[1]                ${ano_processo}
    
Autuação - Informar processo com campo procedencia
    ${processo_cor}  remove String  ${num_processo}    ${SPACE}  I  ${orgao}
    Select Options By    //select[contains(@id,'procDocCorrespDTO.flProcedencia')]    value   I
    Fill Text    //input[contains(@id,'procDocCorrespDTO.nuProcessooficial')]         ${processo_cor}

Autuação - Informar processo com campo órgao
    Fill Text    //input[@id='procDocCorrespDTO.nuProcessooficial']    ${num_processo}

Consulta padrão em portal
    Fill Text    //input[contains(@id,'sgOrgao')]    ${orgao}
    Press Keys    //input[contains(@id,'sgOrgao')]    Tab
    ${processo_portal}  remove String  ${num_processo}    ${SPACE}
    Fill Text    //input[contains(@id,'nuProcesso')]    ${processo_portal}

Consulta com campo procedência
    Fill Text    //input[contains(@id,'sgOrgao')]    ${orgao}
    Press Keys    //input[contains(@id,'sgOrgao')]   Tab
    Select Options By    //select[@id='flProcedencia']    value   I
    ${processo_cor}  remove String  ${num_processo}    ${SPACE}  I  ${orgao}
    Fill Text    //input[contains(@id,'nuProcesso')]   ${processo_cor}    

Vinculação - Informar processo com campo procedência
    ${num_processo_para_juntada}  remove String  ${num_processo_para_juntada}    ${SPACE}  I  ${orgao}
    Select Options By    //*[@id="sidemodal-iframe"] >>> (//select[@id='vinculado.flProcedencia'])[1]    value   I
    Sleep    1s
    Fill Text    //*[@id="sidemodal-iframe"] >>> (//input[@id='vinculado.nuProcessooficial'])[1]    ${num_processo_para_juntada}
    Press Keys   //*[@id="sidemodal-iframe"] >>> //input[contains(@id,'vinculado.nuProcessooficial')]    Tab

Vinculação - Informar processo com campo órgao
    Fill Text    //*[@id="sidemodal-iframe"] >>> //input[contains(@id,'vinculado.nuProcessooficial')]    ${num_processo_para_juntada}
    Press Keys   //*[@id="sidemodal-iframe"] >>> //input[contains(@id,'vinculado.nuProcessooficial')]    Tab                 

########### Consulta de processos
    
Informar processo com campo procedencia
    ${processo_cor}  remove String  ${num_processo}    ${SPACE}  I  ${orgao}
    Select Options By    //select[contains(@id,'procDocCorrespDTO.flProcedencia')]    value   I
    Fill Text    //input[contains(@id,'procDocCorrespDTO.nuProcessooficial')]         ${processo_cor}

Informar número do processo
    Fill Text    //input[@id='procDocCorrespDTO.nuProcessooficial']    ${num_processo}
    