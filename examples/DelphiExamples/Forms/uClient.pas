unit uClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry, Soap.Rio,
  Soap.SOAPHTTPClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, BrERPwscPascal,
  Vcl.ComCtrls, Vcl.Imaging.jpeg;

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
    procedure BtnCreateBPClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure SetLogin();
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HTTPRIO1AfterExecute(const MethodName: string;
      SOAPResponse: TStream);
    procedure HTTPRIO1BeforeExecute(const MethodName: string;
      SOAPRequest: TStream);
    procedure ImageMenuClick(Sender: TObject);
    procedure btnReadImageClick(Sender: TObject);
  private
    { Private declarations }
    ADLogin : ADLoginRequest;
    arg0 : ModelCRUDRequest;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

uses XMLIntf, XMLDoc, Soap.EncdDecd;

//=== Function to Convert Image to Base64 ======================================
function Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
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

//=== Create BPartner Test =====================================================vb
procedure TClient.BtnCreateBPClick(Sender: TObject);
var
  response : StandardResponse;
  data0, data1, data2 : DataField;
  dataRow : BrERPwscPascal.DataRow;
  I: Integer;
  output : outputFields;
begin  arg0 := ModelCRUDRequest.Create;
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

//=== Read Image Test ==========================================================
procedure TClient.btnReadImageClick(Sender: TObject);
var
  response : WindowTabData;
  dataRow : BrERPwscPascal.DataRow;
  I: Integer;
  X: Integer;
  Input  : TStringStream;
  Output : TBytesStream;
  fromBase : array of Byte;
begin  arg0 := ModelCRUDRequest.Create;
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
        MemoReadImage.Lines.Add('----------------------------');
        // Value to Image
        ImageReadImage.Picture := PictureFromBase64(dataRow[I].val);
      end;
    end;
  end else begin
    MemoReadImage.Lines.Add('Error: '     + response.Error);
    MemoReadImage.Lines.Add('ErrorInfo: ' + response.ErrorInfo);
  end;
end;

//=== Set Login (ADLogin) ======================================================
procedure TClient.SetLogin();
begin
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
  Document.SaveToFile(ExpandFileName(ExtractFilePath(Application.ExeName) + '..\..\..\..\' + 'documents\' +
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
  Document.SaveToFile(ExpandFileName(ExtractFilePath(Application.ExeName) + '..\..\..\..\' + 'documents\' +
        arg0.ModelCRUD.serviceType + '_Request.xml'));
  // Go back to beginning of file
  SOAPRequest.Position := 0;
end;

//=== Menu Button ==============================================================
procedure TClient.ImageMenuClick(Sender: TObject);
var imagePath : String;
begin
  if PanelLogin.Left = 0 then
    begin // Close Menu
      imagePath := ExtractFilePath(Application.ExeName) + '/../../../' + 'Resources/MenuOpen.png';
      if (FileExists(imagePath)) then
        ImageMenu.Picture.LoadFromFile(imagePath);

      while(PanelLogin.Left > (-PanelLogin.Width)+40 ) do
        PanelLogin.Left := PanelLogin.Left-5
    end
  else
    begin // Open Menu
      imagePath := ExtractFilePath(Application.ExeName) + '/../../../' + 'Resources/MenuClose.png';
      if (FileExists(imagePath)) then
        ImageMenu.Picture.LoadFromFile(imagePath);

      while(PanelLogin.Left < 0) do
        PanelLogin.Left := PanelLogin.Left+5;
    end;
  end;

end.


