unit uClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry, Soap.Rio,
  Soap.SOAPHTTPClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, BrERPwscPascal,
  Vcl.ComCtrls;

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
  private
    { Private declarations }
    ADLogin : ADLoginRequest;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

uses XMLIntf, XMLDoc;

//=== Create BPartner Test =====================================================vb
procedure TClient.BtnCreateBPClick(Sender: TObject);
var
  arg0 : ModelCRUDRequest;
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
        MethodName + 'Test_Response.xml'));
  // Go back to begin
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
        MethodName + 'Test_Request.xml'));
  // Go back to begin
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


