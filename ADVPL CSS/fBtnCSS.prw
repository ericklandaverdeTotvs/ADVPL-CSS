#INCLUDE 'TOTVS.CH'
User Function fBtnCSS()
  Local cEstilo1,cEstilo2,cEstilo3 //Crio um estico para cada botão, não é necessário caso todos sejam iguais
  	
  DEFINE DIALOG oDlg TITLE "Usando estilos CSS no Protheus" FROM 180,180 TO 350,700 PIXEL
  	 	
    //Irei utilizar a classe QPushButton, ela é responsável em criar a formatação do botão. 
    cEstilo1 := "QPushButton {"  
    //Usando a propriedade background-image, inserimos a imagem que será utilizada, a imagem pode ser pega pelo repositório (RPO)
    cEstilo1 += " background-image: url(rpo:totvsprinter_spool.png);background-repeat: none; margin: 2px;" 
    cEstilo1 += " border-style: outset;"
    cEstilo1 += " border-width: 2px;"
    cEstilo1 += " border: 1px solid #C0C0C0;"
    cEstilo1 += " border-radius: 5px;"
    cEstilo1 += " border-color: #C0C0C0;"
    cEstilo1 += " font: bold 12px Arial;"
    cEstilo1 += " padding: 6px;"
    cEstilo1 += "}"

    //Na classe QPushButton:pressed , temos o efeito pressed, onde ao se pressionar o botão ele muda
    cEstilo1 += "QPushButton:pressed {"
    cEstilo1 += " background-color: #e6e6f9;"
    cEstilo1 += " border-style: inset;"
    cEstilo1 += "}"

    cEstilo2 := "QPushButton {background-image: url(rpo:totvsprinter_pdf.png);background-repeat: none; margin: 2px; "
    cEstilo2 += " border-style: outset;"
    cEstilo2 += " border-width: 2px;"
    cEstilo2 += " border: 1px solid #C0C0C0;"
    cEstilo2 += " border-radius: 0px;"
    cEstilo2 += " border-color: #C0C0C0;"
    cEstilo2 += " font: bold 12px Arial;"
    cEstilo2 += " padding: 6px;"
    cEstilo2 += "}"
    cEstilo2 += "QPushButton:pressed {"
    cEstilo2 += " background-color: #e6e6f9;"
    cEstilo2 += " border-style: inset;"
    cEstilo2 += "}"

    cEstilo3 := "QPushButton {background-image: url(rpo:totvsprinter_email.png);background-repeat: none; margin: 2px;}"

    //Cria-se os botoes normalmente, para mais detalhes das opções do botão acesse o TDN (http://tdn.totvs.com/display/tec/TButton)
    //O espaço entre a primeira aspa e o texto do botão, é necessário pois é neste espaço que a imagem entra
    oBtnImprimir := TButton():New(10,010," Imprimir"	,oDlg,{|| Alert('Botão Imprimir com efeito') },50,20,,,.F.,.T.,.F.,,.F.,,,.F. )
    oBtnPDF   	 := TButton():New(10,070," Gerar PDF"	,oDlg,{|| Alert('Botão Gerar PDF com efeito') },60,20,,,.F.,.T.,.F.,,.F.,,,.F. )
    oBtnEmail    := TButton():New(10,140," Enviar E-mail" 	,oDlg,{|| Alert('Botão Enviar E-mail com efeito') },60,20,,,.F.,.T.,.F.,,.F.,,,.F. )

    /*Neste momento, para definirmos o estilo, usaremos a propriedade SetCss, no qual informaremos a ela a variavel que contém o estilo que criamos anteriormente.*/
    oBtnImprimir:SetCss(cEstilo1) 
    oBtnPDF:SetCss(cEstilo2) 
    oBtnEmail:SetCss(cEstilo3) 
    
   ACTIVATE DIALOG oDlg CENTERED
Return
