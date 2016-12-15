#INCLUDE 'TOTVS.CH'
#INCLUDE 'ESTILOS.CH' //Incluo o arquivo que deverá ser criado com o nome ESTILOS.CH
User Function fBtnCSSNEW()
  DEFINE DIALOG oDlg TITLE "Usando estilos CSS no Protheus" FROM 180,180 TO 350,700 PIXEL	 	

    //Cria-se os botoes normalmente, para mais detalhes das opções do botão acesse o TDN (http://tdn.totvs.com/display/tec/TButton)
    //O espaço entre a primeira aspa e o texto do botão, é necessário pois é neste espaço que a imagem entra
    oBtnImprimir := TButton():New(10,010,"      Imprimir"	,oDlg,{|| Alert('Botão Imprimir com efeito') },50,20,,,.F.,.T.,.F.,,.F.,,,.F. )
    oBtnPDF   	 := TButton():New(10,070,"       Gerar PDF"	,oDlg,{|| Alert('Botão Gerar PDF com efeito') },60,20,,,.F.,.T.,.F.,,.F.,,,.F. )
    oBtnEmail    := TButton():New(10,140,"     Enviar E-mail" 	,oDlg,{|| Alert('Botão Enviar E-mail com efeito') },60,20,,,.F.,.T.,.F.,,.F.,,,.F. )

    /*Neste momento, para definirmos o estilo, usaremos a propriedade SetCss, no qual informaremos a ela a variavel que contém o estilo que criamos anteriormente.*/
    oBtnImprimir:SetCss(STYLE0000)  //Substituo pela variavel que criei no arquivo estilos.ch
    oBtnPDF:SetCss(STYLE0002)    //Substituo pela variavel que criei no arquivo estilos.ch
    oBtnEmail:SetCss(STYLE0003)    //Substituo pela variavel que criei no arquivo estilos.ch
    
   ACTIVATE DIALOG oDlg CENTERED
Return
