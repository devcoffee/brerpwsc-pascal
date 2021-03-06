unit uClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.NetEncoding, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtDlgs, Soap.EncdDecd,
  BrERPwscPascal;

type
  TClient = class(TForm)
    LabelCreateBPName: TLabel;
    LabelCreateBPValue: TLabel;
    LabelCreateBPTaxID: TLabel;
    LabelCreateBPResponse: TLabel;
    ImageLogoDev: TImage;
    EditCreateBPName: TEdit;
    EditCreateBPValue: TEdit;
    EditCreateBPTaxID: TEdit;
    BtnCreateBP: TButton;
    PanelLogin: TPanel;
    LabelUser: TLabel;
    LabelLang: TLabel;
    LabelClientID: TLabel;
    LabelRoleID: TLabel;
    LabelOrgID: TLabel;
    LabelWarehouseID: TLabel;
    LabelStage: TLabel;
    ImageLogoBrERP: TImage;
    ImageMenu: TImage;
    ImageHRMenu1: TImage;
    ImageHRMenu2: TImage;
    EditUser: TEdit;
    EditPass: TEdit;
    EditClientID: TEdit;
    EditRoleID: TEdit;
    EditOrgID: TEdit;
    EditStage: TEdit;
    EditWarehouseID: TEdit;
    EditLang: TEdit;
    BtnSave: TButton;
    BtnCancel: TButton;
    EditURL: TEdit;
    MemoCreateBPResponse: TMemo;
    HTTPRIO1: THTTPRIO;
    PageControl1: TPageControl;
    TabCreateBP: TTabSheet;
    TabReadImage: TTabSheet;
    EditReadImageID: TEdit;
    MemoReadImage: TMemo;
    btnReadImage: TButton;
    LabelReadImageResponse: TLabel;
    LabelReadImageID: TLabel;
    ImageReadImage: TImage;
    TabCreateImage: TTabSheet;
    MemoCreateImage: TMemo;
    btnCreateImage: TButton;
    LabelCreateImageResponse: TLabel;
    ImageCreateImage: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    EditCreateImageDesc: TEdit;
    LabelCreateImageDesc: TLabel;
    EditCreateImageName: TEdit;
    LabelCreateImageName: TLabel;
    TabQueryBP: TTabSheet;
    btnQueryBP: TButton;
    MemoQueryBP: TMemo;
    LabelQueryBPResponse: TLabel;
    EditQueryBPQuery: TEdit;
    LabelQueryBPQuery: TLabel;
    TabComposite: TTabSheet;
    btnComposite: TButton;
    MemoComposite: TMemo;
    ImageComposite: TImage;
    LabelCompositeResponse: TLabel;
    EditCompositeValue: TEdit;
    LabelCompositeValue: TLabel;
    EditCompositeTax: TEdit;
    LabelCompositeTax: TLabel;
    LabelCompositeHelp: TLabel;
    EditCompositeName: TEdit;
    LabelCompositeName: TLabel;
    procedure BtnCreateBPClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure SetLogin();
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HTTPRIO1AfterExecute(const MethodName: string; SOAPResponse: TStream);
    procedure HTTPRIO1BeforeExecute(const MethodName: string; SOAPRequest: TStream);
    procedure ImageMenuClick(Sender: TObject);
    procedure btnReadImageClick(Sender: TObject);
    procedure ImageCreateImageClick(Sender: TObject);
    procedure btnCreateImageClick(Sender: TObject);
    procedure btnQueryBPClick(Sender: TObject);
    procedure ImageCompositeClick(Sender: TObject);
    procedure btnCompositeClick(Sender: TObject);
  private
    { Private declarations }
    ADLogin : ADLoginRequest2;
    arg0 : ModelCRUDRequest;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

uses XMLIntf, XMLDoc;

//=== Function to Convert Image to Base64 ======================================
function Base64FromPicture(Picture: TPicture): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Picture.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

//=== Function to Convert Base64 to Image ======================================
function PictureFromBase64(const base64: string): TPicture;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TPicture.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

//=== Composite Test ===========================================================
procedure TClient.btnCompositeClick(Sender: TObject);
var
  arg1 : CompositeRequest;
  response : CompositeResponses;
  operations : BrERPwscPascal.operations;
  operation0, operation1 : operation;
  
  data0, data1, data2, data3 : DataField;
  dataRow : BrERPwscPascal.DataRow;
  I, X, J : Integer;

  compositeResponse : BrERPwscPascal.CompositeResponse;
  standardResponse : StandardResponse2;
  output : outputFields;
begin
  // Random Value and TaxID
  EditCompositeValue.Text := IntToStr(random(1000000)+5000000);
  EditCompositeTax.Text   := EditCompositeValue.Text;

  arg0 := ModelCRUDRequest.Create;// Just to show ServiceType in the name of XML
  arg1 := CompositeRequest.Create;
  // Set Login to Model CRUD Request
  arg1.ADLoginRequest := ADLogin;

  // Set CRUD Model
  arg0.ModelCRUD.serviceType := 'CompositeBPartnerTest';// Just to show ServiceType in the name of XML
  arg1.serviceType := 'CompositeBPartnerTest';

  SetLength(dataRow,3);
  // Set sending FIRST Data
  data0        := DataField.Create;
  data0.column := 'Name';
  data0.val    := EditCompositeName.Text+'_Logo';
  DataRow[0]   := data0;

  data1        := DataField.Create;
  data1.column := 'Description';
  data1.val    := EditCompositeValue.Text+'_Desc';
  DataRow[1]   := data1;

  data2        := DataField.Create;
  data2.column := 'BinaryData';
  data2.val    := Base64FromPicture(ImageCreateImage.Picture);
  DataRow[2]   := data2;

  // Create First Operation
  operation0 := Operation.Create;
  operation0.TargetPort := TargetPort.createData;
  operation0.ModelCRUD := ModelCRUD.Create;
  operation0.ModelCRUD.DataRow := dataRow;
  operation0.ModelCRUD.serviceType := 'CreateImageTest';

  SetLength(dataRow,0);
  SetLength(dataRow,4);
  // Set sending SECOND Data
    data0        := DataField.Create;
    data0.column := 'Name';
    data0.val    := EditCompositeName.Text;
    DataRow[0]   := data0;

    data1        := DataField.Create;
    data1.column := 'Value';
    data1.val    := EditCompositeValue.Text;
    DataRow[1]   := data1;

    data2        := DataField.Create;
    data2.column := 'TaxID';
    data2.val    := EditCompositeTax.Text;
    DataRow[2]   := data2;

    data3        := DataField.Create;
    data3.column := 'Logo_ID';
    data3.val    := '@AD_Image.AD_Image_ID';
    DataRow[3]   := data3;

    // Create Second Operation
    operation1 := Operation.Create;
    operation1.TargetPort := TargetPort.createData;
    operation1.ModelCRUD := ModelCRUD.Create;
    operation1.modelCRUD.DataRow := dataRow;
    operation1.modelCRUD.serviceType := 'CreateBPartnerTest';
  
  // Add Operation
  SetLength(operations,2);
  operations[0] := operation0;
  operations[0].preCommit := false;
  operations[0].postCommit := false;

  operations[1] := operation1;
  operations[1].preCommit := false;
  operations[1].postCommit := false;

  arg1.operations := operations;


  { Call GetCompositeService Method
    GetCompositeService, can be:
      GetCompositeService().compositeOperation
      GetCompositeService(UseWSDL, URL, HTTPRio).compositeOperation
          e.g. URL: 'http://teste.brerp.com.br'
  }
  response := GetCompositeService(true, EditURL.Text, HTTPRIO1).compositeOperation(arg1);

  MemoComposite.Clear;
  for X := Low(response) to High(response) do begin
    compositeResponse := response[X];
    for J := Low(compositeResponse) to High(compositeResponse) do begin
      standardResponse := compositeResponse[J];
      if (standardResponse.IsError) then
        MemoComposite.Lines.Add('Error: ' + standardResponse.Error)
      else
        for I := Low(standardResponse.outputFields) to High(standardResponse.outputFields) do begin
          output := standardResponse.outputFields[I];
          MemoComposite.Lines.Add('Column: ' + output[I].column);
          MemoComposite.Lines.Add('Value: '  + output[I].value );
          MemoComposite.Lines.Add('Text: '   + output[I].Text  );
          MemoComposite.Lines.Add('---------------------------');
        end;
    end;
  end;
end;
                            
//=== Create BPartner Test =====================================================
procedure TClient.BtnCreateBPClick(Sender: TObject);
var
  response : StandardResponse;
  data0, data1, data2 : DataField;
  dataRow : BrERPwscPascal.DataRow;
  I: Integer;
  output : outputFields;
begin
  // Random Value and TaxID
  EditCreateBPValue.Text := IntToStr(random(1000000)+5000000);
  EditCreateBPTaxID.Text := EditCreateBPValue.Text;
  EditQueryBPQuery.Text  := '%' + EditCreateBPValue.Text + '%';

  arg0 := ModelCRUDRequest.Create;
  // Set Login to Model CRUD Request
  arg0.ADLoginRequest := ADLogin;

  // Set CRUD Model
  arg0.ModelCRUD.serviceType := 'CreateBPartnerTest';

  SetLength(dataRow,3);
  // Set sending Data
  data0        := DataField.Create;
  data0.column := 'Name';
  data0.val    := EditCreateBPName.Text;
  DataRow[0]   := data0;

  data1        := DataField.Create;
  data1.column := 'Value';
  data1.val    := EditCreateBPValue.Text;
  DataRow[1]   := data1;

  data2        := DataField.Create;
  data2.column := 'TaxID';
  data2.val    := EditCreateBPTaxID.Text;
  DataRow[2]   := data2;
  // Set Array of sending Data
  arg0.ModelCRUD.DataRow := dataRow;

  { Send Request, can be:
      GetModelADService().CallMethod
      GetModelADService(UseWSDL, URL, HTTPRio).CallMethod
          e.g. URL: 'http://teste.brerp.com.br'

      CallMethod         Parameter                  Result
      -----------------|---------------------------|-------------------
      createUpdateData  (ModelCRUDRequest)	        StandardResponse
      setDocAction      (ModelSetDocActionRequest)	StandardResponse
      createData        (ModelCRUDRequest)	        StandardResponse
      deleteData        (ModelCRUDRequest)	        StandardResponse
      readData          (ModelCRUDRequest)	        WindowTabData
      getList           (ModelGetListRequest)	      WindowTabData
      runProcess        (ModelRunProcessRequest)	  RunProcessResponse
      updateData        (ModelCRUDRequest)	        StandardResponse
      queryData         (ModelCRUDRequest)	        WindowTabData
  }
  response := GetModelADService(true, EditURL.Text, HTTPRIO1).createData(arg0);

  MemoCreateBPResponse.Clear;
  if (response.IsError) then
    MemoCreateBPResponse.Lines.Add('Error: ' + response.Error)
  else
    for I := Low(response.outputFields) to High(response.outputFields) do begin
      output := response.outputFields[I];
      MemoCreateBPResponse.Lines.Add('Column: ' + output[I].column);
      MemoCreateBPResponse.Lines.Add('Value: '  + output[I].value );
      MemoCreateBPResponse.Lines.Add('Text: '   + output[I].Text  );
      MemoCreateBPResponse.Lines.Add('---------------------------');
    end;
end;

//=== Create Image Test ========================================================
procedure TClient.btnCreateImageClick(Sender: TObject);
var
  response : StandardResponse;
  data0, data1, data2 : DataField;
  dataRow : BrERPwscPascal.DataRow;
  I: Integer;
  output : outputFields;
begin
arg0 := ModelCRUDRequest.Create;
  // Set Login to Model CRUD Request
  arg0.ADLoginRequest := ADLogin;

  // Set CRUD Model
  arg0.ModelCRUD.serviceType := 'CreateImageTest';

  SetLength(dataRow,3);
  // Set sending Data
  data0        := DataField.Create;
  data0.column := 'Name';
  data0.val    := EditCreateImageName.Text;
  DataRow[0]   := data0;

  data1        := DataField.Create;
  data1.column := 'Description';
  data1.val    := EditCreateImageDesc.Text;
  DataRow[1]   := data1;

  data2        := DataField.Create;
  data2.column := 'BinaryData';
  data2.val    := Base64FromPicture(ImageCreateImage.Picture);
  DataRow[2]   := data2;
  // Set Array of sending Data
  arg0.ModelCRUD.DataRow := dataRow;

  { Send Request, can be:
      GetModelADService().CallMethod
      GetModelADService(UseWSDL, URL, HTTPRio).CallMethod
          e.g. URL: 'http://teste.brerp.com.br'

      CallMethod         Parameter                  Result
      -----------------|---------------------------|-------------------
      createUpdateData  (ModelCRUDRequest)	        StandardResponse
      setDocAction      (ModelSetDocActionRequest)	StandardResponse
      createData        (ModelCRUDRequest)	        StandardResponse
      deleteData        (ModelCRUDRequest)	        StandardResponse
      readData          (ModelCRUDRequest)	        WindowTabData
      getList           (ModelGetListRequest)	      WindowTabData
      runProcess        (ModelRunProcessRequest)	  RunProcessResponse
      updateData        (ModelCRUDRequest)	        StandardResponse
      queryData         (ModelCRUDRequest)	        WindowTabData
  }
  response := GetModelADService(true, EditURL.Text, HTTPRIO1).createData(arg0);

  MemoCreateImage.Clear;
  if (response.IsError) then
    MemoCreateImage.Lines.Add('Error: ' + response.Error)
  else
    for I := Low(response.outputFields) to High(response.outputFields) do begin
      output := response.outputFields[I];
      MemoCreateImage.Lines.Add('Column: ' + output[I].column);
      MemoCreateImage.Lines.Add('Value: '  + output[I].value );
      MemoCreateImage.Lines.Add('Text: '   + output[I].Text  );
      MemoCreateImage.Lines.Add('---------------------------');
      EditReadImageID.Text := output[I].value;
    end;
end;

//=== Query BPartner Test ======================================================
procedure TClient.btnQueryBPClick(Sender: TObject);
var
  response : WindowTabData;
  dataRow : BrERPwscPascal.DataRow;
  data0 : DataField;
  I, X: Integer;
begin  
  arg0 := ModelCRUDRequest.Create;
  // Set Login to Model CRUD Request
  arg0.ADLoginRequest := ADLogin;

  // Set CRUD Model
  arg0.ModelCRUD.serviceType := 'QueryBPartnerTest';
  
  SetLength(dataRow,1);
  // Set sending Data
  data0        := DataField.Create;
  data0.column := 'Value';
  data0.val    := EditQueryBPQuery.Text;
  DataRow[0]   := data0;

  // Set Array of sending Data
  arg0.ModelCRUD.DataRow := dataRow;

  { Send Request, can be:
      GetModelADService().CallMethod
      GetModelADService(UseWSDL, URL, HTTPRio).CallMethod
          e.g. URL: 'http://teste.brerp.com.br'

      CallMethod         Parameter                  Result
      -----------------|---------------------------|-------------------
      createUpdateData  (ModelCRUDRequest)	        StandardResponse
      setDocAction      (ModelSetDocActionRequest)	StandardResponse
      createData        (ModelCRUDRequest)	        StandardResponse
      deleteData        (ModelCRUDRequest)	        StandardResponse
      readData          (ModelCRUDRequest)	        WindowTabData
      getList           (ModelGetListRequest)	      WindowTabData
      runProcess        (ModelRunProcessRequest)	  RunProcessResponse
      updateData        (ModelCRUDRequest)	        StandardResponse
      queryData         (ModelCRUDRequest)	        WindowTabData
  }
  response := GetModelADService(true, EditURL.Text, HTTPRIO1).queryData(arg0); 

  MemoQueryBP.Clear;
  if(response.Success) then begin
    for X := Low(response.DataSet) to High(response.DataSet) do begin
      dataRow := response.DataSet[X];
      for I := Low(dataRow) to High(dataRow) do begin
        MemoQueryBP.Lines.Add(dataRow[I].column + ': ' + dataRow[I].val);
      end;                                                   
      MemoQueryBP.Lines.Add('----------------------------');
    end;
  end else begin
    MemoQueryBP.Lines.Add('Error: '     + response.Error);
    MemoQueryBP.Lines.Add('ErrorInfo: ' + response.ErrorInfo);
  end;

end;

//=== Read Image Test ==========================================================
procedure TClient.btnReadImageClick(Sender: TObject);
var
  response : WindowTabData;
  dataRow : BrERPwscPascal.DataRow;
  I: Integer;
  X: Integer;
begin  
  arg0 := ModelCRUDRequest.Create;
  // Set Login to Model CRUD Request
  arg0.ADLoginRequest := ADLogin;

  // Set CRUD Model
  arg0.ModelCRUD.serviceType := 'ReadImageTest';
  arg0.ModelCRUD.RecordID := StrToInt(EditReadImageID.Text);

  { Send Request, can be:
      GetModelADService().CallMethod
      GetModelADService(UseWSDL, URL, HTTPRio).CallMethod
          e.g. URL: 'http://teste.brerp.com.br'

      CallMethod         Parameter                  Result
      -----------------|---------------------------|-------------------
      createUpdateData  (ModelCRUDRequest)	        StandardResponse
      setDocAction      (ModelSetDocActionRequest)	StandardResponse
      createData        (ModelCRUDRequest)	        StandardResponse
      deleteData        (ModelCRUDRequest)	        StandardResponse
      readData          (ModelCRUDRequest)	        WindowTabData
      getList           (ModelGetListRequest)	      WindowTabData
      runProcess        (ModelRunProcessRequest)	  RunProcessResponse
      updateData        (ModelCRUDRequest)	        StandardResponse
      queryData         (ModelCRUDRequest)	        WindowTabData
  }
  response := GetModelADService(true, EditURL.Text, HTTPRIO1).readData(arg0);

  MemoReadImage.Clear;
  if(response.Success) then begin
    for X := Low(response.DataSet) to High(response.DataSet) do begin
      dataRow := response.DataSet[X];
      for I := Low(dataRow) to High(dataRow) do begin
        MemoReadImage.Lines.Add('Column: ' + dataRow[I].column);
        MemoReadImage.Lines.Add('Value : ' + Copy(dataRow[I].val, 0, 30) + '...');
        // Value to Image
        ImageReadImage.Picture := PictureFromBase64(dataRow[I].val);
      end;       
      MemoReadImage.Lines.Add('----------------------------');
    end;
  end else begin
    MemoReadImage.Lines.Add('Error: '     + response.Error);
    MemoReadImage.Lines.Add('ErrorInfo: ' + response.ErrorInfo);
  end;
end;

//=== Set Login (ADLogin) ======================================================
procedure TClient.SetLogin();
begin
  // Model
  ADLogin.user        := EditUser.text;
  ADLogin.pass        := EditPass.text;
  ADLogin.lang        := EditLang.text;
  ADLogin.ClientID    := StrToInt(EditClientID.text);
  ADLogin.RoleID      := StrToInt(EditRoleID.text);
  ADLogin.OrgID       := StrToInt(EditOrgID.text);
  ADLogin.WarehouseID := StrToInt(EditWarehouseID.text);
  ADLogin.stage       := StrToInt(EditStage.text);
end;

//=== Cancel Button ============================================================
procedure TClient.BtnCancelClick(Sender: TObject);
begin
  EditUser.text        := ADLogin.user;
  EditPass.text        := ADLogin.pass;
  EditLang.text        := ADLogin.lang;
  EditClientID.text    := IntToStr(ADLogin.ClientID);
  EditRoleID.text      := IntToStr(ADLogin.RoleID);
  EditOrgID.text       := IntToStr(ADLogin.OrgID);
  EditWarehouseID.text := IntToStr(ADLogin.WarehouseID );
  EditStage.text       := IntToStr(ADLogin.stage);
end;

//=== Save Button ==============================================================
procedure TClient.BtnSaveClick(Sender: TObject);
begin
  SetLogin;
end;

//=== Form Create ==============================================================
procedure TClient.FormCreate(Sender: TObject);
begin
  ADLogin := ADLoginRequest.Create();
  SetLogin;
end;

//=== After Send XML ===========================================================
procedure TClient.HTTPRIO1AfterExecute(const MethodName: string;
  SOAPResponse: TStream);
var
  Document: IXMLDocument;
begin
  SOAPResponse.Position := 0;
  // Create XML Doc
  Document := TXMLDocument.Create(nil);
  Document.Options := [];
  Document.LoadFromStream(SOAPResponse); // Get Doc from Stream
  Document.XML.Text := xmlDoc.FormatXMLData(Document.XML.Text); // Format XML
  Document.Active := true; // Active Doc
  // Save XML
  Document.SaveToFile(ExpandFileName(ExtractFilePath(Application.ExeName) + '..\..\..\' + 'documents\' +
        arg0.ModelCRUD.serviceType + '_Response.xml'));
  // Go back to beginning of file
  SOAPResponse.Position := 0;
end;

//=== Before Send XML ==========================================================
procedure TClient.HTTPRIO1BeforeExecute(const MethodName: string;
  SOAPRequest: TStream);
var
  Document: IXMLDocument;
begin
  SOAPRequest.Position := 0;
  // Create XML Doc
  Document := TXMLDocument.Create(nil);
  Document.Options := [];
  Document.LoadFromStream(SOAPRequest); // Get Doc from Stream
  Document.XML.Text := xmlDoc.FormatXMLData(Document.XML.Text); // Format XML
  Document.Active := true; // Active Doc
  // Save XML
  Document.SaveToFile(ExpandFileName(ExtractFilePath(Application.ExeName) + '..\..\..\' + 'documents\' +
        arg0.ModelCRUD.serviceType + '_Request.xml'));
  // Go back to beginning of file
  SOAPRequest.Position := 0;
end;

//=== Select Image (Composite) =================================================
procedure TClient.ImageCompositeClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    ImageComposite.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;
             
//=== Select Image (Create) ====================================================
procedure TClient.ImageCreateImageClick(Sender: TObject);
begin 
  if OpenPictureDialog1.Execute then
    ImageCreateImage.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

//=== Menu Button ==============================================================
procedure TClient.ImageMenuClick(Sender: TObject);
var imagePath : String;
begin
  if PanelLogin.Left = 0 then begin // Close Menu
    imagePath := ExtractFilePath(Application.ExeName) + '/../../' + 'Resources/MenuOpen.png';
    if (FileExists(imagePath)) then
      ImageMenu.Picture.LoadFromFile(imagePath);

    while(PanelLogin.Left > (-PanelLogin.Width)+40 ) do
      PanelLogin.Left := PanelLogin.Left-5;
  end else begin // Open Menu
    imagePath := ExtractFilePath(Application.ExeName) + '/../../' + 'Resources/MenuClose.png';
    if (FileExists(imagePath)) then
      ImageMenu.Picture.LoadFromFile(imagePath);

    while(PanelLogin.Left < 0) do
      PanelLogin.Left := PanelLogin.Left+5;
  end;
end;

end.
